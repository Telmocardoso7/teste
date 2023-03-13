using System;
using System.Collections.Generic;
using System.Linq;
using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.CTI.Context.Interfaces;
using eBankit.FE.Simulators.CTI.Models;
using eBankit.FE.Simulators.CTI.Services.Interfaces;
using eBankit.FE.Simulators.CTI.ViewModels;
using eBankit.LIB.ApiModel.Interaction.Enums;

namespace eBankit.FE.Simulators.CTI.Context
{
    public class CtiContext : ICtiContext
    {
        public CtiManagement Managment
        {
            get => _cacheManager.GetCache<CtiManagement>(nameof(CtiManagement)) ?? new CtiManagement();
            set => _cacheManager.SaveCache(nameof(CtiManagement), value);
        }

        private string _selectUsername;

        public string SelectUsername
        {
            get => _selectUsername ?? _cacheManager.GetSession<string>("SelectUsername") ?? string.Empty;
            set
            {
                _cacheManager.SaveSession("SelectUsername", value);
                _selectUsername = value;
            }
        }

        private readonly ICtiService _service;
        private readonly IErrorContext _errorContext;
        private readonly ICacheManager _cacheManager;

        public CtiContext(ICtiService service, IErrorContext errorContext, ICacheManager cacheManager)
        {
            _service = service;
            _errorContext = errorContext;
            _cacheManager = cacheManager;

            if (Managment == null)
            {
                Managment = new CtiManagement();
            }
        }

        public UserManagement GetUserByExtension(string extension)
        {
            var user = GetUserFromManagementByExtension(Managment, extension);
            return user;
        }

        public void NewCall(EbankitInteractionType interactionType, bool newServiceInteraction)
        {
            var managment = Managment;

            if (newServiceInteraction)
            {
                var result = _service.NewInteraction(interactionType);

                if (result.Status == ServiceStatus.OK)
                {
                    managment.PendingInteractions.Add(new InteractionManagement
                    {
                        InteractionType = InteractionManagementType.Call,
                        Attended = false,
                        Identifier = result.Result,
                        StartedCall = DateTime.Now,
                    });
                }

                _errorContext.AddMessage(result);
            }
            else
            {
                managment.PendingInteractions.Add(new InteractionManagement
                {
                    InteractionType = InteractionManagementType.Call,
                    Attended = false,
                    Identifier = Guid.Empty,
                    StartedCall = DateTime.Now,
                });
            }

            Managment = managment;
        }

        public Guid NewInteraction(EbankitInteractionType interactionType)
        {
            Guid identifier = Guid.Empty;
            var managment = Managment;

            var result = _service.NewInteraction(interactionType);

            if (result.Status == ServiceStatus.OK)
            {
                managment.PendingInteractions.First(x => x.Identifier == Guid.Empty).Identifier = result.Result;
                identifier = result.Result;
            }

            Managment = managment;

            return identifier;
        }

