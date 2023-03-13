using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Stats
    {
        public int? member_count { get; set; }
        public int? total_contacts { get; set; }
        public int? unsubscribe_count { get; set; }
        public int? cleaned_count { get; set; }
        public int? member_count_since_send { get; set; }
        public int? unsubscribe_count_since_send { get; set; }
        public int? cleaned_count_since_send { get; set; }
        public int? campaign_count { get; set; }
        public DateTime? campaign_last_sent { get; set; }
        public int? merge_field_count { get; set; }
        public double? avg_sub_rate { get; set; }
        public double? avg_unsub_rate { get; set; }
        public double? target_sub_rate { get; set; }
        public double? open_rate { get; set; }
        public double? click_rate { get; set; }
        public DateTime? last_sub_date { get; set; }
        public DateTime? last_unsub_date { get; set; }

    }
}
