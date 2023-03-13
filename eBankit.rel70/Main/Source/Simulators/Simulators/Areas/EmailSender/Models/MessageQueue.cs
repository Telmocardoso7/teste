using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public class MessageQueue
    {
        public int TotalQueue { get; set; }
        public Guid QueueId { get; set; }
        public Guid CampaignId { get; set; }
        public int ChannelId { get; set; }
        public string CustomerId { get; set; }
        public string CellPhone { get; set; }
        public string Email { get; set; }

        public string Subject { get; set; }
        public string Body { get; set; }

        public string PushToken { get; set; }
        public string DeviceOs { get; set; }
        public string CampaignCode { get; set; }
        public string Link { get; set; }
        public string UserAlias { get; set; }
        public string ContentKey { get; set; }
        public string CampaignName { get; set; }
        public string MarketingListName { get; set; }
        public Guid MarketingListId { get; set; }
        public string MarketingListProviderExternalId { get; set; }
        public string CampaignProviderExternalId { get; set; }
        public string Name { get; set; }
    }
}
