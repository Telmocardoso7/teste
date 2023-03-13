using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public class MessageQueueInput
    {
        public int PageNumber { get; set; }

        public int PageSize { get; set; }

        public int ChannelId { get; set; }

        public string CampaignCode { get; set; }
    }
}
