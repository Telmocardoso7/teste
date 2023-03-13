using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.Interfaces
{
    public interface IMailChimpClient
    {
        Task<ApiResponse<Error>> healthCheck();
        Task<ApiResponse<AudienceOut, Error>> GetAudiences();
        Task<ApiResponse<AudienceOut, Error>> AddAudience(Audience input);
        Task<ApiResponse<Error>> DeleteAudience(Audience input);
        Task<ApiResponse<MemberInfo, Error>> AddMemberToAudience(string idList, MemberInfo input);
        Task<ApiResponse<Members, Error>> AddMembersToAudience(string list_id, Members input);
        Task<ApiResponse<MemberInfo, Error>> AddOrUpdateMemberToAudience(string idList, MemberInfo input);
        Task<ApiResponse<Templates, Error>> GetTemplates();
        Task<ApiResponse<Template, Error>> AddTemplate();
        Task<ApiResponse<Campaigns, Error>> GetAllCampaigns();
        Task<ApiResponse<Campaign, Error>> AddCampaign(Campaign input);
        Task<ApiResponse<Report, Error>> GetCampaignReport(string campaign_id);
        Task<ApiResponse<OpensReport, Error>> GetOpenedEmailCampaign(string campaign_id);
        Task<ApiResponse<Report, Error>> GetClickedReportedEmailCampaign(string campaign_id);
        Task<ApiResponse<InfoRecipients, Error>> GetInfoRecipientsEmailCampaign(string campaign_id);
        Task<ApiResponse<EmailsActivity, Error>> GetEmailsActivityCampaign(string campaign_id);
    }
}
