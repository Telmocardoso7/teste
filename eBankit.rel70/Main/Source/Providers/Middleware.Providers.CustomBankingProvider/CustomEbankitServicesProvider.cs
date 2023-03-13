using eBankit.Business.Entities;
using eBankit.Common.Services;
using eBankit.Common.Settings;
using System.ServiceModel;
using ManagementServiceClientWrapper = eBankit.Common.Services.ServiceClientWrapper<Middleware.Proxy.CustomEbankit.EbankitCustomService.EbankitCustomServiceClient, Middleware.Proxy.CustomEbankit.EbankitCustomService.IEbankitCustomService>;

namespace Middleware.Providers.CustomBankingProvider
{
    public class CustomEbankitServicesProvider : CustomBankingProvider
    {
        static string url = AppSettings.GetAppSetting("eBankit.Middleware.EbankitServices.CustomEbankitService", true);

        WebServiceConfig config = new WebServiceConfig(new EndpointAddress(url), new BasicHttpBinding("WCFServiceBinding"), null, ignoreSslErrors: true);

        //public override ServiceOutputHeader GetExecutedOrders(ServiceInputHeader inHeader, PaymentOrderSearchCriteria criteria, out SavedPaymentOrderCollection returnValue)
        //{
        //    using (var serviceClientWrapper = new ManagementServiceClientWrapper(config))
        //    {
        //        var result = serviceClientWrapper.CreateServiceClient().GetExecutedOrders(inHeader, criteria, out returnValue);
        //        return result;
        //    }
        //}

    }
}