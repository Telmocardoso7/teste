using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{
    public interface IDemoEndpoints
    {
        string GetTokenIDS { get; set; }
        string CreateConsent { get; set; }
        string GetAcountIdList { get; set; }
        string GetAccountBalance { get; set; }
        string GetConsentStatus { get; set; }
        string StartPayment { get; set; }
        string GetPaymentStatus { get; set; }
    }
    public class DemoEndpoints : IDemoEndpoints
    {
        public string GetTokenIDS { get; set; }
        public string CreateConsent { get; set; }
        public string GetAcountIdList { get; set; }
        public string GetAccountBalance { get; set; }
        public string GetConsentStatus { get; set; }
        public string StartPayment { get; set; }
        public string GetPaymentStatus { get; set; }
    }
}
