using System.Collections.Generic;

namespace eBankit.FE.Simulators.CTI.Models
{
    public class CtiManagement
    {
        public List<UserManagement> Users { get; set; }

        public List<InteractionManagement> PendingInteractions { get; set; }
        public List<InteractionManagement> IncomingCalls { get; set; }

        public CtiManagement()
        {
            Users = new List<UserManagement>();
            PendingInteractions = new List<InteractionManagement>();
            IncomingCalls = new List<InteractionManagement>();
        }
    }
}
