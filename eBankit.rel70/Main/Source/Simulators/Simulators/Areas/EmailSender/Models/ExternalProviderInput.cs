using System;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public class ExternalProviderInput
    {
        public Guid CampaignId { get; set; }
        public string CampaignProviderExternalId { get; set; }
        public Guid MarketingListId { get; set; }
        public string MarketingListProviderExternalId { get; set; }
    }
}
