BACKUP DATABASE Performance TO DISK = 'D:\Skole\H1\SQL\Performance.bak';

DROP DATABASE Performance;

USE MASTER;

RESTORE DATABASE Performance
FROM
    DISK = 'D:\Skole\H1\SQL\Performance.bak';

GO
    USE Performance;