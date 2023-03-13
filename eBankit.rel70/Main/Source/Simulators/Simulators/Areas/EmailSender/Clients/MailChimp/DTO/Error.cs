using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Error
    {
        public string type { get; set; }
        public string title { get; set; }
        public int? status { get; set; }
        public string detail { get; set; }
        public string instance { get; set; }
    }
}
