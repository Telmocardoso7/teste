using eBankit.GatewayApi;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;

namespace OpenBanking.Gateway
{
    public class Startup : BaseStartup
    {
        public Startup(IWebHostEnvironment env, ILogger<BaseStartup> logger)
            : base(env, logger)
        {
        }
    }
}
