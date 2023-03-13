using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{

    public class Link
    {
        public string rel { get; set; }
        public string href { get; set; }
        public string method { get; set; }
        public string targetSchema { get; set; }
        public string schema { get; set; }

        public Link()
        {
            this.rel = string.Empty;
            this.href = string.Empty;
            this.method = string.Empty;
            this.targetSchema = string.Empty;
            this.schema = string.Empty;
        }
    }
}
