using Ebankit.FE.OBC;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;

namespace OpenBanking.Consents
{
    public class Startup : BaseStartup
    {
        public Startup(IWebHostEnvironment env, ILogger<BaseStartup> logger) 
            : base(env, logger)
        {
        }
    }
}
