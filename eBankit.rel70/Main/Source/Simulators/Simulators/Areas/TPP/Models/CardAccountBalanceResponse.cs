using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{

    public class CardAccountBalanceResponse : IAccountBalanceResponse
    {
        public Account account { get; set; }
        public Balance[] balances { get; set; }
    }
}
