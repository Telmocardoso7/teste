using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{

    public interface IAccountBalanceResponse
    {
        Account account { get; set; }
        Balance[] balances { get; set; }
    }

    public class AccountBalanceResponse : IAccountBalanceResponse
    {
        public Account account { get; set; }
        public Balance[] balances { get; set; }
    }

    public class Account
    {
        public string bban { get; set; }
    }

    public class Balance
    {
        public Balanceamount balanceAmount { get; set; }
        public string balanceType { get; set; }
        public DateTime referenceDate { get; set; }
        public DateTime lastChangeDateTime { get; set; }
    }

    public class Balanceamount
    {
        public string currency { get; set; }
        public string _Amount { get; set; }
    }
}
