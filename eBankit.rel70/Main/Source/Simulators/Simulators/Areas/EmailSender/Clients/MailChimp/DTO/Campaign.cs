using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{

    public class Campaign
    {
        public string id { get; set; }
        //public int? web_id { get; set; }
        //public string parent_campaign_id { get; set; }
        /// <summary>type is required
        /// <para> Possible values: "regular", "plaintext", "absplit", "rss", or "variate".</para>
        /// </summary>
        public string type { get; set; }
        public DateTime? create_time { get; set; }
        //public string archive_url { get; set; }
        //public string long_archive_url { get; set; }
        //public string status { get; set; }
        //public int? emails_sent { get; set; }
        //public DateTime? send_time { get; set; }
        //public string content_type { get; set; }
        //public bool? needs_block_refresh { get; set; }
        //public bool? has_logo_merge_tag { get; set; }
        //public bool? resendable { get; set; }
        public Recipients recipients { get; set; }
        public Settings settings { get; set; }
        //public VariateSettings variate_settings { get; set; }
        //public Tracking tracking { get; set; }
        //public RssOpts rss_opts { get; set; }
        //public AbSplitOpts ab_split_opts { get; set; }
        //public SocialCard social_card { get; set; }
        //public ReportSummary report_summary { get; set; }
        //public DeliveryStatus delivery_status { get; set; }
        //public List<Link> _links { get; set; }

    }
}
