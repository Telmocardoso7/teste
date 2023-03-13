using Ebankit.Core.MultiTenancy.Common.Retriever.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace eBankit.FE.Simulators.CTI.Controllers
{
    [Area("CTI")]
    public class BaseCTIController : Controller
    {
        protected readonly ITenantRetriever _tenantRetriever;
        public BaseCTIController(ITenantRetriever tenantRetriever)
        {
            _tenantRetriever = tenantRetriever;
        }
    }
}
