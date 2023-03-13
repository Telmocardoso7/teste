using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{
    public class PaymentModel
    {
        public string PaymentAccount { get; set; }
        public string MyAccount { get; set; }
        public string Value { get; set; }
        public string Currency { get; set; }
        public string Token { get; set; }
    }
}
