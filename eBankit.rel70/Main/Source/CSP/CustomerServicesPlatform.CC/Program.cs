using eBankit.LIB.Common.Extensions;
using eBankit.LIB.Logging.Configuration;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Serilog;
using System;
using System.IO;

namespace CustomerServicesPlatform.CC
{
    public class Program
    {
        /// <summary>
        /// Gets the application.
        /// </summary>
        /// <value>
        /// The application.
        /// </value>
        private static string _application => !string.IsNullOrEmpty(Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT_APPLICATION")) ? Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT_APPLICATION") : "";

        /// <summary>
        /// Additional custom environment key
        /// Enables the loading of custom environment configuration
        /// appsettings.[application].[custom_environment].json
        /// endpoints.[application].[custom_environment].json
        /// </summary>
        private static string _customEnvironment => !string.IsNullOrEmpty(Environment.GetEnvironmentVariable("ASPNETCORE_ADDITIONAL_CUSTOM_ENVIRONMENT")) ? Environment.GetEnvironmentVariable("ASPNETCORE_ADDITIONAL_CUSTOM_ENVIRONMENT") : "";

        public static void Main(string[] args)
        {
            var builder = new ConfigurationBuilder()
                    .SetBasePath(Directory.GetCurrentDirectory())
                    .AddEbankitJsonFiles()
                    .AddEnvironmentVariables();

            var configuration = builder.Build();

            Log.Logger = new LoggerConfiguration()
            .ReadFrom.Configuration(configuration)
            .CreateLogger();

            try
            {
                Log.Information(_application + ": Starting host");
                CreateWebHostBuilder(args).Build().Run();
            }
            catch (Exception ex)
            {
                Log.Fatal(ex, _application + ": " + LogMessage.ErrorInitializingApplication);
            }
            finally
            {
                Log.CloseAndFlush();
            }
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>()
                .UseDefaultServiceProvider(options =>
                    options.ValidateScopes = false)
                .UseSerilog();
    }
}
