using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Combination
    {
        public string id { get; set; }
        public int? subject_line { get; set; }
        public int? send_time { get; set; }
        public int? from_name { get; set; }
        public int? reply_to { get; set; }
        public int? content_description { get; set; }
        public int? recipients { get; set; }

        public Combination()
        {
            this.id = string.Empty;
        }
    }

}
