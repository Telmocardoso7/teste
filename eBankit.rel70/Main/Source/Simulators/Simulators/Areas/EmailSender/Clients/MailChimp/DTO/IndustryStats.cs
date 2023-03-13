using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class IndustryStats
    {
        public string type { get; set; }
        public double? open_rate { get; set; }
        public double? click_rate { get; set; }
        public double? bounce_rate { get; set; }
        public double? unopen_rate { get; set; }
        public double? unsub_rate { get; set; }
        public double? abuse_rate { get; set; }
    }
}
