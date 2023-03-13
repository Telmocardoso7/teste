using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public class CampaignOut 
    {
        public ResponseStatusEnum Status { get; set; }

        public string MarketingListProviderExternalId { get; set; }

        public string CampaignProviderExternalId { get; set; }

        public List<ErrorOut> Errors { get; set; }
    }

}

