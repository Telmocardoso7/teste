using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Tracking
    {
        public bool? opens { get; set; }
        public bool? html_clicks { get; set; }
        public bool? text_clicks { get; set; }
        public bool? goal_tracking { get; set; }
        public bool? ecomm360 { get; set; }
        public string google_analytics { get; set; }
        public string clicktale { get; set; }
        public Salesforce salesforce { get; set; }
        public Capsule capsule { get; set; }

        public Tracking()
        {
            this.google_analytics = string.Empty;
            this.clicktale = string.Empty;
            this.salesforce = new Salesforce();
            this.capsule = new Capsule();
        }
    }
}
