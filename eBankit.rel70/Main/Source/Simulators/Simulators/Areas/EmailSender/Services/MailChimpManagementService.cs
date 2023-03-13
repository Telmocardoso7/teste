using eBankit.FE.Simulators.Areas.EmailSender.Clients.Interfaces;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.Mapper;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.Shared;
using eBankit.FE.Simulators.Areas.EmailSender.Context.Interfaces;
using eBankit.FE.Simulators.Areas.EmailSender.Models;
using eBankit.FE.Simulators.Areas.EmailSender.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Services
{
    public class MailChimpManagementService : IEmailManagementService
    {

        private readonly IMailChimpClient _apiClient;

        private readonly IEmailManagementSettings _settings;

        public MailChimpManagementService(IMailChimpClient apiClient, IEmailManagementSettings settings)
        {
            this._apiClient = apiClient;
            this._settings = settings;
        }

        public async Task<CampaignOut> CreateCampaign(List<MessageQueue> input, string campaignExternalProviderId)
        {
            var MaxNumberToProcess = _settings.MaxBulkInsertMarketingListMembers;
            input = input.Take(_settings.MaxMarketingListMembersDemo).ToList();

            var infoFirstQueue = input.FirstOrDefault();
            var list_id = string.Empty;

            if (infoFirstQueue.MarketingListProviderExternalId == null || string.IsNullOrEmpty(infoFirstQueue.MarketingListProviderExternalId))
            {
                var inpuAudience = new Audience();
                ApplyMarketingListDefaultValues(inpuAudience, infoFirstQueue);
                var audienceCreationResult = await this._apiClient.AddAudience(inpuAudience).ConfigureAwait(false);

                if (audienceCreationResult.Success)
                {
                    list_id = audienceCreationResult.Result.id;
                }
                else
                {
                    return new CampaignOut
                    {
                        Errors = new List<ErrorOut>()
                        {
                           audienceCreationResult.Error.MapToDomain()
                        },
                        MarketingListProviderExternalId = null,
                        CampaignProviderExternalId = null,
                        Status = ResponseStatusEnum.MarketingListError

                    };
                }
            }
            else
            {
                list_id = infoFirstQueue.MarketingListProviderExternalId;
            }


            var memberInfoColection = input.MapToDto();

            var membersSplitted = SplitList(memberInfoColection.ToList(), MaxNumberToProcess);

            var tasks = new List<Task<ApiResponse<Members, Error>>>();

            foreach (var memberList in membersSplitted)
            {
                var membersDto = new Members
                {
                    members = memberList.ToArray(),
                    update_existing = true
                };

                var addMembersToAudienceTask = this._apiClient.AddMembersToAudience(list_id, membersDto);

                tasks.Add(addMembersToAudienceTask);
            }

            var resultMembers = await Task.WhenAll(tasks);


            var success = resultMembers.Any(x => !x.Success) ? false : true;
            if (!success)
            {
                return new CampaignOut
                {
                    Errors = resultMembers.Where(x => !x.Success).Select(x => { return x.Error.MapToDomain(); }).ToList(),
                    MarketingListProviderExternalId = list_id,
                    CampaignProviderExternalId = null,
                    Status = ResponseStatusEnum.MembersError
                };

            }

            Campaign inputCampaign = new Campaign();


            if (!string.IsNullOrEmpty(campaignExternalProviderId))
            {
                return new CampaignOut
                {
                    Errors = null,
                    MarketingListProviderExternalId = list_id,
                    CampaignProviderExternalId = campaignExternalProviderId,
                    Status = ResponseStatusEnum.PartialSuccess
                };
            }
            try
            {
                FillCampaignInput(inputCampaign, list_id, infoFirstQueue);


            }
            catch (Exception ex)
            {

                return new CampaignOut
                {
                    Errors = new List<ErrorOut>() { new ErrorOut { Detail = ex.Message, Type = ex.GetType().FullName } },
                    MarketingListProviderExternalId = list_id,
                    CampaignProviderExternalId = null,
                    Status = ResponseStatusEnum.CampaignError
                };
            }

            var addCampaignTask = await _apiClient.AddCampaign(inputCampaign);


            return new CampaignOut
            {
                Errors = !addCampaignTask.Success ? new List<ErrorOut>() { addCampaignTask.Error.MapToDomain() } : null,
                MarketingListProviderExternalId = list_id,
                CampaignProviderExternalId = addCampaignTask.Success ? addCampaignTask.Result.id : null,
                Status = !addCampaignTask.Success ? ResponseStatusEnum.CampaignError : ResponseStatusEnum.Success
            };


        }

        public async Task<ResponseCampaignOut> GetResponsesCampaign(string campaign_id)
        {
            var CampaignResponses = new CampaignInfo();

            var getResponsesCampaignTask = await _apiClient.GetEmailsActivityCampaign(campaign_id);

            if (getResponsesCampaignTask.Success)
            {
                CampaignResponses = getResponsesCampaignTask.Result.MapToDomain();

            }

            return new ResponseCampaignOut
            {
                Error = getResponsesCampaignTask.Error.MapToDomain(),
                CampaignInfo = CampaignResponses,
                Success = getResponsesCampaignTask.Success
            };

        }


        private void FillCampaignInput(Campaign inputCampaign, string list_id, MessageQueue input)
        {

            inputCampaign.id = string.Empty;
            inputCampaign.type = _settings.Defaults.campaign_type;
            inputCampaign.create_time = DateTime.Now;

            inputCampaign.recipients = new Recipients
            {
                list_id = list_id
            };
            inputCampaign.settings = new Settings
            {
                title = input.CampaignName,
                template_id = Convert.ToInt32(input.Body)

            };

        }

        private void ApplyMarketingListDefaultValues(Audience inpuAudience, MessageQueue infoFirstQueue)
        {
            inpuAudience.name = string.IsNullOrEmpty(infoFirstQueue.MarketingListName) ? _settings.Defaults.name : infoFirstQueue.MarketingListName;
            inpuAudience.permission_reminder = string.IsNullOrEmpty(infoFirstQueue.MarketingListId.ToString()) ? infoFirstQueue.MarketingListId.ToString() : "Poc";
            inpuAudience.use_archive_bar = _settings.Defaults.use_archive_bar;
            inpuAudience.visibility = _settings.Defaults.visibility;
            inpuAudience.email_type_option = _settings.Defaults.email_type_option;
            inpuAudience.notify_on_subscribe = "";
            inpuAudience.notify_on_unsubscribe = "";
            inpuAudience.marketing_permissions = _settings.Defaults.marketing_permissions;
            inpuAudience.double_optin = _settings.Defaults.double_optin;

            inpuAudience.campaign_defaults = new CampaignDefaults();
            inpuAudience.campaign_defaults.from_email = _settings.Defaults.from_email;
            inpuAudience.campaign_defaults.from_name = _settings.Defaults.from_name;
            inpuAudience.campaign_defaults.language = _settings.Defaults.language;
            inpuAudience.campaign_defaults.subject = _settings.Defaults.subject;

            inpuAudience.contact = new Contact();
            inpuAudience.contact.address1 = _settings.Defaults.address1;
            inpuAudience.contact.address2 = "";
            inpuAudience.contact.city = _settings.Defaults.city;
            inpuAudience.contact.company = _settings.Defaults.company;
            inpuAudience.contact.country = _settings.Defaults.country;
            inpuAudience.contact.state = _settings.Defaults.state;
            inpuAudience.contact.zip = _settings.Defaults.zip;
            inpuAudience.contact.phone = _settings.Defaults.phone;

        }

        private static IEnumerable<List<T>> SplitList<T>(List<T> locations, int nSize = 30)
        {
            for (int i = 0; i < locations.Count; i += nSize)
            {
                yield return locations.GetRange(i, Math.Min(nSize, locations.Count - i));
            }
        }

    }
}
