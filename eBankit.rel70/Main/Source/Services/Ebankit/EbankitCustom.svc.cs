using eBankit.Business.Entities;
using eBankit.Business.Entities.Account;
using eBankit.Business.Entities.Authentication;
using eBankit.Business.Entities.Dto;
using eBankit.Business.Entities.Interaction;
using eBankit.Business.Entities.Test;
using eBankit.Business.Entities.Workflow.Core;
using eBankit.Business.Entities.Workflow.Engine.Soap;
using eBankit.Common.Providers.Workflow;
using eBankit.Lib.ApiModel.SecurityCenter.User;
using eBankit.Middleware.Common.Service;
using eBankit.Middleware.Common.Transaction;
using eBankit.Middleware.Core.Transaction;
using eBankit.Middleware.eBankitServices;
using eBankit.Middleware.Providers.Ebankit;
using eBankit.Middleware.Transactions.eBankit.Customer;
using eBankit.Middleware.Transactions.eBankit.Generic;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;

namespace Ebankit
{
    [SessionRequired]
    public class EbankitCustom : CommonBaseService, IEbankitCustom
    {

    }
}