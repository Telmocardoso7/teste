using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class SegmentOpts
    {
        public int? saved_segment_id { get; set; }
        public string prebuilt_segment_id { get; set; }
        public string match { get; set; }
        public List<object> conditions { get; set; }

        public SegmentOpts()
        {
            this.prebuilt_segment_id = string.Empty;
            this.match = string.Empty;
            this.conditions = new List<object>();
        }

    }
}
