using Ebankit.Core.Application.Startup;
using Microsoft.AspNetCore.Hosting;
using Serilog;
using System;

namespace Worker.Operations
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
