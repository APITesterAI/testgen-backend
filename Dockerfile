# Build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copy and restore
COPY TestGenApi/*.csproj ./TestGenApi/
RUN dotnet restore ./TestGenApi/TestGenApi.csproj

# Copy everything and publish
COPY . .
RUN dotnet publish ./TestGenApi/TestGenApi.csproj -c Release -o out

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .

EXPOSE 10000
ENV ASPNETCORE_URLS=http://+:10000

ENTRYPOINT ["dotnet", "TestGenApi.dll"]