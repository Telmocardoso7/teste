using Ebankit.FE.IdentityServer;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;

namespace IdentityServer
{
    public class Startup : BaseStartup
    {
        public Startup(IWebHostEnvironment env, ILogger<BaseStartup> logger)
            : base(env, logger)
        {
        }
    }
}
