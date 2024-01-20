FROM mcr.microsoft.com/mssql/server:2022-CU11-ubuntu-22.04

LABEL Name=NorthWindDb Version=1.0.0
LABEL Author="Stephen Rebner"

WORKDIR /usr/src/NorthWindDb

# copy all local files to the working directory on the container
COPY . .

ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=Password123!
ENV MSSQL_PID=Developer
ENV Port=1433
ENV User=SA
ENV Instance=localhost

# start the SQL Server process
# and run the RestoreNorthwindDb.sql script
RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 10 \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password123!" -i RestoreNorthwindDb.sql 

EXPOSE 1433

CMD ["/opt/mssql/bin/sqlservr"]
