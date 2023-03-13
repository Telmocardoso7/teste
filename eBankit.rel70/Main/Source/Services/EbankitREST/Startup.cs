using eBankit.MW.Common.Transactions;
using eBankit.MW.Services;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;
using System.Reflection;

namespace CSP.Services
{
    public class Startup : eBankit.MW.Services.BaseStartup
    {
        public Startup(IWebHostEnvironment env, ILogger<BaseStartup> logger) 
            : base(env, logger)
        {
        }

        public override void RegisterCustomImplementations(IServiceCollection services)
        {
            Assembly repositoryAssembly = AppDomain.CurrentDomain.GetAssemblies().SingleOrDefault(assembly => assembly.GetName().Name == "eBankit.Middleware.Transactions.Core.Custom");

            if (repositoryAssembly != null)
            {
                var registrations =
                    from type in repositoryAssembly.GetExportedTypes()
                    where type.Namespace.StartsWith("eBankit.Middleware.Transactions.Core.Custom", StringComparison.InvariantCulture)
                    where type.GetInterfaces().Any(x => x.GetInterfaces().Where(y => y.Name == nameof(ICoreTransaction)).Any())
                    select new { Service = type.GetInterfaces().First(y => y.Name != nameof(ICoreTransaction)), Implementation = type };

                foreach (var reg in registrations)
                {
                    services.AddTransient(reg.Service, reg.Implementation);
                }
            }

            base.RegisterCustomImplementations(services);
        }
    }
}
