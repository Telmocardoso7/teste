
ECHO OFF
TITLE Publish PSD2

REM SERVICES PATHS
SET servicesPathSource=%cd%\Services\EbankitREST\EbankitREST.csproj
SET servicesPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\Services

REM PORTALDEV PATHS
SET portalDevPathSource=%cd%\OpenBanking\DevPortal\DevPortal\DevPortal.csproj
SET portalDevPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\DevPortal

REM OBC PATHS
SET obcPathSource=%cd%\OpenBanking\Consents\OpenBanking.Consents\OpenBanking.Consents.csproj
SET obcPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\Consents

REM PSD2SERVICES PATHS
SET psd2ServicesPathSource=%cd%\OpenBanking\Services\OpenBanking.Services\OpenBanking.Services.csproj
SET psd2ServicesPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\OpenBankingServices

REM PSD2SANDBOX PATHS
SET psd2SandboxPathSource=%cd%\OpenBanking\Services\OpenBanking.Services\OpenBanking.Services.csproj
SET psd2SandboxPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\OpenBankingSandbox

REM GATEWAY PATHS
SET apiGatewayPathSource=%cd%\OpenBanking\Services\OpenBanking.Gateway\OpenBanking.Gateway.csproj
SET apiGatewayPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\APIGateway

CLS
ECHO ----------------------------------------
ECHO - EBANKIT SOLUTIONS 2022               -
ECHO -		  Open Banking PSD2 Publish     -
ECHO ----------------------------------------
ECHO.

ECHO What do you want to publish?
ECHO 1. Publish All
ECHO 2. Publish Services
ECHO 3. Publish API Gateway
ECHO 4. Publish PSD2 Services
ECHO 5. Publish PSD2 Services (Sandbox)
ECHO 6. Publish OBC
ECHO 7. Publish Portal DEV
ECHO.

CHOICE /C 1234567 /N /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 7 GOTO PortalDev
IF ERRORLEVEL 6 GOTO OBC
IF ERRORLEVEL 5 GOTO PSD2Sandbox
IF ERRORLEVEL 4 GOTO PSD2Services
IF ERRORLEVEL 3 GOTO Gateway
IF ERRORLEVEL 2 GOTO Services
IF ERRORLEVEL 1 GOTO All



:BaseStartup
ECHO ***** Killing dotnet processes *****
TASKLIST /FI "IMAGENAME eq dotnet.exe" | FIND /I /N "dotnet.exe" > NUL
IF "%ERRORLEVEL%"=="0" TASKKILL /IM dotnet.exe /F
ECHO.
GOTO :EOF
		 
:BaseApiGateway
ECHO ***** Deleting Api Gateway files *****
@DEL /q "%apiGatewayPathTarget%\*"
@FOR /D %%p IN ("%apiGatewayPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF
		 
		 
:BasePortalDev
ECHO ***** Deleting Portal Dev files *****
@DEL /q "%portalDevPathTarget%\*"
@FOR /D %%p IN ("%portalDevPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF

:BaseOBC
ECHO ***** Deleting OBC files *****
@DEL /q "%obcPathTarget%\*"
@FOR /D %%p IN ("%obcPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF

:BasePSD2Services
ECHO ***** Deleting PSD2 Services files *****
@DEL /q "%psd2ServicesPathTarget%\*"
@FOR /D %%p IN ("%psd2ServicesPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF	

:BasePSD2Sandbox
ECHO ***** Deleting PSD2 Services (Sandbox) files *****
@DEL /q "%psd2SandboxPathTarget%\*"
@FOR /D %%p IN ("%psd2SandboxPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF	
		 
:BaseStartupServices
ECHO ***** Deleting Services files *****
@DEL /q "%servicesPathTarget%\*"
@FOR /D %%p IN ("%servicesPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF		 
		 
		 
:All
CALL :BaseStartup
CALL :BaseStartupServices
ECHO ***** Publishing Services ***** 
DOTNET publish "%servicesPathSource%" --output "%servicesPathTarget%"
CALL :BasePortalDev
ECHO ***** Publishing Portal Dev ***** 
DOTNET publish "%portalDevPathSource%" --output "%portalDevPathTarget%"
CALL :BaseOBC
ECHO ***** Publishing OBC ***** 
DOTNET publish "%obcPathSource%" --output "%obcPathTarget%"
CALL :BasePSD2Services
ECHO ***** Publishing PSD2 Services ***** 
DOTNET publish "%psd2ServicesPathSource%" -c Live --output "%psd2ServicesPathTarget%"
CALL :BasePSD2Sandbox
ECHO ***** Publishing PSD2 Services (Sandbox) ***** 
DOTNET publish "%psd2SandboxPathSource%" -c Sandbox --output "%psd2SandboxPathTarget%"
CALL :BaseApiGateway
ECHO ***** Publishing Api Gateway ***** 
DOTNET publish "%apiGatewayPathSource%" --output "%apiGatewayPathTarget%"
GOTO End

:Services
CALL :BaseStartup
CALL :BaseStartupServices
ECHO ***** Publishing Services ***** 
DOTNET publish "%servicesPathSource%" --output "%servicesPathTarget%"
GOTO End

:Gateway
CALL :BaseStartup
CALL :BaseApiGateway
ECHO ***** Publishing Api Gateway ***** 
DOTNET publish "%apiGatewayPathSource%" --output "%apiGatewayPathTarget%"
GOTO End

:PSD2Services
CALL :BaseStartup
CALL :BasePSD2Services
ECHO ***** Publishing PSD2 Services ***** 
DOTNET publish "%psd2ServicesPathSource%" -c Live --output "%psd2ServicesPathTarget%"
GOTO End

:PSD2Sandbox
CALL :BaseStartup
CALL :BasePSD2Sandbox
ECHO ***** Publishing PSD2 Services (Sandbox) ***** 
DOTNET publish "%psd2SandboxPathSource%" -c Sandbox --output "%psd2SandboxPathTarget%"
GOTO End

:PortalDev
CALL :BaseStartup
CALL :BasePortalDev
ECHO ***** Publishing Portal Dev ***** 
DOTNET publish "%portalDevPathSource%" --output "%portalDevPathTarget%"
GOTO End

:OBC
CALL :BaseStartup
CALL :BaseOBC
ECHO ***** Publishing OBC ***** 
DOTNET publish "%obcPathSource%" --output "%obcPathTarget%"
GOTO End

:End
pause
exit 0


