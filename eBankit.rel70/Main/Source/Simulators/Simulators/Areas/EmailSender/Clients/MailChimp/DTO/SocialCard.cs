using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class SocialCard
    {
        public string image_url { get; set; }
        public string description { get; set; }
        public string title { get; set; }

        public SocialCard()
        {
            this.image_url = string.Empty;
            this.description = string.Empty;
            this.title = string.Empty;
        }
    }
}
