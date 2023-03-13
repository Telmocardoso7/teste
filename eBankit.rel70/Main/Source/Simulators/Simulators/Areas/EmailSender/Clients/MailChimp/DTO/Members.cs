using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Members
    {
        public MemberInfo[] members { get; set; }

        public bool update_existing { get; set; }
    }
}
