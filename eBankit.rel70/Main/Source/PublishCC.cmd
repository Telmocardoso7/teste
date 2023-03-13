
ECHO OFF
TITLE Publish eBankit.rel70

REM SERVICES PATHS
SET servicesPathSource=%cd%\Services\EbankitREST\EbankitREST.csproj
SET servicesPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\Services

REM SHELL PATHS
SET shellPathSource=%cd%\CSP\CustomerServicesPlatform.CC\CustomerServicesPlatform.CC.csproj
SET shellPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\ContactCenter

CLS
ECHO ----------------------------------------
ECHO - EBANKIT SOLUTIONS 2022               -
ECHO - eBankit.rel70 Publish				-
ECHO ----------------------------------------
ECHO.

ECHO What do you want to publish?
ECHO 1. Publish All
ECHO 2. Publish Services
ECHO 3. Publish FE
ECHO.

CHOICE /C 123 /N /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 3 GOTO FE
IF ERRORLEVEL 2 GOTO Services
IF ERRORLEVEL 1 GOTO All

:BaseStartup
ECHO ***** Killing dotnet processes *****
TASKLIST /FI "IMAGENAME eq dotnet.exe" | FIND /I /N "dotnet.exe" > NUL
IF "%ERRORLEVEL%"=="0" TASKKILL /IM dotnet.exe /F
ECHO.
GOTO :EOF
		 
:BaseStartupShell
ECHO ***** Deleting Shell files *****
@DEL /q "%shellPathTarget%\*"
@FOR /D %%p IN ("%shellPathTarget%\*.*") DO RMDIR "%%p" /s /q
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
CALL :BaseStartupShell
ECHO ***** Publishing Shell ***** 
DOTNET publish "%shellPathSource%" --output "%shellPathTarget%" -c CC
GOTO End


:FE
CALL :BaseStartup
CALL :BaseStartupShell
ECHO ***** Publishing Shell ***** 
DOTNET publish "%shellPathSource%" --output "%shellPathTarget%" -c CC
GOTO End

:Services
CALL :BaseStartup
CALL :BaseStartupServices
ECHO ***** Publishing Services ***** 
DOTNET publish "%servicesPathSource%" --output "%servicesPathTarget%"
GOTO End

:End
ECHO ***** Doing aditional tasks *****
MKDIR "%cd%\..\..\Ebankit.rel70.NetCore\ContactCenter\ExternalServices"
pause
exit 0




