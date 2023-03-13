using eBankit.FE.Common.Entities.Repositories;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.Interfaces;
using eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp;
using eBankit.FE.Simulators.Areas.EmailSender.Context;
using eBankit.FE.Simulators.Areas.EmailSender.Context.Interfaces;
using eBankit.FE.Simulators.Areas.EmailSender.Services;
using eBankit.FE.Simulators.Areas.EmailSender.Services.Interfaces;
using eBankit.FE.Simulators.Areas.TPP.Context;
using eBankit.FE.Simulators.Areas.TPP.Context.Interfaces;
using eBankit.FE.Simulators.Common;
using eBankit.FE.Simulators.Common.Interfaces;
using eBankit.FE.Simulators.CTI.Context;
using eBankit.FE.Simulators.CTI.Context.Interfaces;
using eBankit.FE.Simulators.CTI.Services;
using eBankit.FE.Simulators.CTI.Services.Interfaces;
using eBankit.FE.Simulators.CTI.Signals;
using eBankit.FE.Simulators.CTI.Signals.Interfaces;
using eBankit.FE.Simulators.TPP.Models;
using eBankit.LIB.Common.Authentication;
using eBankit.LIB.Common.Authentication.Discovery;
using eBankit.LIB.Common.Extensions;
using Ebankit.Core.Caching.CM;
using Ebankit.Core.Caching.CM.SqlServer;
using Ebankit.Core.Data.Extensions;
using Ebankit.Core.Data.Wrapper;
using Ebankit.Core.MultiTenancy.Common.Builder.Interfaces;
using Ebankit.Core.MultiTenancy.Core.Extensions;
using IdentityModel.Client;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.DataProtection.Repositories;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Net.Http;

namespace eBankit.FE.Simulators
{
    public class BaseStartup
    {
        public BaseStartup(IWebHostEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddEbankitJsonFiles()
                .AddEnvironmentVariables();

            Configuration = builder.Build();
        }

        public IConfigurationRoot Configuration { get; private set; }

        public void ConfigureServices(IServiceCollection services)
        {
            services.ConfigureSameSiteCookiePolicy();

            bool.TryParse(Configuration.GetSection("GlobalSettings:IdentityClient:RequireHTTPS").Value, out bool tokenRequireHttps);

            services.AddMultiTenancy(Configuration);
            services.AddDataAccessWrapper(Configuration);
            ConfigureCache(services);
            services.AddSingleton<IConfiguration>(Configuration);
            services.AddSingleton(Configuration);

            Dictionary<Guid, IConfiguration> tenantConfigurations = null;
            if (Configuration.IsInMultiTenantEnvironment())
            {
                services.TryAddTenantConfigurationRoot(Configuration, out tenantConfigurations);
            }

            services.AddHttpClient();
            services.AddDiscoveryCache(Configuration, "GlobalSettings:IdentityClient:TokenAuthorityUrl", tokenRequireHttps);

            ConfigureSession(services);
            services.AddSession(options =>
            {
                var hasTimeout = double.TryParse(Configuration.GetSection("SessionSettings:IdleTimeout").Value, out double idletimeout);

                options.Cookie.SecurePolicy = tokenRequireHttps ? CookieSecurePolicy.Always : CookieSecurePolicy.SameAsRequest;
                options.Cookie.Name = Configuration.GetSection("SessionSettings:CookieName").Value;
                options.IdleTimeout = TimeSpan.FromSeconds(hasTimeout ? idletimeout : 300);
                options.Cookie.HttpOnly = true;
            });

            ConfigureCommonSettings(services, "GlobalSettings:IdentityClient:TokenAuthorityUrl", tokenRequireHttps);
            ConfigureCtiSettings(services, tenantConfigurations);
            ConfigureTppSettings(services);
            ConfigureEmailSenderSettings(services);

            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_3_0);
        }

        public virtual void ConfigureCache(IServiceCollection services)
        {
            var tenantKeyBuilder = services.BuildServiceProvider().GetRequiredService<ITenantKeyBuilder>();

            if (Configuration.GetSection("sql") != null)
                services.AddCMCache(tenantKeyBuilder, Configuration, new SqlCacheConfigurationLoader());
            else
                services.AddCMCache(tenantKeyBuilder, Configuration);
        }

