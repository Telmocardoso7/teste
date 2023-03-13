using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class ListStats
    {
        public double? sub_rate { get; set; }
        public double? unsub_rate { get; set; }
        public double? open_rate { get; set; }
        public double? click_rate { get; set; }
    }
}
