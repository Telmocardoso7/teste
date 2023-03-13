using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using ebankit.FE.DevPortal;
using eBankit.FE.Common.Entities.PackageHelpers;
using eBankit.LIB.Logging.LogRegister;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace DevPortal
{
    public class Startup : BaseStartup
    {
        private BasePackageAssemblyAttribute _basePackageData { get; set; }

        public Startup(IWebHostEnvironment env, ILogger<BaseStartup> logger) : base( env, logger)
        {
        }
        
        public override void CustomConfigureServices(IServiceCollection services)
        {
        }

        public override void CustomConfigure(IApplicationBuilder app, IWebHostEnvironment env, IEbankitLogRegister logRegister)
        {
        }
        
    }
}
