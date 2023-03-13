using System.Collections.Generic;
using eBankit.FE.Simulators.CTI.Models;

namespace eBankit.FE.Simulators.CTI.ViewModels
{
    public class ResumeViewModel
    {
        public UserManagement SelectUser { get; set; }

        public List<UserManagement> Users { get; set; }

        public List<InteractionManagement> PendingInteractions { get; set; }

        public List<InteractionManagement> IncomingInteractions { get; set; }

        public bool HasUsers { get; set; }

        public bool HasMoreThanUser { get; set; }
        public string Route { get; set; }
        public string ProcessId { get; set; }
        public string Reason { get; set; }
        public bool AutomaticClose { get; set; }
    }
}
