
ECHO OFF
TITLE Publish CampaignOutbound Engine Worker Service

REM Worker Services
SET servicesPathSource=%cd%\Workers\CampaignOutboundEngine\Workers.CampaignOutboundEngine\Workers.CampaignOutboundEngine.csproj
SET servicesPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\CampaignOutboundWorkers\CampaignOutboundEngineWorker

ECHO --------------------------------------------------------------------
ECHO - CampaignOutbound Engine Worker Service					        -
ECHO --------------------------------------------------------------------
ECHO.

GOTO All

:BaseStartup
ECHO ***** Killing dotnet processes *****
TASKLIST /FI "IMAGENAME eq dotnet.exe" | FIND /I /N "dotnet.exe" > NUL
IF "%ERRORLEVEL%"=="0" TASKKILL /IM dotnet.exe /F
ECHO.
GOTO :EOF
		 
:BaseStartupCampaignOutboundEngine
ECHO ***** Deleting Services files *****
@DEL /q "%servicesPathTarget%\*"
@FOR /D %%p IN ("%servicesPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF		 

:ALL
CALL :BaseStartup
CALL :BaseStartupCampaignOutboundEngine
ECHO ***** Publishing CampaignOutbound Engine Worker Services *****
DOTNET publish "%servicesPathSource%" --output "%servicesPathTarget%"
	


REM -----------------------------------------------CampaignOutbound Dispatcher--------------------------------------------------------------------------------------------

ECHO OFF
TITLE Publish CampaignOutbound Dispatcher Worker Service

SET servicesPathSource=%cd%\Workers\CampaignOutboundEngine\Dispatcher\Workers.CampaignOutboundEngine.Dispatcher\Workers.CampaignOutboundEngine.Dispatcher.csproj
SET servicesPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\CampaignOutboundWorkers\CampaignOutboundDispatcherWorker

ECHO --------------------------------------------------------------------
ECHO - CampaignOutbound Dispatcher Worker Service					                -
ECHO --------------------------------------------------------------------
ECHO.

GOTO All

:BaseStartup
ECHO ***** Killing dotnet processes *****
TASKLIST /FI "IMAGENAME eq dotnet.exe" | FIND /I /N "dotnet.exe" > NUL
IF "%ERRORLEVEL%"=="0" TASKKILL /IM dotnet.exe /F
ECHO.
GOTO :EOF
		 
:BaseStartupCampaignOutboundDispatcher
ECHO ***** Deleting Services files *****
@DEL /q "%servicesPathTarget%\*"
@FOR /D %%p IN ("%servicesPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF		 

:ALL
CALL :BaseStartup
CALL :BaseStartupCampaignOutboundDispatcher
ECHO ***** Publishing CampaignOutbound Dispatcher Worker Services *****
DOTNET publish "%servicesPathSource%" --output "%servicesPathTarget%"


SET servicesPathSource=%cd%\Workers\CampaignOutboundEngine\SyncPushTokens\Workers.CampaignOutboundEngine.SyncPushTokens\Workers.CampaignOutboundEngine.SyncPushTokens.csproj
SET servicesPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\CampaignOutboundWorkers\SyncPushTokensWorker

ECHO --------------------------------------------------------------------
ECHO - EBANKIT SOLUTIONS 2020                                           -
ECHO - Campaign Outbound Sync Push Tokens Worker Service				-
ECHO --------------------------------------------------------------------
ECHO.

GOTO All

:BaseStartup
ECHO ***** Killing dotnet processes *****
TASKLIST /FI "IMAGENAME eq dotnet.exe" | FIND /I /N "dotnet.exe" > NUL
IF "%ERRORLEVEL%"=="0" TASKKILL /IM dotnet.exe /F
ECHO.
GOTO :EOF
		 
:BaseStartupWorkers
ECHO ***** Deleting Services files *****
@DEL /q "%servicesPathTarget%\*"
@FOR /D %%p IN ("%servicesPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF		 

:ALL
CALL :BaseStartup
CALL :BaseStartupWorkers
ECHO ***** Publishing Campaign Outbound Engine Sync Push Tokens Worker Services *****
DOTNET publish "%servicesPathSource%" --output "%servicesPathTarget%"
GOTO End

:End

REM -----------------------------------------------COMMANDCENTRE--------------------------------------------------------------------------------------------

ECHO OFF
TITLE Publish Command Centre Worker Service

REM Worker Services
SET servicesPathSource=%cd%\Workers\CommandCentre\Workers.CommandCentre\Workers.CommandCentre.csproj
SET servicesPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\CommandCentreWorker

ECHO --------------------------------------------------------------------
ECHO - Command Centre Worker Service					                -
ECHO --------------------------------------------------------------------
ECHO.

GOTO All

:BaseStartup
ECHO ***** Killing dotnet processes *****
TASKLIST /FI "IMAGENAME eq dotnet.exe" | FIND /I /N "dotnet.exe" > NUL
IF "%ERRORLEVEL%"=="0" TASKKILL /IM dotnet.exe /F
ECHO.
GOTO :EOF
		 
:BaseStartupCommandCentre
ECHO ***** Deleting Services files *****
@DEL /q "%servicesPathTarget%\*"
@FOR /D %%p IN ("%servicesPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF		 

:ALL
CALL :BaseStartup
CALL :BaseStartupCommandCentre
ECHO ***** Publishing Command Centre Worker Services *****
DOTNET publish "%servicesPathSource%" --output "%servicesPathTarget%"		

REM ----------------------------------------------- Operation Worker --------------------------------------------------------------------------------------------

ECHO OFF
TITLE Publish Operation Worker Service

REM Worker Services
SET servicesPathSource=%cd%\Workers\Operations\Worker.Operations\Worker.Operations.csproj
SET servicesPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\OperationWorker

ECHO --------------------------------------------------------------------
ECHO -       Operation Worker Service					                -
ECHO --------------------------------------------------------------------
ECHO

GOTO All
		 
:BaseStartupOperation
ECHO ***** Deleting Services files *****
@DEL /q "%servicesPathTarget%\*"
@FOR /D %%p IN ("%servicesPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO
GOTO :EOF		 

:ALL
CALL :BaseStartupOperation
ECHO ***** Publishing Operation Worker Services *****
DOTNET publish "%servicesPathSource%" --output "%servicesPathTarget%"
