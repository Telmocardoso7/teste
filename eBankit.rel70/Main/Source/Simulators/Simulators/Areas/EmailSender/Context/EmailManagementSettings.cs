using eBankit.FE.Simulators.Areas.EmailSender.Context.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Context
{
    public class EmailManagementSettings : IEmailManagementSettings
    {

        public Client Client { get; set; }
        public Defaults Defaults { get; set; }
        public int MaxBulkInsertMarketingListMembers { get; set; }

        public int MaxMarketingListMembersDemo { get; set; }

    }

    public class Client
    {
        public string ExternalApiURL { get; set; }
        public string ApiKey { get; set; }

    }

    public class Defaults
    {
        public string from_email { get; set; }
        public string from_name { get; set; }
        public string subject { get; set; }
        public string language { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string city { get; set; }
        public string company { get; set; }
        public string country { get; set; }
        public string state { get; set; }
        public string zip { get; set; }
        public string phone { get; set; }
        public string name { get; set; }
        public string visibility { get; set; }
        public bool email_type_option { get; set; }
        public bool marketing_permissions { get; set; }
        public bool use_archive_bar { get; set; }
        public bool double_optin { get; set; }

        public string campaign_type { get; set; }
    }
}