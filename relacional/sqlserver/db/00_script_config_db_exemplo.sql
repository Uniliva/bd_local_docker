CREATE DATABASE exemplo;
GO

USE exemplo;
GO

CREATE LOGIN usr_uni WITH PASSWORD = 'unisenha';
CREATE USER usr_uni FROM LOGIN usr_uni;
EXEC SP_ADDROLEMEMBER 'db_datareader', usr_uni;
EXEC SP_ADDROLEMEMBER 'db_datawriter', usr_uni;
EXEC SP_ADDROLEMEMBER 'db_ddladmin', usr_uni;
