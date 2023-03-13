using System;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public class OutboundCampaign
    {
        public Guid CampaignId { get; set; }
        public string CampaignCode { get; set; }
        public string Name { get; set; }
        public int TotalQueue { get; set; }
        public string CampaignProviderExternalId { get; set; }
    }
}
