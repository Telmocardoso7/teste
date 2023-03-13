using eBankit.FE.Simulators.CTI.Signals.Interfaces;
using Ebankit.Core.MultiTenancy.Common.Retriever.Interfaces;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Linq;

namespace eBankit.FE.Simulators.CTI.Signals
{
    public class SimulatorInteractions : BaseInteraction, ISimulatorInteractions
    {
        string user = "SimulatorUser" + Environment.MachineName;

        private readonly ITenantRetriever _tenantRetriever;

        public SimulatorInteractions(ITenantRetriever tenantRetriever)
        {
            _tenantRetriever = tenantRetriever;
        }

        public bool CheckIfUserIsOnline()
        {
            var baseConnection = HubsConnections.GetConnectionMapping(_tenantRetriever);
            var users = baseConnection.GetConnectionsByUser(user);
            if (users.Any())
            {
                return true;
            }
            return false;
        }

        public void CallIncoming(string fromExtension, Guid interactionId, string toNumber)
        {
            var baseConnection = HubsConnections.GetConnectionMapping(_tenantRetriever);
            foreach (var connectionId in baseConnection.GetConnectionsByUser(user))
            {
                _clients?.Client(connectionId.ConnectionId).SendAsync("callIncoming", fromExtension, interactionId, toNumber);
            }
        }

        public void CallAnswered(Guid interactionId)
        {
            var baseConnection = HubsConnections.GetConnectionMapping(_tenantRetriever);
            foreach (var connectionId in baseConnection.GetConnectionsByUser(user))
            {
                _clients?.Client(connectionId.ConnectionId).SendAsync("callAnswered", interactionId);
            }
        }

        public void UpdateSimulator()
        {
            var baseConnection = HubsConnections.GetConnectionMapping(_tenantRetriever);
            foreach (var connectionId in baseConnection.GetConnectionsByUser(user))
            {
                _clients?.Client(connectionId.ConnectionId).SendAsync("updateSimulator");
            }
        }

        public void TransferCall(string fromExtension, string toExtension, Guid interactionId)
        {
            var baseConnection = HubsConnections.GetConnectionMapping(_tenantRetriever);
            foreach (var connectionId in baseConnection.GetConnectionsByUser(user))
            {
                _clients?.Client(connectionId.ConnectionId).SendAsync("transferCall", fromExtension, toExtension, interactionId);
            }
        }

        public void BlindTransferedCall(string extension, Guid interactionId)
        {
            SendMessageToClient($"Call {interactionId} has been blind transfered by {extension}");
        }

        public void LogoutByAgent(string username)
        {
            SendMessageToClient($"Agent {username} has logged out in CC");
        }

        public void EndCallByAgent(string extension, Guid interactionId)
        {
            SendMessageToClient($"Call {interactionId} has been closed by the agent in extension {extension}");
        }

        public void CallPausedByAgent(string username, Guid interactionId)
        {
            SendMessageToClient($"Call {interactionId} has been paused by the agent {username}");
        }

        private void SendMessageToClient(string message)
        {
            var baseConnection = HubsConnections.GetConnectionMapping(_tenantRetriever);
            foreach (var connectionId in baseConnection.GetConnectionsByUser(user))
            {
                _clients?.Client(connectionId.ConnectionId).SendAsync("showMessage", message);
            }
        }
    }
}
