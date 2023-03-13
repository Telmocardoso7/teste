using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.CTI.Signals
{
    public class BaseInteraction
    {
        protected static IHubClients _clients;

        public void SetClients(IHubClients clients)
        {
            _clients = clients;
        }

        public void SetAuthUserSimulator(string connectionId)
        {
            _clients?.Client(connectionId).SendAsync("setAuthUser", connectionId);
        }
    }
}
