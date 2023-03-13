using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class DeliveryStatus
    {
        public bool? enabled { get; set; }
        public bool? can_cancel { get; set; }
        public string status { get; set; }
        public int? emails_sent { get; set; }
        public int? emails_canceled { get; set; }

        public DeliveryStatus()
        {
            this.status = string.Empty;
        }
    }
}
