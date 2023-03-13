using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Template
    {
        /// <summary>name is required</summary>
        public string name { get; set; }
        public string folder_id { get; set; }
        /// <summary>html is required</summary>
        public string html { get; set; }

        public Template()
        {
            this.name = string.Empty;
            this.folder_id = string.Empty;
            this.html = string.Empty;
        }
    }
}
