using eBankit.LIB.ApiModel.Interaction.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.CTI.ViewModels
{
    public class NewCallViewModel
    {
        public Guid InteractionId { get; set; }
        public EbankitInteractionDirection InteractionDirection { get; set; }
    }
}
