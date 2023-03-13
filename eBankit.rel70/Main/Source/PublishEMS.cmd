
ECHO OFF
TITLE Publish eBankit.rel70

REM SERVICES PATHS
SET servicesPathSource=%cd%\Services\EbankitREST\EbankitREST.csproj
SET servicesPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\Services

REM SHELL PATHS
SET shellPathSource=%cd%\EMS\EbankitManagementSystem\EbankitManagementSystem.csproj
SET shellPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\EMS

CLS
ECHO ----------------------------------------
ECHO - EBANKIT SOLUTIONS 2022               -
ECHO - eBankit.rel70 Publish               -
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
ECHO ***** Killing w3wp processes *****
TASKLIST /FI "IMAGENAME eq w3wp.exe" | FIND /I /N "w3wp.exe" > NUL
TASKKILL /IM w3wp.exe /F
ECHO
GOTO :EOF
		 
:BaseStartupShell
ECHO ***** Deleting Shell files *****
@DEL /q "%shellPathTarget%\*"
@FOR /D %%p IN ("%shellPathTarget%\*.*") DO RMDIR "%%p" /s /q
ECHO.
GOTO :EOF		 
		  
:All
CALL :BaseStartup
CALL :BaseStartupServices
ECHO ***** Publishing Services ***** 
DOTNET publish "%servicesPathSource%" --output "%servicesPathTarget%"
CALL :BaseStartupShell
ECHO ***** Publishing Shell ***** 
DOTNET publish "%shellPathSource%" --output "%shellPathTarget%" -c EMS
GOTO End
		 	 
:FE
CALL :BaseStartup
CALL :BaseStartupShell
ECHO ***** Publishing Shell ***** 
DOTNET publish "%shellPathSource%" --output "%shellPathTarget%" -c EMS
GOTO End

:Services
CALL :BaseStartup
CALL :BaseStartupServices
ECHO ***** Publishing Services ***** 
DOTNET publish "%servicesPathSource%" --output "%servicesPathTarget%"
GOTO End

:End
pause
exit 0