        public void NewEmail()
        {
            var managment = Managment;

            var result = _service.NewInteraction(EbankitInteractionType.Email);

            if (result.Status == ServiceStatus.OK)
            {
                managment.PendingInteractions.Add(new InteractionManagement
                {
                    InteractionType = InteractionManagementType.Email,
                    Attended = false,
                    Identifier = result.Result,
                    StartedCall = DateTime.Now,
                });
            }

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void CloseInteraction(Guid interaction)
        {
            var managment = Managment;

            var result = _service.CloseInteraction(interaction);

            if (result.Status == ServiceStatus.OK)
            {
                var call = managment.PendingInteractions.First(x => x.Identifier == interaction);

                if (!string.IsNullOrEmpty(call.UserOnHoldTransferBackToIvr))
                {
                    var userExtension = GetUserFromManagementByName(managment, call.UserOnHoldTransferBackToIvr);
                    if (userExtension != null)
                    {
                        _service.RemoveHoldCallInOperator(userExtension.Username, userExtension.Extension, interaction);
                    }
                }

                managment.PendingInteractions.Remove(call);
            }

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void CloseEmailOnExtension(Guid interaction)
        {
            var managment = Managment;


            var user = GetSelectUser(managment);

            var call = user.Interactions.First(x => x.Identifier == interaction);
            user.Interactions.Remove(call);

            Managment = managment;
        }

        public void AddUser(string username, string extension)
        {
            var searchUserInSimulatorResult = GetUserFromManagementByName(Managment, username);
            if (searchUserInSimulatorResult != null)
            {
                _errorContext.AddMessage(new ServiceResult<bool>()
                {
                    Result = false,
                    Error = new ServiceError("500", "User already added in simulator."),
                    Status = ServiceStatus.NOK
                });
                return;
            }

            var managment = Managment;

            var result = _service.RegisterUser(extension, username);
            if (result.Status == ServiceStatus.OK)
            {
                managment.Users.Add(new UserManagement
                {
                    Username = username,
                    Extension = extension,
                    Interactions = new List<InteractionManagement>()
                });
                SetUser(username);
                _errorContext.AddMessage(result);
            }
            else
            {
                var resultGetUserExtension = _service.GetUserActiveConnection(username);
                if (resultGetUserExtension.Status != ServiceStatus.OK)
                {
                    _errorContext.AddMessage(result);
                    return;
                }

                var userConnection = resultGetUserExtension.Result;

                var user = new UserManagement
                {
                    Username = username,
                    Extension = userConnection.Extension,
                    Interactions = new List<InteractionManagement>()
                };

                if (userConnection.AgentSessions != null && userConnection.AgentSessions.Any())
                {
                    var agentSession = userConnection.AgentSessions.FirstOrDefault(o => o.InteractionId != Guid.Empty && (o.SessionType == EbankitInteractionType.Voice || o.SessionType == EbankitInteractionType.Voice_Outbound));
                    if (agentSession != null)
                    {
                        user.Interactions.Add(new InteractionManagement()
                        {
                            InteractionType = InteractionManagementType.Call,
                            Attended = true,
                            Identifier = agentSession.InteractionId,
                            StartedCall = DateTime.Now,
                            ClientNumber = agentSession.CustomerNumber,
                            Authenticate = !string.IsNullOrEmpty(agentSession.CustomerNumber)
                        });
                    }
                }

                managment.Users.Add(user);
                SetUser(username);
                _errorContext.AddMessage(resultGetUserExtension);
            }

            Managment = managment;
        }

        public void LogoutUser(string username, bool forceLogout)
        {
            var managment = Managment;

            SetUser(username);
            var user = GetSelectUser(managment);

            var result = _service.UnRegisterUser(user.Extension, username);

            if (result.Status == ServiceStatus.OK || forceLogout)
            {
                managment.Users.Remove(user);
                SelectUsername = string.Empty;
            }

            if (forceLogout && result.Status != ServiceStatus.OK)
            {
                _errorContext.AddMessage(new ServiceResult<bool>()
                {
                    Result = true,
                    Status = ServiceStatus.OK
                });
            }

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void SetUser(string selectusername)
        {
            SelectUsername = selectusername;
        }

        public void AssignInteraction(string extension, Guid interaction, string emailFrom = "", string emailSubject = "", string emailBody = "")
        {
            var managment = Managment;

            var call = managment.PendingInteractions.First(x => x.Identifier == interaction);

            if (call.InteractionType == InteractionManagementType.Call)
            {
                var result = _service.IncomingCall(extension, interaction);

                if (result.Status == ServiceStatus.OK)
                {

                    managment.PendingInteractions.Remove(call);

                    SetUser(managment.Users.First(x => x.Extension == extension).Username);
                    var user = GetSelectUser(managment);

                    call.BlindTransfered = false;
                    user.Interactions.Add(call);
                }

                _errorContext.AddMessage(result);
            }
            else if (call.InteractionType == InteractionManagementType.Email)
            {
                var result = _service.IncomingEmail(extension, interaction, Guid.NewGuid(), emailFrom, DateTime.Now, emailSubject, emailBody);

                if (result.Status == ServiceStatus.OK)
                {
                    managment.PendingInteractions.Remove(call);

                    SetUser(managment.Users.First(x => x.Extension == extension).Username);
                    var user = GetSelectUser(managment);

                    user.Interactions.Add(call);
                }

                _errorContext.AddMessage(result);
            }

            Managment = managment;
        }

        public void AssignIncomingInteraction(string extension, Guid interaction, string emailFrom = "", string emailSubject = "", string emailBody = "")
        {
            var managment = Managment;

            var call = managment.IncomingCalls.First(x => x.Identifier == interaction);

            if (call.InteractionType == InteractionManagementType.Call)
            {
                managment.IncomingCalls.Remove(call);

                SetUser(managment.Users.First(x => x.Extension == extension).Username);
                var user = GetSelectUser(managment);

                user.Interactions.Add(call);

            }
            Managment = managment;
        }

        public void StartCall(string username, Guid identifier, Dictionary<string, string> paramsExtra, string route, string navigation = null)
        {
            var managment = Managment;

            SetUser(username);

            var user = GetSelectUser(managment);

            var incomingCall = new LIB.ApiModel.ContactCenter.IncommingCall
            {
                Destination = user.Extension,
                InteractionId = identifier,
                ExtraParameters = paramsExtra,
                Route = route,
                Navigation = navigation

            };

            var result = _service.StartCall(incomingCall);

            if (result.Status == ServiceStatus.OK)
            {
                var interaction = user.Interactions.First(x => x.Identifier == identifier);
                interaction.Attended = true;
                interaction.extraParams = paramsExtra;
                user.Interactions.First(x => x.Identifier == identifier).Attended = true;
            }
            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void EndCall(string username, Guid identifier, bool closeAutomatic, string reason, bool forceEndCall)
        {
            var managment = Managment;

            SetUser(username);

            var user = GetSelectUser(managment);

            var result = _service.EndCall(user.Extension, identifier, closeAutomatic, reason);

            if (result.Status == ServiceStatus.OK || forceEndCall)
            {
                var call = user.Interactions.First(x => x.Identifier == identifier);
                user.Interactions.Remove(call);
            }

            if (forceEndCall && result.Status != ServiceStatus.OK)
            {
                _errorContext.AddMessage(new ServiceResult<bool>()
                {
                    Result = true,
                    Status = ServiceStatus.OK
                });
            }

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void TransferCall(Guid identifier, string username, string toExtension, string route)
        {
            var managment = Managment;

            SetUser(username);
            var user = GetSelectUser(managment);

            var result = _service.TransferCall(user.Extension, toExtension, identifier, route);

            if (result.Status == ServiceStatus.OK)
            {
                var call = user.Interactions.First(x => x.Identifier == identifier);
                user.Interactions.Remove(call);

                var usernameTo = managment.Users.First(x => x.Extension == toExtension).Username;
                SetUser(usernameTo);
                user = GetSelectUser(managment);
                user.Interactions.Add(call);
            }

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void IdentifyCall(Guid identifier, string clientNumber)
        {
            var managment = Managment;

            var result = _service.IdentifyCall(identifier, clientNumber);

            if (result.Status == ServiceStatus.OK)
            {
                var call = managment.PendingInteractions.First(x => x.Identifier == identifier);
                call.ClientNumber = clientNumber;
                call.Authenticate = false;
            }

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void AuthenticateCall(Guid identifier, string clientNumber, string accessCode)
        {
            var managment = Managment;

            var result = _service.AutenticateCall(identifier, clientNumber, accessCode);

            if (result.Status == ServiceStatus.OK)
            {
                var call = managment.PendingInteractions.First(x => x.Identifier == identifier);
                call.ClientNumber = clientNumber;
                call.Authenticate = true;
            }

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void DoTransferMoney(TransferMoney transferMoney)
        {
            var managment = Managment;

            var result = _service.DoTransferMoney(transferMoney);

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void TransferCallToIvr(Guid identifier, string username)
        {
            var managment = Managment;

            SetUser(username);
            var user = GetSelectUser(managment);

            var result = _service.TransferCallToIvr(identifier, user.Extension);

            if (result.Status == ServiceStatus.OK)
            {
                var call = user.Interactions.First(x => x.Identifier == identifier);
                user.Interactions.Remove(call);

                call.TransferBackToIvr = true;
                call.UserOnHoldTransferBackToIvr = user.Username;
                managment.PendingInteractions.Add(call);
            }

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void TransferCallFromIvr(Guid identifier)
        {
            var managment = Managment;

            var call = managment.PendingInteractions.First(x => x.Identifier == identifier);
            var username = call.UserOnHoldTransferBackToIvr;
            SetUser(username);
            var user = GetSelectUser(managment);

            var callFromIvr = new LIB.ApiModel.ContactCenter.IncommingCall
            {
                Destination = user.Extension,
                InteractionId = identifier,
                ExtraParameters = call.extraParams
            };

            var result = _service.TransferCallFromIvr(callFromIvr);

            if (result.Status == ServiceStatus.OK)
            {
                call.TransferBackToIvr = false;
                call.UserOnHoldTransferBackToIvr = null;
                managment.PendingInteractions.Remove(call);


                user.Interactions.Add(call);
            }

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void TransferCallFromMediaBar(Guid identifier, string fromExtension, string toExtension)
        {
            var managment = Managment;

            var user = GetUserFromManagementByExtension(managment, fromExtension);

            var call = user.Interactions.First(x => x.Identifier == identifier);
            var userCall = user.Interactions.First(x => x.Identifier == identifier);

            if (userCall != null)
            {
                user.Interactions.Remove(call);
                var usernameTo = managment.Users.First(x => x.Extension == toExtension).Username;
                SetUser(usernameTo);
                user = GetUserFromManagementByExtension(managment, toExtension);
                user.Interactions.Add(call);

                Managment = managment;
            }
        }

        public void AddIncomingCall(LIB.ApiModel.ContactCenter.IncommingCall incommingCall)
        {
            var managment = Managment;

            if (managment.IncomingCalls == null)
            {
                managment.IncomingCalls = new List<InteractionManagement>();
            }
            managment.IncomingCalls.Add(new InteractionManagement
            {
                InteractionType = InteractionManagementType.Call,
                Attended = false,
                Identifier = incommingCall.InteractionId,
                StartedCall = DateTime.Now,
                ClientNumber = incommingCall.Origin,
                DestinationNumber = incommingCall.Destination
            });

            Managment = managment;
        }

        public void IgnoreCall(Guid interaction)
        {
            var managment = Managment;

            var result = _service.IgnoreCall(interaction);

            if (result.Status == ServiceStatus.OK)
            {
                var call = managment.IncomingCalls.First(x => x.Identifier == interaction);
                managment.IncomingCalls.Remove(call);
            }

            _errorContext.AddMessage(result);
            Managment = managment;
        }

        public void CallAnswer(string username, Guid identifier)
        {
            var managment = Managment;

            SetUser(username);

            var user = GetSelectUser(managment);

            user.Interactions.First(x => x.Identifier == identifier).Attended = true;

            Managment = managment;
        }

        public void CallHangUp(string username, Guid identifier)
        {
            var managment = Managment;

            SetUser(username);

            var user = GetSelectUser(managment);

            var call = user.Interactions.First(x => x.Identifier == identifier);

            user.Interactions.Remove(call);

            Managment = managment;
        }

        public void FreeUserExtension(string username)
        {
            var managment = Managment;
            SetUser(username);
            var user = GetSelectUser(managment);
            user.Interactions.RemoveAll(i => i != null);
            _errorContext.AddMessage(new ServiceResult<bool>(true));
            Managment = managment;
        }

        public void RemoveInteraction(Guid interactionId, string username)
        {
            var managment = Managment;
            var pendingCall = managment.PendingInteractions.FirstOrDefault(x => x.Identifier == interactionId);
            if (pendingCall != null)
                managment.PendingInteractions.Remove(pendingCall);

            if (!string.IsNullOrEmpty(username))
            {
                SetUser(username);
                var user = GetSelectUser(managment);
                var userCall = user.Interactions.FirstOrDefault(x => x.Identifier == interactionId);
                if (userCall != null)
                    user.Interactions.Remove(userCall);
            }

            Managment = managment;
        }

        public void BlindTransferCallFromAgent(string username, Guid identifier)
        {
            var managment = Managment;

            SetUser(username);
            var user = GetSelectUser(managment);

            var call = user.Interactions.First(x => x.Identifier == identifier);
            user.Interactions.Remove(call);

            if (!string.IsNullOrEmpty(call.ClientNumber))
            {
                var resultAuthClient = _service.AutenticateCall(identifier, call.ClientNumber, null);
                _errorContext.AddMessage(resultAuthClient);
            }
            else
            {
                _errorContext.AddMessage(new ServiceResult<bool>()
                {
                    Result = true,
                    Status = ServiceStatus.OK
                });
            }

            call.TransferBackToIvr = false;
            call.BlindTransfered = true;
            call.Attended = false;
            call.UserOnHoldTransferBackToIvr = null;
            managment.PendingInteractions.Add(call);

            Managment = managment;
        }


        #region private methods
        private UserManagement GetSelectUser(CtiManagement managment)
        {
            return GetUserFromManagementByName(managment, SelectUsername);
        }

        private UserManagement GetUserFromManagementByExtension(CtiManagement managment, string extension)
        {
            return managment.Users.FirstOrDefault(x => x.Extension == extension);
        }

        private UserManagement GetUserFromManagementByName(CtiManagement managment, string name)
        {
            return managment.Users.FirstOrDefault(x => x.Username.Equals(name, StringComparison.InvariantCultureIgnoreCase));
        }

        #endregion
    }
}
