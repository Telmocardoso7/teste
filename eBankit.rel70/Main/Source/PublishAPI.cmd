ECHO OFF
TITLE Publish API

REM Settings PATHS
SET SettingsPathSource=%cd%\API\Ebankit.API.Settings\Ebankit.API.Settings.csproj
SET SettingsPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\API\Settings

REM UserEngagementHub PATHS
SET UserEngagementHubPathSource=%cd%\API\Ebankit.API.UserEngagementHub\Ebankit.API.UserEngagementHub.csproj
SET UserEngagementHubPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\API\UserEngagementHub

ECHO --------------------------------------------------------------------
ECHO - EBANKIT SOLUTIONS 2022                                           -
ECHO - Orchestrator API													-
ECHO --------------------------------------------------------------------
ECHO.

IF [%1]==[] GOTO Menu
IF %1==3 GOTO UserEngagementHubAPI
IF %1==2 GOTO SettingsAPI
IF %1==1 GOTO All

:Menu
ECHO What do you want to publish?
ECHO 1. Publish All
ECHO 2. Publish Settings API
ECHO 3. Publish UserEngagementHub API

CHOICE /C 123 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 3 GOTO UserEngagementHubAPI
IF ERRORLEVEL 2 GOTO SettingsAPI
IF ERRORLEVEL 1 GOTO All

:BaseStartup
ECHO ***** Killing dotnet processes *****
TASKLIST /FI "IMAGENAME eq dotnet.exe" | FIND /I /N "dotnet.exe" > NUL
IF "%ERRORLEVEL%"=="0" TASKKILL /IM dotnet.exe /F
ECHO.
GOTO :EOF
		 
:BaseStartupSettingsAPI
ECHO ***** Deleting Settings files *****
@DEL /q "%SettingsPathTarget%\*"
@FOR /D %%p IN ("%SettingsPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF		 

:BaseStartupUserEngagementHubAPI
ECHO ***** Deleting UserEngagementHub files *****
@DEL /q "%UserEngagementHubPathTarget%\*"
@FOR /D %%p IN ("%UserEngagementHubPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF

:All
CALL :BaseStartup
CALL :BaseStartupSettingsAPI
ECHO ***** Publishing Settings API ***** 
DOTNET publish "%SettingsPathSource%" --output "%SettingsPathTarget%" -c Production
CALL :BaseStartupUserEngagementHubAPI
ECHO ***** Publishing UserEngagementHub API ***** 
DOTNET publish "%UserEngagementHubPathSource%" --output "%UserEngagementHubPathTarget%" -c debug
GOTO End

:SettingsAPI
CALL :BaseStartup
CALL :BaseStartupSettingsAPI
ECHO ***** Publishing Settings API *****
DOTNET publish "%SettingsPathSource%" --output "%SettingsPathTarget%" -c Production
GOTO End

:UserEngagementHubAPI
CALL :BaseStartup
CALL :BaseStartupUserEngagementHubAPI
ECHO ***** Publishing UserEngagementHub API *****
DOTNET publish "%UserEnggementHubPathSource%" --output "%UserEngagementHubPathTarget%" -c debug
GOTO End

:End
