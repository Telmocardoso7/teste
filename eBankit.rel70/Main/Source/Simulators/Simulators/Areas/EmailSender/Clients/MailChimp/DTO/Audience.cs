using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{

    public class Audience
    {
        /// <summary>name is required</summary>
        public string name { get; set; }
        /// <summary>contact is required</summary>
        public Contact contact { get; set; }
        /// <summary>permission_reminder is required</summary>
        public string permission_reminder { get; set; }
        /// <summary>contact is required</summary>
        public bool? use_archive_bar { get; set; }
        /// <summary>campaign_defaults is required</summary>
        public CampaignDefaults campaign_defaults { get; set; }
        public string notify_on_subscribe { get; set; }
        public string notify_on_unsubscribe { get; set; }
        /// <summary>email_type_option is required</summary>
        public bool? email_type_option { get; set; }
        public string visibility { get; set; }
        public bool? double_optin { get; set; }
        public bool? marketing_permissions { get; set; }


        public Audience()
        {
            this.name = string.Empty;
            this.contact = new Contact();
            this.permission_reminder = string.Empty;
            this.campaign_defaults = new CampaignDefaults();
            this.notify_on_subscribe = string.Empty;
            this.notify_on_unsubscribe = string.Empty;
            this.visibility = string.Empty;
        }
    }

}
