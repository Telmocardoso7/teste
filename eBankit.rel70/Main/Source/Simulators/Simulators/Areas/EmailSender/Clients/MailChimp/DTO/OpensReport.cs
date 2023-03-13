using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class OpensReport
    {
        public List<OpensPerMember> members { get; set; }
        public string campaign_id { get; set; }
        public int total_opens { get; set; }
        public int total_items { get; set; }
        public List<Link> _links { get; set; }
    }

    public class OpensPerMember
    {
        public string campaign_id { get; set; }
        public string list_id { get; set; }
        public string email_id { get; set; }
        public string email_address { get; set; }
        public int opens_count { get; set; }

    }
}
