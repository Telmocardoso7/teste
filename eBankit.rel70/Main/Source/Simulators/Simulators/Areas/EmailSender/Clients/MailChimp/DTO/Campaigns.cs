using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Campaigns
    {

        public List<Campaign> campaigns { get; set; }
        public int? total_items { get; set; }
        public List<Link> _links { get; set; }

        public Campaigns()
        {
            this.campaigns = new List<Campaign>();
            this._links = new List<Link>();
        }
    }
}
