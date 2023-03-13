using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{
    public class PaymentStatusResponse
    {
        public string paymentId { get; set; }
        public string request { get; set; }
        public int serviceId { get; set; }
        public int productId { get; set; }
        public int paymentStatus { get; set; }
        public string clientId { get; set; }
        public string consentId { get; set; }
        public DateTime createDate { get; set; }
        public string descService { get; set; }
        public string descProduct { get; set; }
        public string descPaymentStatus { get; set; }
        public string descClient { get; set; }
        public int debtorTypeId { get; set; }
        public string descDebtorType { get; set; }
        public string debtorNumber { get; set; }
        public string creditorAccount { get; set; }
        public string creditorName { get; set; }
        public string currency { get; set; }
        public string amount { get; set; }
        public string authorisationId { get; set; }
        public string descAuthorisationStatus { get; set; }
        public int typeAuthorisationId { get; set; }
        public string descTypeAuthorisation { get; set; }
        public string processTransactionId { get; set; }
    }

}
