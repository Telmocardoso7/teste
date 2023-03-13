using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Ecommerce
    {
        public int? total_orders { get; set; }
        public int? total_spent { get; set; }
        public int? total_revenue { get; set; }
    }
}
