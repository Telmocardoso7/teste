using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.Areas.EmailSender.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Context.Interfaces
{
    public interface IEmailSenderService
    {
        ServiceResult<List<MessageQueue>> GetMessageQueue(int pageNumber, int pageSize, int channelId, string campaignCode);
        ServiceResult<List<OutboundCampaign>> GetOutboundCampaign();
        ServiceResult<bool> ProcessMarketingListToExternalProvider(Guid campaignId, string campaignExternalProviderId, Guid marketingListId, string marketingListExternalProviderId);
        ServiceResult<bool> SetCampaignResponses(CampaignInfo responses, List<MessageQueue> queuetoUpdate);
        ServiceResult<bool> UpdateStateMessageQueueByCampaign(Guid campaignId, int stateId);
    }
}
