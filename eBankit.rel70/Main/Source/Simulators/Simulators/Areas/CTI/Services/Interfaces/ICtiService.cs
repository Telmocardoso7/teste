using System;
using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.CTI.ViewModels;
using eBankit.LIB.ApiModel.ContactCenter;
using eBankit.LIB.ApiModel.Interaction.Enums;

namespace eBankit.FE.Simulators.CTI.Services.Interfaces
{
    public interface ICtiService
    {
        ServiceResult<string> RegisterUser(string extension, string username);

        ServiceResult<bool> UnRegisterUser(string extension, string username);

        ServiceResult<Guid> NewInteraction(EbankitInteractionType ebankitInteractionType = EbankitInteractionType.Voice);

        ServiceResult<bool> CloseInteraction(Guid interaction);

        ServiceResult<bool> IncomingCall(string username, Guid interaction);

        ServiceResult<bool> StartCall(IncommingCall incommingCall);

        ServiceResult<bool> EndCall(string extension, Guid interaction, bool closeAutomatic, string reason);

        ServiceResult<bool> TransferCall(string fromExtension, string toExtension, Guid interaction, string route);

        ServiceResult<bool> IncomingEmail(string username, Guid interaction, Guid emailId, string emailFrom, DateTime emailReceivedAt, string emailSubject, string emailBody);

        ServiceResult<bool> IdentifyCall(Guid interaction, string clientNumber);

        ServiceResult<bool> AutenticateCall(Guid interaction, string clientNumber, string accessCode);

        ServiceResult<bool> DoTransferMoney(TransferMoney transferMoney);

        ServiceResult<bool> TransferCallToIvr(Guid interaction, string fromExtension);

        ServiceResult<bool> TransferCallFromIvr(IncommingCall callFromIvr);

        ServiceResult<bool> IgnoreCall(Guid interaction);

        ServiceResult<UserCtiConnection> GetUserActiveConnection(string username);

        ServiceResult<bool> RemoveHoldCallInOperator(string username, string extension, Guid interactionId);
    }
}
