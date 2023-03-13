using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Common
{
    public class AuthToken
    {
        public string Token { get; set; }
        public DateTime TokenExpiresAt { get; set; }
    }
}
