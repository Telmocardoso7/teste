using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Templates
    {
        public List<TemplateOut> templates { get; set; }
        public int? total_items { get; set; }
        public List<Link> _links { get; set; }

        public Templates()
        {
            this.templates = new List<TemplateOut>();
            this._links = new List<Link>();
        }
    }

}