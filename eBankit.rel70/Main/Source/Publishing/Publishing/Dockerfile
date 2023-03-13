#GENERATED
FROM ebankitregistry.azurecr.io/ebankit/dotnet/sdk:win-4.8 AS build
WORKDIR /src

COPY Set-WebConfigSettings.ps1 Startup.ps1 ./www/
COPY Source/.nuget/ .nuget/
COPY Source/ ./Source/
COPY Suite/src/Core/ ./Suite/src/Core/
COPY Suite/src/LIB/ ./Suite/src/LIB/
COPY Suite/cache.json ./Suite/cache.json

RUN	nuget restore Source/ebankIt.Umbraco.sln -config Source/.nuget/NuGet.config

RUN	msbuild Source\Umbraco\Publishing\Web\ebankIT.Publishing.Web.csproj /t:rebuild -m /nr:false /p:RestoreIgnoreFailedSources=true /p:Configuration=Release /m  /p:DeployOnBuild=true /p:DeployDefaultTarget=WebPublish /p:WebPublishMethod=FileSystem /p:PublishBaseUrl='/src/www' /p:DebugSymbols=false /p:DebugType=None 

FROM mcr.microsoft.com/dotnet/framework/wcf:4.8 AS runtime

WORKDIR /tools
COPY --from=build /src/Tools/. ./

WORKDIR /inetpub/wwwroot
COPY --from=build /src/www/Set-WebConfigSettings.ps1 ./
COPY --from=build /src/www/Startup.ps1 ./
COPY --from=build /src/Source/Umbraco/Publishing/Web ./

RUN	icacls C:\inetpub\wwwroot /grant 'Everyone:F' /t

ENTRYPOINT ["powershell.exe", "c:\\inetpub\\wwwroot\\Startup.ps1"]

