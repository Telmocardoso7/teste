using Ebankit.Core.Application.Startup;
using System;

namespace Ebankit.API.UserEngagementHub
{
    public class Program
    {
        public static void Main(string[] args)
        {
            new ApplicationBuilder()
                .Handle<Exception>()
                .Run<Startup>(args);
        }
    }
}
