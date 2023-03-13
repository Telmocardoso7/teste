using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class RssOpts
    {
        public string feed_url { get; set; }
        public string frequency { get; set; }
        public Schedule schedule { get; set; }
        public DateTime? last_sent { get; set; }
        public bool? constrain_rss_img { get; set; }

        public RssOpts()
        {
            this.feed_url = string.Empty;
            this.frequency = this.frequency;
            this.schedule = new Schedule();
        }
    }

}
