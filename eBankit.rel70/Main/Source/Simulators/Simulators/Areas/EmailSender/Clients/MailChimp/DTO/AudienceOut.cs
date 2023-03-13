using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class AudienceOut
    {
        public string id { get; set; }
        public int? web_id { get; set; }
        public string name { get; set; }
        public Contact contact { get; set; }
        public string permission_reminder { get; set; }
        public bool? use_archive_bar { get; set; }
        public CampaignDefaults campaign_defaults { get; set; }
        public bool? notify_on_subscribe { get; set; }
        public bool? notify_on_unsubscribe { get; set; }
        public DateTime? date_created { get; set; }
        public int? list_rating { get; set; }
        public bool? email_type_option { get; set; }
        public string subscribe_url_short { get; set; }
        public string subscribe_url_long { get; set; }
        public string beamer_address { get; set; }
        public string visibility { get; set; }
        public bool? double_optin { get; set; }
        public bool? has_welcome { get; set; }
        public bool? marketing_permissions { get; set; }
        public List<string> modules { get; set; }
        public Stats stats { get; set; }
        public List<Link> _links { get; set; }
    }
}
