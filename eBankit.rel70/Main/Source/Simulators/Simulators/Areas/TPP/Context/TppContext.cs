using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.Areas.TPP.Context.Interfaces;
using eBankit.FE.Simulators.Common.Interfaces;
using eBankit.FE.Simulators.TPP.Models;
using Ebankit.Core.MultiTenancy.Common;
using Ebankit.Core.MultiTenancy.Common.Retriever.Interfaces;
using Ebankit.FE.Common.API.Helpers;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.IO;
using System.Net.Http;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.TPP.Context
{
    public class TppContext : ITppContext
    {
        private readonly IDemoEndpoints _demoEndpoints;
        private readonly IConfiguration _configuration;
        private readonly ITokenService _tokenService;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ITenantRetriever _tenantRetriever;

        public TppContext(IDemoEndpoints demoEndpoints, IConfiguration configuration, ITokenService tokenService, IHttpClientFactory httpClientFactory, IHttpContextAccessor httpContextAccessor, ITenantRetriever tenantRetriever)
        {
            _demoEndpoints = demoEndpoints;
            _configuration = configuration;
            _tokenService = tokenService;
            _httpClientFactory = httpClientFactory;
            _httpContextAccessor = httpContextAccessor;
            _tenantRetriever = tenantRetriever;
        }

        public async Task<ServiceResult<CreateConsentResponse>> CreateConsent(ConsentRequestDTO objConsentRequest, string token)
        {
            string action = _demoEndpoints.CreateConsent;
            Uri objUri = new Uri(_configuration.GetSection("Request:BaseEndpoints:PSD2Services").Value + action);

            RestClient objRestClient = new RestClient(new RestClientOptions()
            {
                Encoding = Encoding.UTF8,
                BaseUrl = objUri
            });

            RestRequest request = new RestRequest() { RequestFormat = DataFormat.Json, Method = Method.Post };
            request.AddHeader("Authorization", "bearer " + token);
            request.AddHeader(Constants.EbankitTenantKey, _tenantRetriever.Get().Id.ToString());
            request.AddHeader("X-ARR-ClientCert", GetCertificate());
            request.AddHeader("PSU-Id", GetClientId());

            request.AddHeader("TPP-Redirect-URI", new UriHelper(_configuration.GetSection("Request:BaseEndpoints:ReturnUrl").Value).AddSegment("tpp/manager/CallbackShow/").Uri);
            request.AddJsonBody(objConsentRequest);

            CreateConsentResponse objResponse = new CreateConsentResponse();
            RestResponse objRestResponse = await objRestClient.ExecuteAsync(request);

            if (objRestResponse.StatusCode == System.Net.HttpStatusCode.Created)
            {
                objResponse = JsonConvert.DeserializeObject<CreateConsentResponse>(objRestResponse.Content);

            }
            else if (objRestResponse.StatusCode == System.Net.HttpStatusCode.Forbidden)
            {
                objResponse.consentId = objRestResponse.Content;
            }

            return new ServiceResult<CreateConsentResponse>(objResponse);
        }

        public async Task<ServiceResult<PaymentResponse>> CreatePayment(PaymentStart objPaymentRequest, string token)
        {
            //API Call
            string action = _demoEndpoints.StartPayment;
            Uri objUri = new Uri(_configuration.GetSection("Request:BaseEndpoints:PSD2Services").Value + action);
            RestClient objRestClient = new RestClient(new RestClientOptions()
            {
                Encoding = Encoding.UTF8,
                BaseUrl = objUri
            });
            RestRequest request = new RestRequest() { RequestFormat = DataFormat.Json, Method = Method.Post };
            request.AddHeader("Authorization", "bearer " + token);
            request.AddHeader(Constants.EbankitTenantKey, _tenantRetriever.Get().Id.ToString());
            string urlDecode = new UriHelper(_configuration.GetSection("Request:BaseEndpoints:ReturnUrl").Value).AddSegment("tpp/manager/PaymentStatus/{0}").Uri;
            request.AddHeader("TPP-Redirect-URI", urlDecode);
            request.AddHeader("X-ARR-ClientCert", GetCertificate());
            request.AddHeader("PSU-Id", GetClientId());


            PaymentResponse objResponse = new PaymentResponse();
            request.AddJsonBody(objPaymentRequest);
            RestResponse objRestResponse = await objRestClient.ExecuteAsync(request);

            if (objRestResponse.StatusCode == System.Net.HttpStatusCode.OK)
            {
                objResponse = JsonConvert.DeserializeObject<PaymentResponse>(objRestResponse.Content);
                return new ServiceResult<PaymentResponse>(objResponse);
            }

            return new ServiceResult<PaymentResponse>();
        }

        public async Task<ServiceResult<IAccountBalanceResponse>> GetAccountBalance(string consentId, string token, string accountId, string balanceEndpoint)
        {
            //TODO: There should be only one api for consulting balance. API balance is returning a list of balances

            //API Call
            //string action = string.Format(_demoEndPoints.GetAccountBalance, accountId);
            //string strUri = strEndPoint + action;
            //Uri objUri = new Uri(strUri);

            Uri objUri = new Uri(_configuration.GetSection("Request:BaseEndpoints:PSD2Services").Value + balanceEndpoint);

            bool isCardAccount = false;
            if (balanceEndpoint.ToUpper().Contains("CARD"))
                isCardAccount = true;

            RestClient objRestClient = new RestClient(new RestClientOptions()
            {
                Encoding = Encoding.UTF8,
                BaseUrl = objUri
            });
            RestRequest request = new RestRequest() { RequestFormat = DataFormat.Json, Method = Method.Get };
            request.AddHeader("consentID", consentId);
            request.AddHeader("Authorization", "bearer " + token);
            request.AddHeader("X-ARR-ClientCert", GetCertificate());
            request.AddHeader("PSU-Id", GetClientId());
            request.AddHeader(Constants.EbankitTenantKey, _tenantRetriever.Get().Id.ToString());

            IAccountBalanceResponse objResponse = null;
            if (isCardAccount)
                objResponse = new CardAccountBalanceResponse();
            else
                objResponse = new AccountBalanceResponse();

            RestResponse objRestResponse = await objRestClient.ExecuteAsync(request);

            if (objRestResponse.StatusCode == System.Net.HttpStatusCode.OK)
            {
                if (isCardAccount)
                {
                    objResponse = JsonConvert.DeserializeObject<CardAccountBalanceResponse>(objRestResponse.Content);
                    ((CardAccountBalanceResponse)objResponse).account = new Account();
                    ((CardAccountBalanceResponse)objResponse).account.bban = accountId;
                }
                else
                    objResponse = JsonConvert.DeserializeObject<AccountBalanceResponse>(objRestResponse.Content);

                return new ServiceResult<IAccountBalanceResponse>(objResponse);
            }

            return new ServiceResult<IAccountBalanceResponse>();
        }

        public async Task<ServiceResult<AccountListResponse>> GetAccountList(string consentId, string token)
        {
            string action = _demoEndpoints.GetAcountIdList;
            Uri objUri = new Uri(_configuration.GetSection("Request:BaseEndpoints:PSD2Services").Value + action);
            RestClient objRestClient = new RestClient(new RestClientOptions()
            {
                Encoding = Encoding.UTF8,
                BaseUrl = objUri
            });
            RestRequest request = new RestRequest() { RequestFormat = DataFormat.Json, Method = Method.Get };
            request.AddHeader("consentID", consentId);
            request.AddHeader("Authorization", "bearer " + token);
            request.AddHeader("X-ARR-ClientCert", GetCertificate());
            request.AddHeader("PSU-Id", GetClientId());
            request.AddHeader(Constants.EbankitTenantKey, _tenantRetriever.Get().Id.ToString());

            AccountListResponse objResponse = new AccountListResponse();
            RestResponse objRestResponse = await objRestClient.ExecuteAsync(request);

            if (objRestResponse.StatusCode == System.Net.HttpStatusCode.OK)
            {
                objResponse = JsonConvert.DeserializeObject<AccountListResponse>(objRestResponse.Content);
                return new ServiceResult<AccountListResponse>(objResponse);
            }

            return new ServiceResult<AccountListResponse>();
        }

        public async Task<ServiceResult<IAccountBalanceResponse>> GetAccountTransaction(string consentId, string token, string accountId)
        {
            //API Call
            string strUri = _configuration.GetSection("Request:BaseEndpoints:PSD2Services").Value + "/psd2/accounts/" + accountId + "/balances";
            Uri objUri = new Uri(strUri);
            RestClient objRestClient = new RestClient(new RestClientOptions()
            {
                Encoding = Encoding.UTF8,
                BaseUrl = objUri
            });
            RestRequest request = new RestRequest() { RequestFormat = DataFormat.Json, Method = Method.Get };
            request.AddHeader("consentID", consentId);
            request.AddHeader("Authorization", "bearer " + token);
            request.AddHeader("X-ARR-ClientCert", GetCertificate());
            request.AddHeader("PSU-Id", GetClientId());
            request.AddHeader(Constants.EbankitTenantKey, _tenantRetriever.Get().Id.ToString());

            AccountBalanceResponse objResponse = new AccountBalanceResponse();
            RestResponse objRestResponse = await objRestClient.ExecuteAsync(request);

            if (objRestResponse.StatusCode == System.Net.HttpStatusCode.OK)
            {
                objResponse = JsonConvert.DeserializeObject<AccountBalanceResponse>(objRestResponse.Content);
                return new ServiceResult<IAccountBalanceResponse>(objResponse);
            }

            return new ServiceResult<IAccountBalanceResponse>();
        }

        public async Task<ServiceResult<ConsentStatusResponse>> GetConsentStatus(string consentID, string token)
        {
            //API Call
            string action = string.Format(_demoEndpoints.GetConsentStatus, consentID);
            string strUri = _configuration.GetSection("Request:BaseEndpoints:PSD2Services").Value + action;
            Uri objUri = new Uri(strUri);
            RestClient objRestClient = new RestClient(new RestClientOptions()
            {
                Encoding = Encoding.UTF8,
                BaseUrl = objUri
            });
            RestRequest request = new RestRequest() { RequestFormat = DataFormat.Json, Method = Method.Get };
            request.AddHeader("consentID", consentID);
            request.AddHeader("Authorization", "bearer " + token);
            request.AddHeader("X-ARR-ClientCert", GetCertificate());
            request.AddHeader("PSU-Id", GetClientId());
            request.AddHeader(Constants.EbankitTenantKey, _tenantRetriever.Get().Id.ToString());

            ConsentStatusResponse objResponse = new ConsentStatusResponse();
            RestResponse objRestResponse = await objRestClient.ExecuteAsync(request);

            if (objRestResponse.StatusCode == System.Net.HttpStatusCode.OK)
            {
                objResponse = JsonConvert.DeserializeObject<ConsentStatusResponse>(objRestResponse.Content);
                return new ServiceResult<ConsentStatusResponse>(objResponse);
            }

            return new ServiceResult<ConsentStatusResponse>();
        }

        public async Task<string> GetIdentityToken(string clientID, string secretID, string scope)
        {
            return _tokenService.GetToken(clientID, secretID, scope).GetAwaiter().GetResult().AccessToken;
        }

        public async Task<ServiceResult<PaymentStatusResponse>> GetPaymentStatus(string paymentID, string token)
        {
            //API Call
            string action = string.Format(_demoEndpoints.GetPaymentStatus, paymentID);
            string strUri = _configuration.GetSection("Request:BaseEndpoints:PSD2Services").Value + action;
            Uri objUri = new Uri(strUri);
            RestClient objRestClient = new RestClient(new RestClientOptions()
            {
                Encoding = Encoding.UTF8,
                BaseUrl = objUri
            });
            RestRequest request = new RestRequest() { RequestFormat = DataFormat.Json, Method = Method.Get };
            request.AddHeader("Authorization", "bearer " + token);
            request.AddHeader("X-ARR-ClientCert", GetCertificate());
            request.AddHeader("PSU-Id", GetClientId());
            request.AddHeader(Constants.EbankitTenantKey, _tenantRetriever.Get().Id.ToString());

            PaymentStatusResponse objResponse = new PaymentStatusResponse();
            RestResponse objRestResponse = await objRestClient.ExecuteAsync(request);

            if (objRestResponse.StatusCode == System.Net.HttpStatusCode.OK)
            {
                objResponse = JsonConvert.DeserializeObject<PaymentStatusResponse>(objRestResponse.Content);
                return new ServiceResult<PaymentStatusResponse>(objResponse);
            }

            return new ServiceResult<PaymentStatusResponse>();
        }

        private string GetCertificate()
        {
            var certFile = Path.Combine(Directory.GetCurrentDirectory(), _configuration.GetSection("Request:Client:FileCertificate").Value);
            return new X509Certificate2(certFile).GetRawCertDataString();
        }

        private string GetClientId()
        {
            return _httpContextAccessor.HttpContext.Request.Cookies["Client-Id"];
        }
    }
}
