using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Context.Interfaces
{
    public interface IEmailManagementSettings
    {

        Client Client { get; set; }
        Defaults Defaults { get; set; }

        int MaxBulkInsertMarketingListMembers { get; set; }

        int MaxMarketingListMembersDemo { get; set; }
    }
}
