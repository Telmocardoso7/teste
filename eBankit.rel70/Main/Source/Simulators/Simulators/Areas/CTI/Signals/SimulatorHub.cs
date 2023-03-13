using eBankit.FE.Simulators.CTI.Signals.Interfaces;
using Ebankit.Core.MultiTenancy.Common.Retriever.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.CTI.Signals
{

    public class SimulatorHub : Hub
    {
        private readonly ITenantRetriever _tenantRetriever;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ISimulatorInteractions _simulatorInteractions;

        public SimulatorHub(ITenantRetriever tenantRetriever,
            IHttpContextAccessor httpContextAccessor,
            ISimulatorInteractions simulatorInteractions, 
            IHubContext<SimulatorHub> connectionManager)
        {
            _tenantRetriever = tenantRetriever;
            _httpContextAccessor = httpContextAccessor;
            _simulatorInteractions = simulatorInteractions;
            simulatorInteractions.SetClients(connectionManager.Clients);

        }

        public override Task OnConnectedAsync()
        {
            _simulatorInteractions.SetAuthUserSimulator(Context.ConnectionId);
            return base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception exception)
        {
            var connection = HubsConnections.GetConnectionMapping(_tenantRetriever);
            connection.Remove(Context.ConnectionId);
            HubsConnections.SetConnectionMapping(_tenantRetriever, connection);

            return base.OnDisconnectedAsync(exception);

        }

    }

}
