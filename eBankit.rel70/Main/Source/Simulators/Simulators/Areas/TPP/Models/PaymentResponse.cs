using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{
    public class PaymentResponse
    {
        public string transactionStatus { get; set; }
        public string paymentId { get; set; }
        public _LinksPayment[] _links { get; set; }
    }

    public class _LinksPayment
    {
        public ScaredirectPayment scaRedirect { get; set; }
        public SelfPayment self { get; set; }
        public StatusPayment status { get; set; }
        public ScastatusPayment scaStatus { get; set; }
    }

    public class ScaredirectPayment
    {
        public string href { get; set; }
    }

    public class SelfPayment
    {
        public string href { get; set; }
    }

    public class StatusPayment
    {
        public string href { get; set; }
    }

    public class ScastatusPayment
    {
        public string href { get; set; }
    }

}
