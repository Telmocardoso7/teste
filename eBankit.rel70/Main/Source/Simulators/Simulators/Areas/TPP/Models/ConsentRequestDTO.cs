using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{
    public class ConsentRequestDTO
    {
        public Access access { get; set; }
        public bool recurringIndicator { get; set; }
        public DateTime validUntil { get; set; }
        public int frequencyPerDay { get; set; }
        public bool combinedServiceIndicator { get; set; }
    }

    public class Access
    {
        public AccountBban[] accounts { get; set; }
        public BalanceConsent[] balances { get; set; }
        public Transaction[] transactions { get; set; }
        public string availableAccounts { get; set; }
        public string allPsd2 { get; set; }
    }

    public class AccountBban
    {
        public string bban { get; set; }
    }

    public class BalanceConsent
    {
        public string bban { get; set; }
    }

    public class Transaction
    {
        public string bban { get; set; }
    }



}
