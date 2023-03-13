using eBankit.FE.Simulators.Areas.TPP.Context.Interfaces;
using eBankit.FE.Simulators.TPP.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Controllers
{

    public class ManagerController : BaseTPPController
    {
        private readonly IConfiguration _configuration;
        private readonly ITppContext _tppContext;

        public ManagerController(IConfiguration configuration, ITppContext tppContext)
        {
            _configuration = configuration;
            _tppContext = tppContext;
        }

        public IActionResult Index()
        {
            HomeModel homeModel = new HomeModel()
            {
                ClientID = _configuration.GetSection("Request:Client:Id").Value,
                Scope = "Scope.PSD2.Services.AISP Scope.PSD2.Services.PISP Scope.PSD2.Services.PIISP",
                SecretID = _configuration.GetSection("Request:Client:Secret").Value
            };

            return View("~/Areas/TPP/Views/Manager/Demo.cshtml", homeModel);
        }

        public IActionResult Demo()
        {
            ViewData["Message"] = "DEMO TEXT";

            return View();
        }

        public IActionResult CallbackShow()
        {
            ViewData["Message"] = "Operation Completed Successfully";
            return View(new EndResultModel()
            {
                AutomaticClose = bool.TryParse(_configuration.GetSection("Request:AutomaticClose").Value, out bool result) ? result : false
            });
        }

        public IActionResult PaymentStatus()
        {
            return View(new EndResultModel()
            {
                AutomaticClose = bool.TryParse(_configuration.GetSection("Request:AutomaticClose").Value, out bool result) ? result : false
            });
        }


        public string DecodePayment(string URL)
        {
            List<string> lstUrlSplited = new List<string>(URL.Split('/'));
            string codedPaymentID = lstUrlSplited.Last();
            byte[] data = Convert.FromBase64String(codedPaymentID);
            string decodedPaymentID = Encoding.UTF8.GetString(data);
            return decodedPaymentID;
        }
        public async Task<JsonResult> GetHomeData(HomeModel objHomeModel)
        {
            var strToken = _tppContext.GetIdentityToken(objHomeModel.ClientID, objHomeModel.SecretID, objHomeModel.Scope).GetAwaiter().GetResult();
            HttpContext.Response.Cookies.Append("Client-Id", objHomeModel.ClientID);
            return Json(strToken);
        }

        public JsonResult CreateConsent(string token, string strBban)
        {
            ConsentRequestDTO objConsentRequest = new ConsentRequestDTO()
            {
                access = new Access(),
                recurringIndicator = true,
                validUntil = DateTime.Now.AddDays(30),
                frequencyPerDay = 10,
                combinedServiceIndicator = true
            };
            string urlDemo = Request.Headers["host"];

            if (!string.IsNullOrEmpty(strBban))
            {
                objConsentRequest.access.accounts = new AccountBban[1]
                {
                    new AccountBban()
                    {
                        bban = strBban
                    }
                };
                objConsentRequest.access.balances = new BalanceConsent[1]
                {
                    new BalanceConsent()
                    {
                        bban = strBban
                    }
                };
                objConsentRequest.access.transactions = new Transaction[1]
                {
                    new Transaction()
                    {
                        bban = strBban
                    }
                };
            }

            //API Call
            var objResponse = _tppContext.CreateConsent(objConsentRequest, token).GetAwaiter().GetResult();

            //GMBMOCK
            string scaLink = (objResponse.Result._links == null ? string.Empty : objResponse.Result._links.scaRedirect.value);
            return Json(objResponse.Result.consentId + '|' + scaLink);
        }

        public JsonResult GetAcountIdList(string consentId, string token)
        {
            //API Call
            var objResponse = _tppContext.GetAccountList(consentId, token).GetAwaiter().GetResult();

            return Json(objResponse.Result);
        }

        public JsonResult GetAccountBalance(string consentId, string token, string accountId, string balanceEndpoint)
        {
            var objResponse = _tppContext.GetAccountBalance(consentId, token, accountId, balanceEndpoint).GetAwaiter().GetResult();

            return Json(objResponse.Result);
        }

        public JsonResult GetAccountTransactions(string consentId, string token, string accountId)
        {
            var objResponse = _tppContext.GetAccountTransaction(consentId, token, accountId).GetAwaiter().GetResult();

            return Json(objResponse.Result);
        }

        public JsonResult GetConsentStatus(string consentID, string token)
        {
            var objResponse = _tppContext.GetConsentStatus(consentID, token).GetAwaiter().GetResult();

            return Json(objResponse.Result);
        }

        public JsonResult StartPayment(PaymentModel objPayment)
        {
            PaymentStart objPaymentRequest = new PaymentStart()
            {
                creditorAccount = new Creditoraccount()
                {
                    bban = objPayment.PaymentAccount
                },
                debtorAccount = new Debtoraccount()
                {
                    bban = objPayment.MyAccount
                },
                instructedAmount = new Instructedamount()
                {
                    amount = objPayment.Value,
                    currency = objPayment.Currency
                },
                creditorName = "PSD2_TESTE_4",
                endToEndIdentification = "PSD2_TESTE_4",
                remittanceInformationUnstructured = "Ref Number PSD2_TESTE_4"
            };

            var objResponse = _tppContext.CreatePayment(objPaymentRequest, objPayment.Token).GetAwaiter().GetResult();

            string scaLink = objResponse.Result?._links == null || objResponse.Result._links.IsEmpty() ? string.Empty : objResponse.Result._links[0].scaRedirect.href;
            List<string> lstLink = new List<string>(scaLink.Split('/'));
            string strAutorizationID = lstLink[6];
            return Json(objResponse.Result?.paymentId + '|' + strAutorizationID + "|" + scaLink);
        }

        public JsonResult GetPaymentStatus(string PaymentID, string token)
        {
            var objResponse = _tppContext.GetPaymentStatus(PaymentID, token).GetAwaiter().GetResult();

            return Json(objResponse.Result);
        }
    }
}
