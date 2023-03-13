using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public class IndexModel
    {
        public List<OutboundCampaign> Campaigns { get; set; }
        public bool Loaded { get; set; }
        public CampaignDetail CampaignDetail { get; set; }
        public bool HasErrors { get; set; }
        public List<ErrorOut> ResponseOutput { get; set; }
        public bool HasResponses { get; set; }
        public CampaignResponse CampaignResponse { get; set; }
        public string ErrorMessage { get; set; }
        public string ProcessStatusDescription { get; set; }
    }

    public class CampaignDetail
    {
        public Guid CampaignId { get; set; }
        public string CampaignName { get; set; }
        public string CampaignCode { get; set; }
        public int MarketingListTotal { get; set; }
        public string MarketingListName { get; set; }
        public string Subject { get; set; }
        public Guid MarketingListId { get; set; }
    }

    public class CampaignResponse
    {
        public ErrorOut Error { get; set; }

    }
}
