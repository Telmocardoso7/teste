using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{
    public class PaymentStart
    {
        public string endToEndIdentification { get; set; }
        public Instructedamount instructedAmount { get; set; }
        public Debtoraccount debtorAccount { get; set; }
        public string creditorName { get; set; }
        public Creditoraccount creditorAccount { get; set; }
        public string remittanceInformationUnstructured { get; set; }
    }

    public class Instructedamount
    {
        public string currency { get; set; }
        public string amount { get; set; }
    }

    public class Debtoraccount
    {
        public string bban { get; set; }
    }

    public class Creditoraccount
    {
        public string bban { get; set; }
    }

}
