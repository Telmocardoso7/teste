using eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO;
using eBankit.FE.Simulators.Areas.EmailSender.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.Mapper
{
    public static class EmailsMapper
    {
        public static CampaignInfo MapToDomain(this EmailsActivity emailsActivitys)
        {
            if (emailsActivitys is null)
            {
                return null;
            }

            var customersActions = new CampaignInfo();
            customersActions.CustomerAction = new List<CustomerAction>();

            foreach (var item in emailsActivitys.emails)
            {
                var email = item.email_address;
                var action = string.Empty;


                if (item.activity == null || item.activity.Count <= 0)
                {
                    customersActions.CustomerAction.Add(new CustomerAction { Email = email, Action = action });
                }
                else
                {
                    foreach (var item2 in item.activity)
                    {
                        action = item2.action;
                        customersActions.CustomerAction.Add(new CustomerAction { Email = email, Action = action });
                    }
                }

            }

            customersActions.CampaignProviderExternalId = emailsActivitys.campaign_id;

            return customersActions;
        }


    }
}
