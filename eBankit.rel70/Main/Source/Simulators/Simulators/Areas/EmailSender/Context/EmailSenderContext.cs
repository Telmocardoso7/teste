using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.Areas.EmailSender.Models;
using eBankit.LIB.ApiModel.Campaigns.Content;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Context.Interfaces
{
    public class EmailSenderContext : IEmailSenderContext
    {
        private readonly IEmailSenderService _service;

        public EmailSenderContext(IEmailSenderService service)
        {
            _service = service;
        }

        public List<MessageQueue> MessageQueue { get; set; }

        public List<OutboundCampaign> OutboundCampaigns { get; set; }

        public List<MessageQueue> GetMessageQueue(int pageNumber, int pageSize, string campaignCode)
        {
            var messageQueue = new List<MessageQueue>();
            var result =  _service.GetMessageQueue(pageNumber, pageSize, (int)ChannelEnum.EMAIL, campaignCode);

            if (result.Status == ServiceStatus.OK)
            {
                messageQueue =  result.Result;
            }

            return messageQueue;
        }

        public List<OutboundCampaign> GetOutboundCampaigns()
        {
            var messageQueue = new List<OutboundCampaign>();
            var result = _service.GetOutboundCampaign(); 

            if (result.Status == ServiceStatus.OK)
            {
                messageQueue = result.Result;
            }

            return messageQueue;
        }

        public bool AssociateExternalProviderId(Guid campaignId, string campaignExternalProviderId, Guid marketingListId, string marketingListExternalProviderId)
        {
            var result = _service.ProcessMarketingListToExternalProvider(campaignId, campaignExternalProviderId, marketingListId, marketingListExternalProviderId);

            if (result.Status == ServiceStatus.OK)
            {
                return true;
            }

            return false;
        }

        public bool SetCampaignResponses(CampaignInfo responses, List<MessageQueue> queuetoUpdate)
        {
            var result = _service.SetCampaignResponses(responses, queuetoUpdate);

            if (result.Status == ServiceStatus.OK)
            {
                return true;
            }

            return false;
        }

        public bool UpdateStateMessageQueueByCampaign(Guid campaignId, int stateId)
        {
            var result = _service.UpdateStateMessageQueueByCampaign(campaignId, stateId);

            if (result.Status == ServiceStatus.OK)
            {
                return true;
            }

            return false;
        }
    }
}
