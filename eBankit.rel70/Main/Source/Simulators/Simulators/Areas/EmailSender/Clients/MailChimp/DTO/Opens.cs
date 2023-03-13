using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Opens
    {
        public int? opens_total { get; set; }
        public int? unique_opens { get; set; }
        public double? open_rate { get; set; }
        public DateTime? last_open { get; set; }
    }
}
