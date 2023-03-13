using eBankit.FE.Simulators.Areas.MAIL.Controllers;
using eBankit.FE.Simulators.Areas.EmailSender.Context;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eBankit.FE.Simulators.Areas.EmailSender.Models;
using Newtonsoft.Json.Bson;
using eBankit.FE.Simulators.Areas.EmailSender.Context.Interfaces;
using eBankit.FE.Simulators.Areas.EmailSender.Services.Interfaces;
using System.ComponentModel;

namespace eBankit.FE.Simulators.Areas.EmailSender.Controllers
{
    public class EmailSenderManagerController : BaseEmailSenderController
    {
        private readonly IEmailSenderContext _context;
        private readonly IEmailManagementService _mailChimpManagementService;
        private readonly IEmailSenderSettings _emailSenderSettings;

        public EmailSenderManagerController(IEmailSenderContext context, IEmailManagementService mailChimpManagementService, IEmailSenderSettings emailSenderSettings)
        {
            _context = context;
            _mailChimpManagementService = mailChimpManagementService;
            _emailSenderSettings = emailSenderSettings;
        }

        public IActionResult Index()
        {
            var outboundCampaigns = _context.GetOutboundCampaigns();

            var model = new IndexModel()
            {
                Campaigns = outboundCampaigns,
                Loaded = false
               
            };

            return View("~/Areas/EmailSender/Views/Manager/Index.cshtml", model);
        }

        public async Task<IActionResult> ProcessCampaign(MessageQueueInput input)
        {
            var fetchRecords =_emailSenderSettings.FetchRecordNumber;
          
            var model = new IndexModel()
            {
                Campaigns = _context.GetOutboundCampaigns()
            };

            var selectedCampaign = model.Campaigns.FirstOrDefault(a => a.CampaignCode == input.CampaignCode);

            if (selectedCampaign != null)
            {
                var totalRecords = selectedCampaign.TotalQueue;
                var stepChunk = Math.Ceiling(Convert.ToDouble(totalRecords / (double)fetchRecords));
                
                var pageNumber = 1;

                var messageQueue = new List<MessageQueue>();  
              
                for (int i = 0; i < stepChunk; i++)
                {
                    var queue = _context.GetMessageQueue(pageNumber, (int)fetchRecords, input.CampaignCode);

                    if (queue.Any())
                    {
                        model.Loaded = true;

                        if (model.CampaignDetail == null)
                        {
                            model.CampaignDetail = new CampaignDetail()
                            {
                                CampaignId = queue.FirstOrDefault().CampaignId,
                                CampaignName = queue.FirstOrDefault().CampaignName,
                                CampaignCode = queue.FirstOrDefault().CampaignCode,
                                MarketingListTotal = queue.FirstOrDefault().TotalQueue,
                                MarketingListName = queue.FirstOrDefault().MarketingListName,
                                Subject = queue.FirstOrDefault().Subject,
                                MarketingListId = queue.FirstOrDefault().MarketingListId

                            };
                        }

                        pageNumber++;
                    }

                    messageQueue.AddRange(queue);
                }
                
                var Result = await _mailChimpManagementService.CreateCampaign(messageQueue, selectedCampaign.CampaignProviderExternalId);

                switch (Result.Status)
                {
                    case ResponseStatusEnum.Success:
                        SetProviderExternal(model.CampaignDetail.CampaignId, Result.CampaignProviderExternalId, model.CampaignDetail.MarketingListId, Result.MarketingListProviderExternalId);
                        
                        var result = UpdateStateToMessageQueue(model.CampaignDetail.CampaignId, (int)MessageQueueStateEnum.SUCCESS);

                        if (!result)
                        {
                            model.HasErrors = true;
                            model.ErrorMessage ="An error occurerd when try update Message Queue Status";   
                        }

                        break;
                        
                    case ResponseStatusEnum.PartialSuccess:
                        model.ProcessStatusDescription = "This campaign was already processed!";
                        break;
                    case ResponseStatusEnum.MarketingListError:
                        model.HasErrors = true;
                        model.ErrorMessage = "An error occurerd when try create a marketing list";
                        break;
                    case ResponseStatusEnum.MembersError:
                        model.HasErrors = true;
                        model.ErrorMessage = "An error occurerd when try add/update members";
                        break;
                    case ResponseStatusEnum.CampaignError:
                        model.HasErrors = true;
                        model.ErrorMessage = "An error occurerd when try add campaign";
                        break;
                    default:
                        break;
                }
            }
            return View("~/Areas/EmailSender/Views/Manager/_MarketingListSummary.cshtml", model);
        }

        #region Responses
        public async Task<IActionResult> GetCampaignResponses(MessageQueueInput input)
        {
            var model = new IndexModel()
            {
                Campaigns = _context.GetOutboundCampaigns(),
                HasResponses = true,
                Loaded = true
                
            };

            var selectedCampaign = model.Campaigns.FirstOrDefault(a => a.CampaignCode == input.CampaignCode);

            var result = await _mailChimpManagementService.GetResponsesCampaign(selectedCampaign.CampaignProviderExternalId);

            if (result.Success)
            {
                
                result.CampaignInfo.CampaignId = selectedCampaign.CampaignId;
                result.CampaignInfo.ChannelId = (int)ChannelEnum.EMAIL;

                var emailsWithErros = new List<MessageQueue>();

                var messageQueue = GetEmailMessageQueue(selectedCampaign.CampaignCode, selectedCampaign.TotalQueue);

                var successfullDispatch = result.CampaignInfo.CustomerAction.Where(a=>a.Action != "bounce").Select(a => a.Email).Distinct();

                emailsWithErros = messageQueue.Where(o => !successfullDispatch.Contains(o.Email)).ToList();
                result.CampaignInfo.CustomerAction = result.CampaignInfo.CustomerAction.Where(o => successfullDispatch.Contains(o.Email) && !string.IsNullOrEmpty(o.Action)).ToList();
                var responseResult = _context.SetCampaignResponses(result.CampaignInfo, emailsWithErros);

                if (!responseResult)
                {
                    model.HasErrors = true;
                    model.ErrorMessage = "Error processing responses to EMS";
                   
                }

            }
            else
            {
                model.HasErrors = true;
                model.ErrorMessage = "Error Getting resposnses from MailChimp";

              
            }
            return View("~/Areas/EmailSender/Views/Manager/_campaignResponses.cshtml", model);
        }


        #endregion


        #region private
        private void SetProviderExternal(Guid campaignId, string campaignExternaProviderId, Guid marketingListId, string marketingListProviderExternalId)
        {
            _context.AssociateExternalProviderId(campaignId, campaignExternaProviderId, marketingListId, marketingListProviderExternalId);
        }

        private bool UpdateStateToMessageQueue(Guid campaignId, int stateId)
        {
           return _context.UpdateStateMessageQueueByCampaign(campaignId, stateId);
        }

        private List<MessageQueue> GetEmailMessageQueue(string campaignCode, int totalRecords)
        {
            var fetchRecords = _emailSenderSettings.FetchRecordNumber;
            var stepChunk = Math.Ceiling(Convert.ToDouble(totalRecords / (double)fetchRecords));

            var pageNumber = 1;

            var messageQueue = new List<MessageQueue>();

            for (int i = 0; i < stepChunk; i++)
            {
                var queue = _context.GetMessageQueue(pageNumber, (int)fetchRecords, campaignCode);
                messageQueue.AddRange(queue);
                pageNumber++;
            }

            return messageQueue;
        }

        #endregion


    }
}
