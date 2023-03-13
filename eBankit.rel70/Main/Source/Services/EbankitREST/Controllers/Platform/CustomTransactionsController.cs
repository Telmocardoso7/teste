using eBankit.MW.Common.Entities.Context;
using eBankit.MW.Common.Transactions;
using eBankit.MW.Services.Controllers.Platform;

namespace CSP.Services.Controllers.Platform
{
    /// <summary>
    /// 
    /// </summary>
    public class CustomTransactionsController : BasePlatformController
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="baseContext"></param>
        public CustomTransactionsController(IBaseContext baseContext, ITransactionFactory factory)
            : base(baseContext, factory)
        {
        }
    }
}

