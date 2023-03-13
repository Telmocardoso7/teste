using eBankit.FE.Simulators.Areas.EmailSender.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Context
{
    public interface IEmailSenderContext
    {
        List<MessageQueue> GetMessageQueue(int pageNumber, int pageSize, string CampaignCode);

        List<OutboundCampaign> GetOutboundCampaigns();

        bool AssociateExternalProviderId(Guid campaignId, string campaignExternalProviderId, Guid marketingListId, string marketingListExternalProviderId);

        bool SetCampaignResponses(CampaignInfo responses, List<MessageQueue> queuetoUpdate);

        bool UpdateStateMessageQueueByCampaign(Guid campaignId, int stateId);



    }
}
