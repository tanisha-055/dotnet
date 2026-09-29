FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY UserRegistrationApp/UserRegistrationApp.csproj UserRegistrationApp/
RUN dotnet restore UserRegistrationApp/UserRegistrationApp.csproj

COPY UserRegistrationApp/ UserRegistrationApp/

WORKDIR /src/UserRegistrationApp
RUN dotnet publish UserRegistrationApp.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app

COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "UserRegistrationApp.dll"]