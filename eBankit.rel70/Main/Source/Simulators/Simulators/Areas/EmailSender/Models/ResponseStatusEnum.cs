using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public enum ResponseStatusEnum
    {
        Success = 0,
        MarketingListError = 1,
        MembersError = 2,
        CampaignError = 3,
        PartialSuccess = 4
    }
}
