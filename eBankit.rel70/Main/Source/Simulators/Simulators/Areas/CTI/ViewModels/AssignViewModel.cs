using System;
using System.Collections.Generic;
using eBankit.FE.Simulators.CTI.Models;

namespace eBankit.FE.Simulators.CTI.ViewModels
{
    public class AssignViewModel
    {
        public Guid InteractionId { get; set; }

        public InteractionManagementType InteractionType { get; set; }

        public List<UserManagement> Users { get; set; }
    }
}
