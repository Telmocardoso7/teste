using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class InfoRecipients
    {
        public List<SentTo> sent_to { get; set; }
        public string campaign_id { get; set; }
        public int total_items { get; set; }
        public List<Link> _links { get; set; }
    }
}
