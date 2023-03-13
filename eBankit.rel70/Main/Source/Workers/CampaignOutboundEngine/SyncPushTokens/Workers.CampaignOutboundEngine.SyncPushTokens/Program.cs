using System;
using Ebankit.Core.Application.Startup;
using Microsoft.AspNetCore.Hosting;
using Serilog;

namespace Workers.CampaignOutboundEngine.SyncPushTokens
{
    public class Program
    {
        public static void Main(string[] args)
        {
            new WebHostApplicationBuilder()
                    .Handle<Exception>()
                    .Run<Startup>(args, x => x.UseIISIntegration().UseSerilog());
        }
    }
}
