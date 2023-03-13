using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Contact
    {
        /// <summary>company is required</summary>
        public string company { get; set; }
        /// <summary>address1 is required</summary>
        public string address1 { get; set; }
        public string address2 { get; set; }
        /// <summary>city is required</summary>
        public string city { get; set; }
        /// <summary>state is required</summary>
        public string state { get; set; }
        /// <summary>zip is required</summary>
        public string zip { get; set; }
        /// <summary>country is required</summary>
        public string country { get; set; }
        public string phone { get; set; }

        public Contact()
        {
            this.company = string.Empty;
            this.address1 = string.Empty;
            this.address2 = string.Empty;
            this.city = string.Empty;
            this.state = string.Empty;
            this.zip = string.Empty;
            this.country = string.Empty;
            this.phone = string.Empty;
        }
    }

}
