using IdentityServer4.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Models
{
    public enum MessageQueueStateEnum
    {
        PROCESSING =1,
        SUCCESS = 3
    }
}
