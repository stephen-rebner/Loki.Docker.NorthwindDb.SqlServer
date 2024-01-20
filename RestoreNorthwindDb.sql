RESTORE DATABASE [Northwind] 
FROM DISK = N'/usr/src/NorthWindDb/Northwind-2023923-14-24-58.bak' 
WITH FILE = 1, 
MOVE 'Northwind' TO '/var/opt/mssql/data/Northwind.mdf', --ensure new path is created for the mdf file so that the path are created on restore
MOVE 'Northwind_log' TO '/var/opt/mssql/data/Northwind_log.ldf',  --ensure new path is created for the mdf file so that the path are created on restore
NOUNLOAD, REPLACE, STATS = 5
