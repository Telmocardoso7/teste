using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.Common;
using eBankit.FE.Simulators.Common.Interfaces;
using eBankit.FE.Simulators.CTI.Context;
using eBankit.FE.Simulators.CTI.Context.Interfaces;
using eBankit.FE.Simulators.CTI.Services.Interfaces;
using eBankit.FE.Simulators.CTI.ViewModels;
using eBankit.LIB.ApiModel.ContactCenter;
using eBankit.LIB.ApiModel.ExtendedProperties;
using eBankit.LIB.ApiModel.Interaction.Enums;
using Ebankit.Core.MultiTenancy.Common;
using Ebankit.Core.MultiTenancy.Common.Retriever.Interfaces;
using IdentityModel.Client;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.CTI.Services
{
    public class CtiService : ICtiService
    {
        public ConcurrentDictionary<Guid, AuthToken> Tokens { get; set; }

        private readonly ICtiSettings _settings;
        private readonly IOptionsMonitor<IdentitySettings> _identitySettingsMonitor;
        private readonly ITokenService _tokenService;
        private readonly ITenantRetriever _tenantRetriever;
        private readonly IHttpClientFactory _httpClientFactory;

        public CtiService(
            ICtiSettings settings,
            IOptionsMonitor<IdentitySettings> identitySettingsMonitor,
            ITokenService tokenService,
            ITenantRetriever tenantRetriever,
            IHttpClientFactory httpClientFactory)
        {
            _settings = settings;
            _tokenService = tokenService;
            _tenantRetriever = tenantRetriever;
            _httpClientFactory = httpClientFactory;
            _identitySettingsMonitor = identitySettingsMonitor;
            Tokens = new ConcurrentDictionary<Guid, AuthToken>();
        }

        public ServiceResult<string> RegisterUser(string extension, string username)
        {
            var userExtension = new UserExtension
            {
                Extension = extension,
                UserId = username
            };

            var result = Post<string, UserExtension>(_settings.Interaction.RegisterExtension, userExtension).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> UnRegisterUser(string extension, string username)
        {

            var userExtension = new UserExtension
            {
                Extension = extension,
                UserId = username
            };

            var result = Post<bool, UserExtension>(_settings.Interaction.UnRegisterExtension, userExtension).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<Guid> NewInteraction(EbankitInteractionType interactionType)
        {
            var url = $"{_settings.Interaction.NewInteraction}?interactionType={interactionType.ToString()}";

            var result = Get<Guid>(url)
                .GetAwaiter()
                .GetResult();

            return result;
        }

        public ServiceResult<bool> CloseInteraction(Guid interaction)
        {
            var dic = new Dictionary<string, string>
            {
                { "InteractionId", interaction.ToString() },
            };

            var result = Post<bool, Dictionary<string, string>>(_settings.Interaction.CloseInteraction, dic).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> IncomingCall(string extension, Guid interaction)
        {
            var incomingCall = new IncommingCall
            {
                InteractionId = interaction,
                Destination = extension
            };
            var result = Post<bool, IncommingCall>(_settings.Interaction.CallIncoming, incomingCall).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> StartCall(IncommingCall incommingCall)
        {
            var result = Post<bool, IncommingCall>(_settings.Interaction.CallStarted, incommingCall).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> EndCall(string extension, Guid interaction, bool closeAutomatic, string reason)
        {
            var endCall = new IncommingCall
            {
                InteractionId = interaction,
                Destination = extension,
                AutomaticClose = closeAutomatic,
                Reason = reason
            };

            var result = Post<bool, IncommingCall>(_settings.Interaction.CallEnd, endCall).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> TransferCall(string fromExtension, string toExtension, Guid interaction, string route)
        {
            var incommingCall = new LIB.ApiModel.ContactCenter.TransferCall
            {
                InteractionId = interaction,
                Origin = fromExtension,
                Destination = toExtension,
                Route = route
            };

            var result = Post<bool, LIB.ApiModel.ContactCenter.TransferCall>(_settings.Interaction.CallTransfer, incommingCall).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> IncomingEmail(string extension, Guid interaction, Guid emailId, string emailFrom, DateTime emailReceivedAt, string emailSubject, string emailBody)
        {

            var incommingEmail = new IncomingEmail
            {
                EmailDetails = new Email
                {
                    EmailId = emailId.ToString(),
                    From = emailFrom,
                    ReceivedAt = emailReceivedAt,
                    Subject = emailSubject,
                    Body = emailBody
                },
                Destination = extension,
                InteractionId = interaction
            };

            var result = Post<bool, IncomingEmail>(_settings.Interaction.EmailIn, incommingEmail).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> IdentifyCall(Guid interaction, string clientNumber)
        {
            var identification = new IdentificationByClientNumber
            {
                InteractionId = interaction,
                ClientNumber = clientNumber
            };
            var result = Post<bool, IdentificationByClientNumber>(_settings.Ivr.IdentifyByClientNumber, identification).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> AutenticateCall(Guid interaction, string clientNumber, string accessCode)
        {
            ServiceResult<bool> result;
            if (string.IsNullOrEmpty(accessCode))
            {
                var identification = new IdentificationByClientNumber
                {
                    ClientNumber = clientNumber,
                    InteractionId = interaction
                };

                result = Post<bool, IdentificationByClientNumber>(_settings.Ivr.LoginByClientNumberWithoutAccessCode, identification).GetAwaiter().GetResult();

                return result;
            }

            var authenticate = new AuthenticationByClientNumber
            {
                AccessCode = accessCode,
                ClientNumber = clientNumber,
                InteractionId = interaction
            };

            result = Post<bool, AuthenticationByClientNumber>(_settings.Ivr.LoginByClientNumber, authenticate).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> DoTransferMoney(TransferMoney transferMoney)
        {
            var transfer = new TransferCti
            {
                InteractionId = transferMoney.InteractionId,
                AccountNumber = transferMoney.AccountNumber,
                BranchId = transferMoney.BranchId,
                DestinationAccountNumber = transferMoney.DestinationAccountNumber,
                Amount = transferMoney.Amount,
                Currency = transferMoney.Currency,
                Date = transferMoney.Date,
                Description = transferMoney.Description,
                TotalRecurrences = transferMoney.TotalRecurrences
            };

            var result = Post<bool, TransferCti>(_settings.Ivr.MoneyTransferInterAccounts, transfer).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> TransferCallToIvr(Guid interaction, string fromExtension)
        {
            var transferToIvr = new IncomingCallIvr
            {
                InteractionId = interaction,
                Origin = fromExtension
            };

            var result = Post<bool, IncomingCallIvr>(_settings.Ivr.TransferToIvr, transferToIvr).GetAwaiter().GetResult();

            return result;

        }

        public ServiceResult<bool> TransferCallFromIvr(IncommingCall callFromIvr)
        {
            var result = Post<bool, IncommingCall>(_settings.Ivr.TransferFromIvr, callFromIvr).GetAwaiter().GetResult();

            return result;
        }

        /// <summary>
        /// POST Method
        /// </summary>
        /// <typeparam name="T">The output type</typeparam>
        /// <typeparam name="E">The input type</typeparam>
        /// <param name="url"></param>
        /// <param name="input"></param>
        /// <param name="extendedProperties"></param>
        /// <returns></returns>
        public async Task<ServiceResult<T>> Post<T, E>(string url, E input, object extendedProperties = null)
        {
            try
            {
                var httpClient = CreateHttpClient();
                httpClient.DefaultRequestHeaders.Accept.Clear();
                httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                var wrapperObject = EbankitBodyWrapperHelper.WrapExtendedProperties(input, extendedProperties);

                var contentToSend = (extendedProperties != null)
                        ? new StringContent(JsonConvert.SerializeObject(wrapperObject), Encoding.UTF8, "application/json")
                        : new StringContent(JsonConvert.SerializeObject(input), Encoding.UTF8, "application/json");

                var result = default(ServiceResult<T>);
                var response = await httpClient.PostAsync(url, contentToSend);
                if (response.IsSuccessStatusCode)
                {
                    var content = await response.Content.ReadAsStringAsync();
                    result = JsonConvert.DeserializeObject<ServiceResult<T>>(content);
                }
                else
                {
                    result = JsonConvert.DeserializeObject<ServiceResult<T>>(response.Content.ReadAsStringAsync().Result);

                    if (result?.Error == null)
                    {
                        return new ServiceResult<T>
                        {
                            Error = new ServiceError(response.StatusCode.ToString(), response.ReasonPhrase),
                            Status = ServiceStatus.NOK
                        };
                    }
                    return new ServiceResult<T>
                    {
                        Error = result.Error,
                        Status = ServiceStatus.NOK
                    };
                }

                return result;
            }
            catch (Exception ex)
            {
                return new ServiceResult<T>
                {
                    Error = new ServiceError("500", ex.Message),
                    Status = ServiceStatus.NOK
                };
            }
        }

        public async Task<ServiceResult<T>> Get<T>(string url, params string[] inputArgs)
        {
            try
            {
                var httpClient = CreateHttpClient();

                var args = string.Empty;
                if (inputArgs != null)
                {
                    args = inputArgs.Aggregate(args, (current, a) => string.Format("{0}/{1}", current, a));
                }

                ServiceResult<T> result;
                var response = await httpClient.GetAsync($"{url}{args}");
                if (response.IsSuccessStatusCode)
                {
                    var content = await response.Content.ReadAsStringAsync();
                    result = JsonConvert.DeserializeObject<ServiceResult<T>>(content);
                }
                else
                {
                    result = JsonConvert.DeserializeObject<ServiceResult<T>>(response.Content.ReadAsStringAsync().Result);

                    if (result?.Error == null)
                    {
                        return new ServiceResult<T>
                        {
                            Error = new ServiceError(response.StatusCode.ToString(), response.ReasonPhrase),
                            Status = ServiceStatus.NOK
                        };
                    }
                    return new ServiceResult<T>
                    {
                        Error = result.Error,
                        Status = ServiceStatus.NOK
                    };
                }

                return result;
            }
            catch (Exception ex)
            {
                return new ServiceResult<T>
                {
                    Error = new ServiceError("500", ex.Message),
                    Status = ServiceStatus.NOK
                };
            }
        }

        public ServiceResult<bool> IgnoreCall(Guid interaction)
        {
            var dic = new Dictionary<string, string>
            {
                { "InteractionId", interaction.ToString() },
            };

            var result = Post<bool, Dictionary<string, string>>(_settings.Interaction.IgnoreCall, dic).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<UserCtiConnection> GetUserActiveConnection(string username)
        {
            var url = $"{_settings.Interaction.UserStatus}?userId={username}";
            var result = Get<UserCtiConnection>(url).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> RemoveHoldCallInOperator(string username, string extension, Guid interactionId)
        {
            var input = new CallOnHold()
            {
                InteractionId = interactionId,
                UserConnection = new UserExtension()
                {
                    Extension = extension,
                    UserId = username
                }
            };
            var result = Post<bool, CallOnHold>(_settings.Interaction.RemoveHoldCallInOperatorFromIvr, input).GetAwaiter().GetResult();
            return result;
        }


        private AuthToken GetAuthToken()
        {
            var tenantId = Guid.Empty;
            var tenant = _tenantRetriever.Get();
            if (tenant != null)
                tenantId = tenant.Id;

            AuthToken authToken;
            if (!(Tokens.TryGetValue(tenant.Id, out authToken)
                && authToken != null
                && !string.IsNullOrEmpty(authToken.Token)
                && DateTime.Now <= authToken.TokenExpiresAt))
            {
                authToken = new AuthToken();
                var identitySettings = _identitySettingsMonitor.Get(tenantId.ToString());
                var tokenResponse = _tokenService.GetToken(identitySettings.ClientId, identitySettings.ClientSecret, _settings.IdentityClient.Scope).GetAwaiter().GetResult();
                authToken.Token = tokenResponse.AccessToken;
                authToken.TokenExpiresAt = DateTime.Now.AddSeconds(tokenResponse.ExpiresIn);
                Tokens.AddOrUpdate(tenantId, authToken, (id, obj) => authToken);
            }

            return authToken;
        }

        private string GetToken()
        {
            return GetAuthToken().Token;
        }

        private HttpClient CreateHttpClient()
        {
            var accessToken = GetToken();

            var httpClient = _httpClientFactory.CreateClient();
            httpClient.BaseAddress = new Uri(_settings.Base);

            if (!string.IsNullOrEmpty(accessToken))
                httpClient.SetBearerToken(accessToken);

            httpClient.DefaultRequestHeaders.Add(Constants.EbankitTenantKey, _tenantRetriever.Get().Id.ToString());

            return httpClient;
        }

    }
}