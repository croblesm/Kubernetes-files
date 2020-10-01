-- Creating GeoKids login
-- ==============================================================================
USE master
GO

CREATE LOGIN flyway WITH PASSWORD=N'_D3v3L0pM3nt_',
    DEFAULT_DATABASE=geokids, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
GO
-- Granting server-level roles (security, linked servers database creation)
EXEC sp_addsrvrolemember 'flyway', 'securityadmin';
EXEC sp_addsrvrolemember 'flyway', 'setupadmin';
EXEC sp_addsrvrolemember 'flyway', 'dbcreator';
GO
-- Creating database user, granting db_owner permission
USE geokids
GO
CREATE USER flyway FOR LOGIN flyway;
EXEC sp_addrolemember 'db_owner', 'flyway';
GO
-- Creating Flyway login
-- ==============================================================================
USE master
GO
CREATE LOGIN geokids WITH PASSWORD=N'CmdL1n3-r0ck5',
    DEFAULT_DATABASE=geokids, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
GO

-- Creating database user, granting db_owner permission
USE geokids
GO
CREATE USER geokids FOR LOGIN geokids;
EXEC sp_addrolemember 'db_datawriter', 'geokids';
EXEC sp_addrolemember 'db_datareader', 'geokids';
GO
