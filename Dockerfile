FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["ReboBlog/ReboBlog.csproj", "ReboBlog/"]
RUN dotnet restore "ReboBlog/ReboBlog.csproj"
COPY . .
WORKDIR "/src/ReboBlog"
RUN dotnet build "ReboBlog.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ReboBlog.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "ReboBlog.dll"]
CMD ASPNETCORE_URLS=http://*:$PORT dotnet ReboBlog.dll
