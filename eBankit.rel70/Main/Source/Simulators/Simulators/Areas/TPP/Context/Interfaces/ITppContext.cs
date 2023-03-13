using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.TPP.Models;

namespace eBankit.FE.Simulators.Areas.TPP.Context.Interfaces
{
    public interface ITppContext
    {
        Task<ServiceResult<CreateConsentResponse>> CreateConsent(ConsentRequestDTO objConsentRequest, string token);
        Task<ServiceResult<AccountListResponse>> GetAccountList(string consentId, string token);
        Task<ServiceResult<IAccountBalanceResponse>> GetAccountBalance(string consentId, string token, string accountId, string balanceEndpoint);
        Task<ServiceResult<IAccountBalanceResponse>> GetAccountTransaction(string consentId, string token, string accountId);
        Task<string> GetIdentityToken(string clientID, string secretID, string scope);
        Task<ServiceResult<ConsentStatusResponse>> GetConsentStatus(string consentID, string token);
        Task<ServiceResult<PaymentResponse>> CreatePayment(PaymentStart objPaymentRequest, string token);
        Task<ServiceResult<PaymentStatusResponse>> GetPaymentStatus(string paymentID, string token);
    }
}
