using eBankit.FE.Common.Entities.Models;
using eBankit.FE.Common.Entities.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.CTI.Context.Interfaces
{
    public interface IErrorContext
    {
        List<OutputMessage> Messages { get; set; }

        void AddMessage<T>(ServiceResult<T> serviceResult);
    }
}
