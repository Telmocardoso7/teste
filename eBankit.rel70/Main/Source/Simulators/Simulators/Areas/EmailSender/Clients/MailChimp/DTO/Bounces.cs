using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Bounces
    {
        public int? hard_bounces { get; set; }
        public int? soft_bounces { get; set; }
        public int? syntax_errors { get; set; }
    }
}
