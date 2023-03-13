using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Report
    {

        public string id { get; set; }
        public string campaign_title { get; set; }
        public string type { get; set; }
        public string list_id { get; set; }
        public bool list_is_active { get; set; }
        public string list_name { get; set; }
        public string subject_line { get; set; }
        public string preview_text { get; set; }
        public int? emails_sent { get; set; }
        public int? abuse_reports { get; set; }
        public int? unsubscribed { get; set; }
        public DateTime? send_time { get; set; }
        public DateTime? rss_last_send { get; set; }
        public Bounces bounces { get; set; }
        public Forwards forwards { get; set; }
        public Opens opens { get; set; }
        public Clicks clicks { get; set; }
        public IndustryStats industry_stats { get; set; }
        public ListStats list_stats { get; set; }
        public AbSplit ab_split { get; set; }
        public List<Timewarp> timewarp { get; set; }
        public List<Timesery> timeseries { get; set; }
        public ShareReport share_report { get; set; }
        public Ecommerce ecommerce { get; set; }
        public DeliveryStatus delivery_status { get; set; }
        public List<Link> _links { get; set; }
    }
}
