using eBankit.FE.CC;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;

namespace CustomerServicesPlatform.CC
{
    public class Startup : BaseStartup
    {
        public Startup(IWebHostEnvironment env, ILogger<BaseStartup> logger) 
            : base(env, logger)
        {
        }
    }
}
