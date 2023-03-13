using eBankit.FE.Simulators.Areas.EmailSender.Clients;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.Shared;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.Interfaces;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using eBankit.FE.Simulators.Areas.EmailSender.Context.Interfaces;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp
{
    public class MailChimpClient : BaseClient, IMailChimpClient
    {
        private readonly IEmailManagementSettings _settings;

        public MailChimpClient(IEmailManagementSettings settings) : base(settings.Client.ExternalApiURL)
        {
            _settings = settings;
            this.AddBasicAuthorizationHeader(settings.Client.ApiKey);
        }

        private string CreateHash(string email)
        {
            // Creates an instance of the default implementation of the MD5 hash algorithm.
            using (var md5Hash = MD5.Create())
            {
                // Byte array representation of source string
                var sourceBytes = Encoding.UTF8.GetBytes(email);

                // Generate hash value(Byte Array) for input data
                var hashBytes = md5Hash.ComputeHash(sourceBytes);

                // Convert hash byte array to string
                var hash = BitConverter.ToString(hashBytes).Replace("-", string.Empty);

                return hash;
            }
        }

        public async Task<ApiResponse<Error>> healthCheck()
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Get, ("/ping"));
            return await this.ExecuteHttpRequest<AudienceOut, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Get information about all audience lists  in the account.
        /// </summary>
        public async Task<ApiResponse<AudienceOut, Error>> GetAudiences()
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Get, "/lists");
            return await this.ExecuteHttpRequest<AudienceOut, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Create a new audience list in your Mailchimp account.
        /// </summary>
        public async Task<ApiResponse<AudienceOut, Error>> AddAudience(Audience input)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Post, "/lists", input);

            return await this.ExecuteHttpRequest<AudienceOut, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Delete a list from your Mailchimp account. If you delete a list, you'll lose the list history—including subscriber activity,
        ///unsubscribes, complaints, and bounces. You’ll also lose subscribers’ email addresses, unless you exported and backed up your list.
        /// </summary>
        public async Task<ApiResponse<Error>> DeleteAudience(Audience input)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Delete, "/lists", input);

            return await this.ExecuteHttpRequest<Error>(httpRequestMessage);
        }

        /// <summary>
        ///Add a new member to the audience list.
        /// </summary>
        public async Task<ApiResponse<MemberInfo, Error>> AddMemberToAudience(string idList, MemberInfo input)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Post, $"/lists/{idList}/members", input);
            return await this.ExecuteHttpRequest<MemberInfo, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Add a new member to the audience list.
        /// </summary>
        public async Task<ApiResponse<MemberInfo, Error>> AddOrUpdateMemberToAudience(string idList, MemberInfo input)
        {
            var hash = CreateHash(input.email_address);
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Put, $"/lists/{idList}/members/{hash}", input);
            return await this.ExecuteHttpRequest<MemberInfo, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Batch subscribe or unsubscribe list members.
        /// </summary>
        public async Task<ApiResponse<Members, Error>> AddMembersToAudience(string list_id, Members input)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Post, $"/lists/{list_id}", input);
            return await this.ExecuteHttpRequest<Members, Error>(httpRequestMessage);
        }


        /// <summary>
        ///Get a list of an account's available templates.
        /// </summary>
        public async Task<ApiResponse<Templates, Error>> GetTemplates()
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Get, $"/templates");
            return await this.ExecuteHttpRequest<Templates, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Create a new template for the account.Only Classic templates are supported.
        /// </summary>
        public async Task<ApiResponse<Template, Error>> AddTemplate()
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Post, $"/templates");
            return await this.ExecuteHttpRequest<Template, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Get all campaigns in an account.
        /// </summary>
        public async Task<ApiResponse<Campaigns, Error>> GetAllCampaigns()
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Get, $"/campaigns");
            return await this.ExecuteHttpRequest<Campaigns, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Create a new Mailchimp campaign.
        /// </summary>
        public async Task<ApiResponse<Campaign, Error>> AddCampaign(Campaign input)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Post, $"/campaigns", input);
            return await this.ExecuteHttpRequest<Campaign, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Remove a campaign from your Mailchimp account.
        /// </summary>
        public async Task<ApiResponse<Error>> DeleteCampaign(string campaign_id)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Delete, $"/campaigns/{campaign_id}");
            return await this.ExecuteHttpRequest<Error>(httpRequestMessage);
        }

        /// <summary>
        ///Get report details for a specific sent campaign.
        /// </summary>
        public async Task<ApiResponse<Report, Error>> GetCampaignReport(string campaign_id)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Get, $"/reports/{campaign_id}");
            return await this.ExecuteHttpRequest<Report, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Get detailed information about any campaign emails that were opened by a list member.
        /// </summary>
        public async Task<ApiResponse<OpensReport, Error>> GetOpenedEmailCampaign(string campaign_id)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Get, $"/reports/{campaign_id}/open-details");
            return await this.ExecuteHttpRequest<OpensReport, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Get information about clicks on specific links in your Mailchimp campaigns.
        /// </summary>
        public async Task<ApiResponse<Report, Error>> GetClickedReportedEmailCampaign(string campaign_id)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Get, $"/reports/{campaign_id}/click-details");
            return await this.ExecuteHttpRequest<Report, Error>(httpRequestMessage);
        }

        /// <summary>
        ///Get information about campaign recipients.
        /// </summary>
        public async Task<ApiResponse<InfoRecipients, Error>> GetInfoRecipientsEmailCampaign(string campaign_id)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Get, $"/reports/{campaign_id}/sent-to");
            return await this.ExecuteHttpRequest<InfoRecipients, Error>(httpRequestMessage);
        }


        /// <summary>
        ///Get a list of member's subscriber activity in a specific campaign.
        /// </summary>
        public async Task<ApiResponse<EmailsActivity, Error>> GetEmailsActivityCampaign(string campaign_id)
        {
            var httpRequestMessage = this.CreateHttpRequestMessage(HttpMethod.Get, $"/reports/{campaign_id}/email-activity");
            return await this.ExecuteHttpRequest<EmailsActivity, Error>(httpRequestMessage);
        }
    }
}