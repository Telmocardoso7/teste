using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class MemberInfo
    {

        /// <summary>email_address is required</summary>
        public string email_address { get; set; }
        //public string email_type { get; set; }
        /// <summary>status is required</summary>
        public string status { get; set; }
        public object merge_fields { get; set; }
        //public string language { get; set; }
        //public bool? vip { get; set; }
        //public string[] marketing_permissions { get; set; }
        //public string ip_signup { get; set; }
        //public string timestamp_signup { get; set; }
        //public string ip_opt { get; set; }
        //public string timestamp_opt { get; set; }
        //public string[] tags { get; set; }

       
        //public MemberInfo()
        //{
        //    this.email_address = string.Empty;
        //    this.email_type = string.Empty;
        //    this.ip_opt = string.Empty;
        //    this.ip_signup = string.Empty;
        //    this.language = string.Empty;
        //    this.marketing_permissions = new string[] { };
        //    this.status = string.Empty;
        //    this.tags = new string[] { };
        //    this.timestamp_opt = string.Empty;
        //    this.timestamp_signup = string.Empty;
        //}
    }

}