        /// <summary>
        /// Configures the distributed cache.
        /// </summary>
        /// <param name="services">The services.</param>
        public virtual void ConfigureSession(IServiceCollection services)
        {
            services.AddMemoryCache();
            if (Configuration.GetSection("SessionSettings:Use").Value?.ToLower() == "redis")
            {
                //Add DataProtection Redis
                services.AddDistributedRedisCache(options =>
                {
                    options.InstanceName = string.Format(Configuration.GetSection("SessionSettings:Redis:InstanceName").Value, "Simulators");
                    options.Configuration = Configuration.GetSection("SessionSettings:Redis:Configuration").Value;
                });
            }
            else if (Configuration.GetSection("SessionSettings:Use").Value?.ToLower() == "sql")
            {
                // this part expects that you've already registered an IDbConnection implemention
                services.AddSingleton<IXmlRepository, SqlXmlRepository>(servicesProvider => new SqlXmlRepository(servicesProvider.GetRequiredService<IDataAccessWrapper>(), Configuration.GetSection("SessionSettings:Sql:ConnectionString").Value));

                var sp = services.BuildServiceProvider();
                services.AddDataProtection()
                    .AddKeyManagementOptions(options => options.XmlRepository = sp.GetService<IXmlRepository>());

                services.AddDistributedSqlServerCache(options =>
                {
                    options.ConnectionString = Configuration.GetSection("SessionSettings:Sql:ConnectionString").Value;
                    options.SchemaName = Configuration.GetSection("SessionSettings:Sql:SchemaName").Value;
                    options.TableName = Configuration.GetSection("SessionSettings:Sql:TableName").Value;
                });
            }

            if (Configuration.GetSection("SessionSettings:Use").Value?.ToLower() == "redis")
                services.AddDistributedRedisCache(options =>
                {
                    options.InstanceName = Configuration.GetSection("SessionSettings:Redis:InstanceName").Value;
                    options.Configuration = Configuration.GetSection("SessionSettings:Redis:Configuration").Value;
                });
            else if (Configuration.GetSection("SessionSettings:Use").Value?.ToLower() == "sql")
            {
                if (!int.TryParse(Configuration.GetSection("SessionSettings:Sql:DefaultSlidingExpirationInSeconds").Value, out int defaultSlidingExpiration))
                {
                    defaultSlidingExpiration = 3600;
                }

                services.AddDistributedSqlServerCache(options =>
                {
                    options.ConnectionString = Configuration.GetSection("SessionSettings:Sql:ConnectionString").Value;
                    options.SchemaName = Configuration.GetSection("SessionSettings:Sql:SchemaName").Value;
                    options.TableName = Configuration.GetSection("SessionSettings:Sql:TableName").Value;
                    options.DefaultSlidingExpiration = new TimeSpan(0, 0, defaultSlidingExpiration);
                });
            }
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseMultiTenancy();

            app.UseSession();
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseRouting();
            app.UseCookiePolicy();

            UseCommon(app);
            UseCti(app);
            UseIvr(app);

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "areas",
                    pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");

                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");

                endpoints.MapControllers();
            });
        }

        #region Common
        private void ConfigureCommonSettings(IServiceCollection services, string sectionKey, bool requireHttps)
        {
            services.AddSingleton<ITokenService, TokenService>(servicesProvider =>
            {
                return new TokenService(servicesProvider.GetRequiredService<DiscoveryCacheFactory>(), sectionKey, requireHttps);
            });
        }

        private void UseCommon(IApplicationBuilder app)
        {
        }

        #endregion

        #region CTI
        private void ConfigureCtiSettings(IServiceCollection services, Dictionary<Guid, IConfiguration> tenantConfigurations)
        {
            services.AddSingleton<IErrorContext, ErrorContext>();
            services.AddSingleton<ICacheManager, CTI.Context.CacheManager>();
            services.AddSingleton<ICtiService, CtiService>();
            services.AddSingleton<ICtiContext, CtiContext>();
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            services.AddScoped<SimulatorHub>();
            services.AddScoped<ISimulatorInteractions, SimulatorInteractions>();
            services.AddSignalR();
            services.ConfigureTenantOptions<IdentitySettings>(Configuration, "CtiSettings:IdentityClient", tenantConfigurations);
            services.Configure<CtiSettings>(Configuration.GetSection("CtiSettings"));

            var ctiSettings = Configuration.GetSection("CtiSettings");
            var settings = ctiSettings.Get<CtiSettings>();

            services.AddSingleton(typeof(ICtiSettings), settings);

        }

        private void UseCti(IApplicationBuilder app)
        {
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHub<SimulatorHub>("/signalr/simulator");
            });
        }
        #endregion

        #region TPP
        private void ConfigureTppSettings(IServiceCollection services)
        {
            var demoSettings = this.Configuration.GetSection("DemoEnpoints");
            services.Configure<IDemoEndpoints>(demoSettings);
            var _demoEndpoints = demoSettings.Get<DemoEndpoints>();
            services.AddSingleton(typeof(IDemoEndpoints), _demoEndpoints);

            // Refactor to Scoped
            services.AddSingleton<ITppContext, TppContext>();
        }

        private void UseIvr(IApplicationBuilder app)
        {
        }
        #endregion

        private void ConfigureEmailSenderSettings(IServiceCollection services)
        {
            var emailSenderSettings = this.Configuration.GetSection("EMailSenderSettings");
            services.Configure<IEmailSenderSettings>(emailSenderSettings);
            var _emailSenderSettings = emailSenderSettings.Get<EmailSenderSettings>();
            services.AddSingleton(typeof(IEmailSenderSettings), _emailSenderSettings);
            var emailManagementSettings = this.Configuration.GetSection("EmailManagementSettings");
            services.Configure<IEmailManagementSettings>(emailManagementSettings);
            var _emailManagementSettings = emailManagementSettings.Get<EmailManagementSettings>();
            services.AddSingleton(typeof(IEmailManagementSettings), _emailManagementSettings);
            services.AddSingleton<IEmailSenderContext, EmailSenderContext>();
            services.AddSingleton<IEmailSenderService, EmailSenderService>();
            services.AddSingleton<IMailChimpClient, MailChimpClient>();
            services.AddSingleton<IEmailManagementService, MailChimpManagementService>();
        }
    }
}

