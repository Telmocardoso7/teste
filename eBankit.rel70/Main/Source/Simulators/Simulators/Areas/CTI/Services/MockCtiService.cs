using System;
using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.CTI.Services.Interfaces;
using eBankit.FE.Simulators.CTI.ViewModels;
using eBankit.LIB.ApiModel.Interaction.Enums;

namespace eBankit.FE.Simulators.CTI.Services
{
    public class MockCtiService : ICtiService
    {
        public ServiceResult<string> RegisterUser(string extension, string username)
        {
            return new ServiceResult<string>
            {
                Error = null,
                Result = string.Empty,
                Status = ServiceStatus.OK
            };
        }

        public ServiceResult<bool> UnRegisterUser(string extension, string username)
        {
            return ReturnOk();
        }

        public ServiceResult<Guid> NewInteraction(EbankitInteractionType ebankitInteractionType = EbankitInteractionType.Voice)
        {
            return new ServiceResult<Guid>
            {
                Error = null,
                Result = Guid.NewGuid(),
                Status = ServiceStatus.OK
            };
        }

        public ServiceResult<bool> CloseInteraction(Guid interaction)
        {
            return ReturnOk();
        }

        public ServiceResult<bool> IncomingCall(string username, Guid interaction)
        {
            return ReturnOk();
        }

        public ServiceResult<bool> StartCall(LIB.ApiModel.ContactCenter.IncommingCall incommingCall)
        {
            return ReturnOk();
        }

        public ServiceResult<bool> EndCall(string extension, Guid interaction, bool closeAutomatic, string reason)
        {
            return ReturnOk();
        }

        public ServiceResult<bool> TransferCall(string fromExtension, string toExtension, Guid interaction, string route)
        {
            return ReturnOk();
        }

        public ServiceResult<bool> IncomingEmail(string username, Guid interaction, Guid emailId, string emailFrom, DateTime emailReceivedAt, string emailSubject, string emailBody)
        {
            return ReturnOk();
        }

        public ServiceResult<bool> IdentifyCall(Guid interaction, string clientNumber)
        {
            return ReturnOk();
        }

        public ServiceResult<bool> AutenticateCall(Guid interaction, string clientNumber, string accessCode)
        {
            return ReturnOk();
        }

        public ServiceResult<bool> DoTransferMoney(TransferMoney transferMoney)
        {
            return ReturnOk();
        }

        public ServiceResult<bool> TransferCallToIvr(Guid interaction, string fromExtension)
        {
            return ReturnOk();
        }

        public ServiceResult<bool> TransferCallFromIvr(LIB.ApiModel.ContactCenter.IncommingCall callFromIvr)
        {
            return ReturnOk();
        }

        private static ServiceResult<bool> ReturnOk()
        {
            return new ServiceResult<bool>
            {
                Error = null,
                Result = true,
                Status = ServiceStatus.OK
            };
        }

        public ServiceResult<bool> IgnoreCall(Guid interaction)
        {
            return ReturnOk();
        }

        public ServiceResult<LIB.ApiModel.ContactCenter.UserCtiConnection> GetUserActiveConnection(string username)
        {
            return new ServiceResult<LIB.ApiModel.ContactCenter.UserCtiConnection>()
            {
                Error = null,
                Result = new LIB.ApiModel.ContactCenter.UserCtiConnection()
                {
                    Username = username,
                    Extension = String.Empty
                },
                Status = ServiceStatus.OK
            };
        }

        public ServiceResult<bool> RemoveHoldCallInOperator(string username, string extension, Guid interactionId)
        {
            return ReturnOk();
        }
    }
}
