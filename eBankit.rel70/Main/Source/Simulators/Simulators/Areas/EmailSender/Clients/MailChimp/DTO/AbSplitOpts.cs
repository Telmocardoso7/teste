using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{

    public class AbSplitOpts
    {
        public string split_test { get; set; }
        public string pick_winner { get; set; }
        public string wait_units { get; set; }
        public int? wait_time { get; set; }
        public int? split_size { get; set; }
        public string from_name_a { get; set; }
        public string from_name_b { get; set; }
        public string reply_email_a { get; set; }
        public string reply_email_b { get; set; }
        public string subject_a { get; set; }
        public string subject_b { get; set; }
        public DateTime? send_time_a { get; set; }
        public DateTime? send_time_b { get; set; }
        public string send_time_winner { get; set; }

        public AbSplitOpts()
        {
            this.split_test = string.Empty;
            this.pick_winner = string.Empty;
            this.wait_units = string.Empty;
            this.from_name_a = string.Empty;
            this.from_name_b = string.Empty;
            this.reply_email_a = string.Empty;
            this.reply_email_b = string.Empty;
            this.subject_a = string.Empty;
            this.subject_b = string.Empty;
            this.send_time_winner = string.Empty;
        }
    }

}

