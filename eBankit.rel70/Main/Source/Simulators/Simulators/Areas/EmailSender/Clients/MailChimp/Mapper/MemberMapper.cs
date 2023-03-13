using eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO;
using eBankit.FE.Simulators.Areas.EmailSender.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.Mapper
{
    public static class MemberInfoMapper
    {
        public static MemberInfo MapToDto(this MessageQueue messageQueue)
        {
            if (messageQueue is null)
            {
                return null;
            }

            int firstSpaceIndex = string.IsNullOrEmpty(messageQueue.Name)? 0 : messageQueue.Name.IndexOf(" ");

            return new MemberInfo
            {
                email_address = messageQueue.Email,
                merge_fields = new
                {
                    FNAME = string.IsNullOrEmpty(messageQueue.Name) ? string.Empty :messageQueue.Name.Substring(0, firstSpaceIndex),
                    LNAME = string.IsNullOrEmpty(messageQueue.Name) ? string.Empty :messageQueue.Name.Remove(0, messageQueue.Name.IndexOf(' ') + 1),
                    PHONE = messageQueue.CellPhone

                },
                status = "subscribed"
            };
        }

        public static IEnumerable<MemberInfo> MapToDto(this List<MessageQueue> messageQueue)
        {
            if (messageQueue is null)
            {
                return null;
            }

            return messageQueue.Select(MapToDto);
        }



    }
}
