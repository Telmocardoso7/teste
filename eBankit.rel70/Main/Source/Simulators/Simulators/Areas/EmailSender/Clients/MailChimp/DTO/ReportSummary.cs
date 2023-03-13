using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class ReportSummary
    {
        public int? opens { get; set; }
        public int? unique_opens { get; set; }
        public double? open_rate { get; set; }
        public int? clicks { get; set; }
        public int? subscriber_clicks { get; set; }
        public double? click_rate { get; set; }
        public Ecommerce ecommerce { get; set; }

        public ReportSummary()
        {
            this.ecommerce = new Ecommerce();
        }
    }
}
