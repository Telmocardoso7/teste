using eBankit.LIB.ApiModel.Interaction.Enums;
using System;

namespace eBankit.FE.Simulators.CTI.ViewModels
{
    public class AutenticateCallViewModel
    {
        public Guid InteractionId { get; set; }
        public bool ShowAccessCode { get; set; } = true;
        public int InteractionType { get; set; }
    }
}
