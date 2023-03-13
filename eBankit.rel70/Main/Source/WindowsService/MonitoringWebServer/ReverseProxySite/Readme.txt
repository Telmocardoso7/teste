1) Install Web Platform (https://www.microsoft.com/web/downloads/platform.aspx). (necessário para o URL Rewrite)

2) Run "Web Platform" and search for "URL Rewrite".

3) Click "Add" and "Install".

4) Back in IIS, select your connections root and, in the Actions pane, choose Get New Web Platform Components:

a.    If you do not have Web Platform Installer installed, keep on installing it;


5)   Use the installed Web Platform Installer to search for and install the following applications:

a.    URL Rewrite 2.1 or higher

b.    Application Request Routing 2.5 or higher

c.    External Cache 1.1 or higher


6)   Again, in the IIS connections root, in the Home pane, IIS section, double-click Application Request Routing Cache:

a.    In the Actions pane, choose Proxy/Server Proxy Settings…

b.    This opens the Application Request Routing window. Allow the option Enable proxy:


7) To Install an instance of the monitorService: 

	4.1) Open a cmd and exec: sc create ebankit.Monitoring binPath= "C:\path\...\MonitorWebServer.exe" DisplayName="ebankit.Monitoring.Instance"
	4.2) Run the windows service.

	NOTE: If you need to remove the windows service, open a cmd and exec: "sc delete ebankit.Monitoring"