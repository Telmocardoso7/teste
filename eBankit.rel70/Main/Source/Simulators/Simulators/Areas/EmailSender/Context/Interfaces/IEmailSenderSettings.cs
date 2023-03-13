using eBankit.FE.Simulators.CTI.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Context
{
    public interface IEmailSenderSettings
    { 
        EmailSenderEndpoints EmailSenderEndpoints { get; set; }
        int FetchRecordNumber { get; set; }
    }

    public class EmailSenderSettings: IEmailSenderSettings
    {
        public EmailSenderEndpoints EmailSenderEndpoints { get; set; }
        public int FetchRecordNumber { get; set; }
    }

    public class EmailSenderEndpoints
    {
        public string BaseUrl { get; set; }
        public string GetOutboundCampaign { get; set; }
        public string GetOutboundMessageQueue { get; set; }
        public string ProcessMarketingListToExternalProvider { get; set; }
        public string SetCampaignResponses { get; set; }
        public string FetchRecordNumber { get; set; }
        public string UpdateStateMessageQueueByCampaign { get; set; }
    }

}
