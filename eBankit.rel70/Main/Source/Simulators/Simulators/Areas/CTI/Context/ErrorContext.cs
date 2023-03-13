using System;
using System.Collections.Generic;
using eBankit.FE.Common.Entities.Enums;
using eBankit.FE.Common.Entities.Models;
using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.CTI.Context.Interfaces;

namespace eBankit.FE.Simulators.CTI.Context
{
    public class ErrorContext : IErrorContext
    {
        private readonly ICacheManager _cache;

        public ErrorContext(ICacheManager cache)
        {
            _cache = cache;
        }

        public List<OutputMessage> Messages
        {
            get => _cache.GetSession<List<OutputMessage>>("Messages");
            set => _cache.SaveSession("Messages", value);
        }

        public void AddMessage<T>(ServiceResult<T> serviceResult)
        {
            var messages = Messages ?? new List<OutputMessage>();

            if (serviceResult.Status == ServiceStatus.OK)
            {
                messages.Add(new OutputMessage { Message = $"{DateTime.Now} - Success", Type = MessageType.Success });
            }
            else
            {
                messages.Add(new OutputMessage
                {
                    Message = $"{DateTime.Now} - Error!",
                    Description = $"{serviceResult.Error.Code}: {serviceResult.Error.Message}",
                    Type = MessageType.Error
                });
            }

            Messages = messages;
        }
    }
}