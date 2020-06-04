FROM mcr.microsoft.com/dotnet/core/sdk:latest as build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM mcr.microsoft.com/dotnet/core/aspnet:latest
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet","AspNetCoreOnDocker.dll"]
