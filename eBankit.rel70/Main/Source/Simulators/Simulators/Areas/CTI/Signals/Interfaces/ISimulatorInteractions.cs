using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.CTI.Signals.Interfaces
{
    public interface ISimulatorInteractions
    {
        void SetAuthUserSimulator(string connectionId);
        void SetClients(IHubClients clients);
        bool CheckIfUserIsOnline();
        void CallIncoming(string fromExtension, Guid interactionId, string toNumber);
        void TransferCall(string fromExtension, string toExtension, Guid interactionId);
        void CallAnswered(Guid interactionId);
        void UpdateSimulator();
        void BlindTransferedCall(string extension, Guid interactionId);
        void LogoutByAgent(string username);
        void EndCallByAgent(string extension, Guid interactionId);
        void CallPausedByAgent(string extension, Guid interactionId);
    }
}
