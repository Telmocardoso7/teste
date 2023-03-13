using eBankit.FE.EMS;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;

namespace EbankitManagementSystem
{
    public class Startup : BaseStartup
    {
        public Startup(IWebHostEnvironment env, ILogger<BaseStartup> logger)
            : base(env, logger)
        {
        }
    }
}
