using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public class UpdateStateMessageQueue
    {
        public Guid CampaignId { get; set; }
        public int StateId { get; set; }
    }
}
