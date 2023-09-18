--CREATE TABLE TestTable (
--    tt_Id int PRIMARY KEY,
--    tt_user_name varchar(50)
--);
USE MASTER;

CREATE LOGIN TestUser WITH PASSWORD = '1234';

GO
    USE Performance;

CREATE USER TestUser FOR LOGIN TestUser;

GO
    GRANT
CONTROL
    ON TestTable TO TestUser;
