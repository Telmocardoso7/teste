using eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO;
using eBankit.FE.Simulators.Areas.EmailSender.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.Mapper
{
    public static class ErrorMapper
    {
        public static ErrorOut MapToDomain(this Error error)
        {
            if (error is null)
            {
                return null;
            }

            return new ErrorOut
            {
                Detail = error.detail,
                Instance = error.instance,
                Status = error.status,
                Title = error.title,
                Type = error.type
            };
        }
    }
}
