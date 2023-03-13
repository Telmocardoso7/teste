using eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.Mapper
{
    public static class SentMapper
    {
        public static List<string> MapToDomain(this List<SentTo> sentTo)
        {
            if (sentTo is null)
            {
                return null;
            }

            var resultList = new List<string>();

            foreach (var item in sentTo)
            {
                if (item.status != "sent")
                {
                    resultList.Add(item.email_address);
                }
            }

            return resultList;
        }
    }
}
