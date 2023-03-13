using eBankit.MW.OpenBanking.Services;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;

namespace OpenBanking.Services
{
    public class Startup : BaseStartup
    {
        public Startup(IWebHostEnvironment env, ILogger<BaseStartup> logger)
            : base(env, logger)
        {
        }
    }
}
