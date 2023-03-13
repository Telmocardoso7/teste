using eBankit.FE.Simulators.Areas.EmailSender.Clients.Shared;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients
{
    public class BaseClient
    {
        private HttpClient httpclient;

        public BaseClient(string baseUrl)
        {
            this.httpclient = new HttpClient { BaseAddress = new Uri(baseUrl) };
        }

        public void AddBasicAuthorizationHeader(string value)
        {
            this.httpclient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", value);
        }

        public async Task<ApiResponse<TSuccess, TError>> ExecuteHttpRequest<TSuccess, TError>(HttpRequestMessage content)
        {
            using (var response = await this.httpclient.SendAsync(content))
            {
                var result = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
                if (response.IsSuccessStatusCode)
                {
                    try
                    {
                        return new ApiResponse<TSuccess, TError>
                        {
                            Result = JsonConvert.DeserializeObject<TSuccess>(result),
                            Success = true
                        };
                    }
                    catch 
                    {
                        return new ApiResponse<TSuccess, TError>
                        {
                            Success = false
                        };
                    }

                }

                return new ApiResponse<TSuccess, TError>
                {
                    Error = JsonConvert.DeserializeObject<TError>(result),
                    Success = false
                };
            }
        }

        public async Task<ApiResponse<TError>> ExecuteHttpRequest<TError>(HttpRequestMessage content)
        {
            using (var response = await this.httpclient.SendAsync(content))
            {
                var result = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
                if (response.IsSuccessStatusCode)
                {
                    try
                    {
                        return new ApiResponse<TError>
                        {
                            Success = true,
                            Error = default
                        };
                    }
                    catch 
                    {
                        return new ApiResponse<TError>
                        {
                            Success = false
                        };
                    }
                }

                return new ApiResponse<TError>
                {
                    Error = JsonConvert.DeserializeObject<TError>(result),
                    Success = false
                };
            }
        }


        public HttpRequestMessage CreateHttpRequestMessage(HttpMethod method, string uri, object input = null)
        {

            var httpRequestMessage = new HttpRequestMessage(method, $"{this.httpclient.BaseAddress}" + uri);

            if (input != null)
            {
                httpRequestMessage.Content = new StringContent(JsonConvert.SerializeObject(input), Encoding.UTF8, "application/json");
            }

            return httpRequestMessage;
        }
    }
}