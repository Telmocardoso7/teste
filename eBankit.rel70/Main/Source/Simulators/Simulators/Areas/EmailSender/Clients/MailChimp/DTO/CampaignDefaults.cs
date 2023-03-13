using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class CampaignDefaults
    {
        /// <summary>from_name is required</summary>
        public string from_name { get; set; }
        /// <summary>from_email is required</summary>
        public string from_email { get; set; }
        /// <summary>subject is required</summary>
        public string subject { get; set; }
        /// <summary>language is required</summary>
        public string language { get; set; }


        public CampaignDefaults()
        {
            this.from_name = string.Empty;
            this.from_email = string.Empty;
            this.subject = string.Empty;
            this.language = string.Empty;
        }
    }
}
