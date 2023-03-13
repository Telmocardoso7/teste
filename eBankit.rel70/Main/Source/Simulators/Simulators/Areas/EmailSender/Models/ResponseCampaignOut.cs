using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public class ResponseCampaignOut
    {
        public CampaignInfo CampaignInfo { get; set; }

        public ErrorOut Error { get; set; }

        public bool Success { get; set; }
    }
}
