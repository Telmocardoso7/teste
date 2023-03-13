using eBankit.FE.Simulators.CTI.Models;
using eBankit.FE.Simulators.CTI.ViewModels;
using eBankit.LIB.ApiModel.Interaction.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.CTI.Context.Interfaces
{
    public interface ICtiContext
    {
        string SelectUsername { get; set; }
        CtiManagement Managment { get; set; }
        void NewCall(EbankitInteractionType interactionType, bool newServiceInteraction);
        Guid NewInteraction(EbankitInteractionType interactionType);
        void NewEmail();
        void CloseInteraction(Guid interaction);
        void CloseEmailOnExtension(Guid interaction);
        void AddUser(string username, string extension);
        void AssignInteraction(string extension, Guid interaction, string emailFrom = "", string emailSubject = "", string emailBody = "");
        void AssignIncomingInteraction(string extension, Guid interaction, string emailFrom = "", string emailSubject = "", string emailBody = "");
        void SetUser(string selectusername);
        void StartCall(string username, Guid identifier, Dictionary<string, string> paramsExtra, string route, string navigation = null);
        void EndCall(string username, Guid identifier, bool closeAutomatic, string reason, bool forceEndCall);
        void LogoutUser(string username, bool forceLogout);
        void TransferCall(Guid identifier, string username, string toExtension, string route);
        void IdentifyCall(Guid identifier, string clientNumber);
        void AuthenticateCall(Guid identifier, string clientNumber, string accessCode);
        void DoTransferMoney(TransferMoney transferMoney);
        void TransferCallToIvr(Guid identifier, string username);
        void TransferCallFromIvr(Guid identifier);
        void TransferCallFromMediaBar(Guid identifier, string fromExtension, string toExtension);
        void AddIncomingCall(LIB.ApiModel.ContactCenter.IncommingCall incommingCall);
        void IgnoreCall(Guid interaction);
        void CallAnswer(string username, Guid identifier);
        void CallHangUp(string username, Guid identifier);
        UserManagement GetUserByExtension(string extension);
        void FreeUserExtension(string username);
        void RemoveInteraction(Guid interactionId, string username);
        void BlindTransferCallFromAgent(string username, Guid identifier);
    }
}
