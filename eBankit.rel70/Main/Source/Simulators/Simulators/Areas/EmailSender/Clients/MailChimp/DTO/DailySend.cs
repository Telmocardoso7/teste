using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class DailySend
    {
        public bool? sunday { get; set; }
        public bool? monday { get; set; }
        public bool? tuesday { get; set; }
        public bool? wednesday { get; set; }
        public bool? thursday { get; set; }
        public bool? friday { get; set; }
        public bool? saturday { get; set; }
    }
}
