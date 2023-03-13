using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{

    public class Settings
    {
        //public string subject_line { get; set; }
        //public string preview_text { get; set; }
        public string title { get; set; }
        //public string from_name { get; set; }
        //public string reply_to { get; set; }
        //public bool? use_conversation { get; set; }
        //public string to_name { get; set; }
        //public string folder_id { get; set; }
        //public bool? authenticate { get; set; }
        //public bool? auto_footer { get; set; }
        //public bool? inline_css { get; set; }
        //public bool? auto_tweet { get; set; }
        //public List<string> auto_fb_post { get; set; }
        //public bool? fb_comments { get; set; }
        //public bool? timewarp { get; set; }
        public int? template_id { get; set; }
        //public bool? drag_and_drop { get; set; }

        //public Settings()
        //{
        //    this.subject_line = string.Empty;
        //    this.preview_text = string.Empty;
        //    this.title = string.Empty;
        //    this.from_name = string.Empty;
        //    this.reply_to = string.Empty;
        //    this.to_name = string.Empty;
        //    this.folder_id = string.Empty;
        //    this.auto_fb_post = new List<string>();
        //}
    }
}
