using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{

    public class Clicks
    {
        public int? clicks_total { get; set; }
        public int? unique_clicks { get; set; }
        public int? unique_subscriber_clicks { get; set; }
        public double? click_rate { get; set; }
        public DateTime? last_click { get; set; }
    }
}
