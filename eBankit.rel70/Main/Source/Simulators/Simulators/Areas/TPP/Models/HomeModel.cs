using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{
    public class HomeModel
    {
        public string ClientID { get; set; }
        public string SecretID { get; set; }
        public string Scope { get; set; }
    }
}
