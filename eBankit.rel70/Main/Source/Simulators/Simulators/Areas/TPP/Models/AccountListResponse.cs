using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{

    public class AccountListResponse
    {
        public AccountResponse[] accounts { get; set; }
    }

    public class AccountResponse
    {
        public string resourceId { get; set; }
        public string iban { get; set; }
        public string currency { get; set; }
        public string name { get; set; }
        public string product { get; set; }
        public string cashAccountType { get; set; }
        public string status { get; set; }
        public _LinksAccount _links { get; set; }
    }

    public class _LinksAccount
    {
        public Balances balances { get; set; }
        public Transactions transactions { get; set; }
    }

    public class Balances
    {
        public string href { get; set; }
    }

    public class Transactions
    {
        public string href { get; set; }
    }
}
