using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Email
    {
        public string campaign_id { get; set; }
        public string list_id { get; set; }
        public bool list_is_active { get; set; }
        public string email_id { get; set; }
        public string email_address { get; set; }
        public List<Activity> activity { get; set; }
    }
}
