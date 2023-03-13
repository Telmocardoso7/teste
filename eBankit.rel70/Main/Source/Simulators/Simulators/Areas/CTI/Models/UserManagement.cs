using System.Collections.Generic;

namespace eBankit.FE.Simulators.CTI.Models
{
    public class UserManagement
    {
        public string Extension { get; set; }

        public string Username { get; set; }

        public List<InteractionManagement> Interactions { get; set; }
    }
}