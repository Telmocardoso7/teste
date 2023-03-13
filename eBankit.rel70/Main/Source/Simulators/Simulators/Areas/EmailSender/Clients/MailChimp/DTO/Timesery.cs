using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Timesery
    {
        public DateTime? timestamp { get; set; }
        public int? emails_sent { get; set; }
        public int? unique_opens { get; set; }
        public int? recipients_clicks { get; set; }
    }
}
