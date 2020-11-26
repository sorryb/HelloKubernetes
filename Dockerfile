FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /app

# copy csproj and restore
COPY ./HelloKubernetes.csproj ./aspnetapp/
RUN cd ./aspnetapp/ && dotnet restore 

# copy all files and build
COPY . ./aspnetapp/
WORKDIR /app/aspnetapp
RUN dotnet publish -c Debug -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim as runtime
WORKDIR /app
COPY --from=build /app/aspnetapp/out ./
ENTRYPOINT ["dotnet", "HelloKubernetes.dll"]