@echo ***** Killing dotnet processes *****

SET idsPathSource=%cd%\IdentityServer\IdentityServer\IdentityServer.csproj
SET idsPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\IDS

@tasklist /FI "IMAGENAME eq dotnet.exe" | @find /I /N "dotnet.exe" > NUL
@if "%ERRORLEVEL%"=="0" @Taskkill /IM dotnet.exe /F
@echo.

@echo ***** Deleting IdentityServer files *****
@DEL /q "%idsPathTarget%\*"
@FOR /D %%p IN ("%idsPathTarget%\*.*") DO RMDIR "%%p" /s /q
@echo.

@echo ***** Publishing IdentityServer *****
DOTNET publish "%idsPathSource%" --output "%idsPathTarget%"
@echo.



