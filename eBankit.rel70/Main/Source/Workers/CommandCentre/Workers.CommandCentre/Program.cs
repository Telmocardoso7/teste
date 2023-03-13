using eBankit.LIB.Common.Extensions;
using Microsoft.AspNetCore;
using Ebankit.Core.Application.Startup;
using Microsoft.AspNetCore.Hosting;
using Serilog;
using System;

namespace Workers.CommandCentre
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
