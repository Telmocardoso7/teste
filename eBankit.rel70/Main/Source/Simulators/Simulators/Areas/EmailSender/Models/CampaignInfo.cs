using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public class CampaignInfo
    {
        public List<CustomerAction> CustomerAction { get; set; }

        public string CampaignProviderExternalId { get; set; }

        public Guid CampaignId { get; set; }

        public int ChannelId { get; set; }

        public List<MessageQueue> RecordsToUpdate { get; set; }
    }
}
