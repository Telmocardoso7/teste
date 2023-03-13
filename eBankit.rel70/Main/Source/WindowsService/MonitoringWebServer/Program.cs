using eBankit.Middleware.MonitorWebServer;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration.Install;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;

namespace MonitorWebServer
{
    public class Program
    {
        /// <summary>
        /// The main entry point for the process
        /// </summary>
        static void Main(string[] args)
        {
            ProgramStart.Start(args);
        }
    }
}
