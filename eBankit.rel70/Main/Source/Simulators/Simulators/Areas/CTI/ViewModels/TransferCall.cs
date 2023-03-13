using System;
using System.Collections.Generic;
using eBankit.FE.Simulators.CTI.Models;

namespace eBankit.FE.Simulators.CTI.ViewModels
{
    public class TransferCall
    {
        public Guid InteractionId { get; set; }

        public UserManagement SelectUser { get; set; }

        public List<UserManagement> Users { get; set; }
    }
}
