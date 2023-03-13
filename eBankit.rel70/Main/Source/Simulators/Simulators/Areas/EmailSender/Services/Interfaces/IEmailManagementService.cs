using eBankit.FE.Simulators.Areas.EmailSender.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Services.Interfaces
{
    public interface IEmailManagementService
    {

        Task<CampaignOut> CreateCampaign(List<MessageQueue> input, string campaignExternalProviderId);

        Task<ResponseCampaignOut> GetResponsesCampaign(string campaign_id);

    }
}
