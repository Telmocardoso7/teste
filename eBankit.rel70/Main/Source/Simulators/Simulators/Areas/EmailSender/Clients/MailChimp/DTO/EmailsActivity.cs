using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class EmailsActivity
    {
        public List<Email> emails { get; set; }
        public string campaign_id { get; set; }
        public int? total_items { get; set; }
    }
}
