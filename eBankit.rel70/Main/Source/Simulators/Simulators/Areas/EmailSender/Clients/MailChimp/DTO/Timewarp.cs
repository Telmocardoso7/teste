using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Timewarp
    {
        public int? gmt_offset { get; set; }
        public int? opens { get; set; }
        public DateTime? last_open { get; set; }
        public int? unique_opens { get; set; }
        public int? clicks { get; set; }
        public DateTime? last_click { get; set; }
        public int? unique_clicks { get; set; }
        public int? bounces { get; set; }
    }
}
