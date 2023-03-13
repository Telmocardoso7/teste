using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.Areas.EmailSender.Context.Interfaces;
using eBankit.FE.Simulators.Areas.EmailSender.Models;
using eBankit.LIB.ApiModel.ExtendedProperties;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Context
{
    public class EmailSenderService : IEmailSenderService
    {
        private readonly IEmailSenderSettings _settings;

        public EmailSenderService(IEmailSenderSettings settings)
        {
            _settings = settings;
        }

        public ServiceResult<List<MessageQueue>> GetMessageQueue(int pageNumber, int pageSize, int channelId, string campaignCode)
        {
            var url = $"{_settings.EmailSenderEndpoints.BaseUrl + _settings.EmailSenderEndpoints.GetOutboundMessageQueue}?pageNumber={pageNumber.ToString()}&pageSize={pageSize.ToString()}&channelId={channelId.ToString()}&campaignCode={campaignCode.ToString()}";

            var result = Get<List<MessageQueue>>(url).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<List<OutboundCampaign>> GetOutboundCampaign()
        {
            var url = $"{_settings.EmailSenderEndpoints.BaseUrl + _settings.EmailSenderEndpoints.GetOutboundCampaign}";

            var result = Get<List<OutboundCampaign>>(url).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> ProcessMarketingListToExternalProvider(Guid campaignId, string campaignExternalProviderId, Guid marketingListId, string marketingListExternalProviderId)
        {
            var externalProvider = new ExternalProviderInput
            {
                CampaignId = campaignId,
                CampaignProviderExternalId = campaignExternalProviderId,
                MarketingListId = marketingListId,
                MarketingListProviderExternalId = marketingListExternalProviderId
            };

            var result = POST<bool, ExternalProviderInput>(_settings.EmailSenderEndpoints.BaseUrl + _settings.EmailSenderEndpoints.ProcessMarketingListToExternalProvider, externalProvider).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> SetCampaignResponses(CampaignInfo responses, List<MessageQueue> queueToUpdate)
        {
            responses.RecordsToUpdate = queueToUpdate;
            var result = POST<bool, CampaignInfo>(_settings.EmailSenderEndpoints.BaseUrl + _settings.EmailSenderEndpoints.SetCampaignResponses, responses).GetAwaiter().GetResult();

            return result;
        }

        public ServiceResult<bool> UpdateStateMessageQueueByCampaign(Guid campaignId, int stateId)
        {
            var input = new UpdateStateMessageQueue()
            {
                CampaignId = campaignId,
                StateId = stateId
            };

            var result = POST<bool, UpdateStateMessageQueue>(_settings.EmailSenderEndpoints.BaseUrl + _settings.EmailSenderEndpoints.UpdateStateMessageQueueByCampaign, input).GetAwaiter().GetResult();

            return result;
        }

        #region HTTP Methods
        public async Task<ServiceResult<T>> Get<T>(string url, params string[] inputArgs)
        {
            try
            {
                var httpClientHandler = new HttpClientHandler
                {
                    AllowAutoRedirect = true,
                    UseCookies = true,
                    CookieContainer = new CookieContainer()
                };

                var httpClient = new HttpClient(httpClientHandler);
           
                var args = string.Empty;
                if (inputArgs != null)
                {
                    args = inputArgs.Aggregate(args, (current, a) => string.Format("{0}/{1}", current, a));
                }

                var request = $"{url}{args}";

                ServiceResult<T> result;

                using (httpClient)
                {
                    var response = await httpClient.GetAsync(request);
                    if (response.IsSuccessStatusCode)
                    {
                        var content = await response.Content.ReadAsStringAsync();

                        result = JsonConvert.DeserializeObject<ServiceResult<T>>(content);
                    }
                    else
                    {
                        result = JsonConvert.DeserializeObject<ServiceResult<T>>(response.Content.ReadAsStringAsync().Result);

                        if (result?.Error == null)
                        {
                            return new ServiceResult<T>
                            {
                                Error = new ServiceError(response.StatusCode.ToString(), response.ReasonPhrase),
                                Status = ServiceStatus.NOK
                            };
                        }
                        return new ServiceResult<T>
                        {
                            Error = result.Error,
                            Status = ServiceStatus.NOK
                        };
                    }
                }

                return result;

            }
            catch (Exception e)
            {
                return new ServiceResult<T>
                {
                    Error = new ServiceError("500", e.Message),
                    Status = ServiceStatus.NOK
                };
            }
        }

        public async Task<ServiceResult<T>> POST<T, E>(string url, E input, object extendedProperties = null)
        {
            var httpClientHandler = new HttpClientHandler
            {
                AllowAutoRedirect = true,
                UseCookies = true,
                CookieContainer = new CookieContainer()
            };

            var httpClient = new HttpClient(httpClientHandler);

            var request = $"{url}";

            var result = default(ServiceResult<T>);

            var wrapperObject = EbankitBodyWrapperHelper.WrapExtendedProperties(input, extendedProperties);

            using (httpClient)
            {
                httpClient.DefaultRequestHeaders.Accept.Clear();
                httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                var str = (extendedProperties != null) ? new StringContent(JsonConvert.SerializeObject(wrapperObject), Encoding.UTF8, "application/json") : new StringContent(JsonConvert.SerializeObject(input), Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(request, str);
                if (response.IsSuccessStatusCode)
                {
                    var content = await response.Content.ReadAsStringAsync();
                    result = JsonConvert.DeserializeObject<ServiceResult<T>>(content);
                }
                else
                {
                    result = JsonConvert.DeserializeObject<ServiceResult<T>>(response.Content.ReadAsStringAsync().Result);

                    if (result?.Error == null)
                    {
                        return new ServiceResult<T>
                        {
                            Error = new ServiceError(response.StatusCode.ToString(), response.ReasonPhrase),
                            Status = ServiceStatus.NOK
                        };
                    }
                    return new ServiceResult<T>
                    {
                        Error = result.Error,
                        Status = ServiceStatus.NOK
                    };
                }
            }

            return result;
        }
      
        #endregion
    }
}
