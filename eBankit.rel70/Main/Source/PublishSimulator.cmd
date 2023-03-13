REM Simulators PATHS
SET simulatorsPathSource=%cd%\Simulators\Simulators\Simulators.csproj
SET simulatorsPathTarget=%cd%\..\..\Ebankit.rel70.NetCore\Simulators


@echo ***** Killing dotnet processes *****
@tasklist /FI "IMAGENAME eq dotnet.exe" | @find /I /N "dotnet.exe" > NUL
@if "%ERRORLEVEL%"=="0" @Taskkill /IM dotnet.exe /F
@echo.

@echo ***** Deleting Simulators files *****
@DEL /q "%simulatorsPathTarget%\*"
@FOR /D %%p IN ("%simulatorsPathTarget%\*.*") DO RMDIR "%%p" /s /q
@echo.

@echo ***** Publishing Simulators *****
@dotnet publish "%simulatorsPathSource%" --output "%simulatorsPathTarget%"
@echo.