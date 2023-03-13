using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{

    public class TemplateOut
    {
        public int? id { get; set; }
        public string type { get; set; }
        public string name { get; set; }
        public bool? drag_and_drop { get; set; }
        public bool? responsive { get; set; }
        public string category { get; set; }
        public DateTime? date_created { get; set; }
        public DateTime? date_edited { get; set; }
        public string created_by { get; set; }
        public string edited_by { get; set; }
        public bool? active { get; set; }
        public string folder_id { get; set; }
        public string thumbnail { get; set; }
        public string share_url { get; set; }
        public List<Link> _links { get; set; }

        public TemplateOut()
        {
            this.type = string.Empty;
            this.name = string.Empty;
            this.category = string.Empty;
            this.created_by = string.Empty;
            this.category = string.Empty;
            this.folder_id = string.Empty;
            this.thumbnail = string.Empty;
            this.share_url = string.Empty;
            this._links = new List<Link>();
        }
    }

}

