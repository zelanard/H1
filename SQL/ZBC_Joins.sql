USE master;

DROP DATABASE ZBC;

CREATE DATABASE ZBC;

GO
    --go to the database
    USE ZBC;

--create each table in the database
CREATE TABLE Studenrede(
    stu_id int PRIMARY KEY,
    stu_name varchar(50)
);

CREATE TABLE Kurser(
    kur_id int PRIMARY KEY,
    stu_id int FOREIGN KEY REFERENCES Studenrede(stu_id),
    kur_kursus_name varchar(50)
);

INSERT INTO
    Studenrede(stu_id, stu_name)
VALUES
    (1, 'Anders'),
    (2, 'Birgitte'),
    (3, 'Carl');

INSERT INTO
    Kurser(kur_id, stu_id, kur_kursus_name)
VALUES
    (101, 1, 'Mattematik'),
    (102, 1, 'Dansk'),
    (103, 3, 'Historie');

-- INNER JOIN
SELECT
    Studenrede.stu_name AS 'Studentens Navn',
    Kurser.kur_kursus_name AS 'Kursets Navn'
FROM
    Studenrede
    INNER JOIN Kurser ON Studenrede.stu_id = Kurser.stu_id;

-- LEFT JOIN
SELECT
    Studenrede.stu_name AS 'Studentens Navn',
    Kurser.kur_kursus_name AS 'Kursets Navn'
FROM
    Studenrede
    lEFT JOIN Kurser ON Studenrede.stu_id = Kurser.stu_id;

-- RIGHT JOIN
SELECT
    Studenrede.stu_name AS 'Studentens Navn',
    Kurser.kur_kursus_name AS 'Kursets Navn'
FROM
    Studenrede
    RIGHT JOIN Kurser ON Studenrede.stu_id = Kurser.stu_id;

-- RIGHT JOIN
SELECT
    Studenrede.stu_name AS 'Studentens Navn',
    Kurser.kur_kursus_name AS 'Kursets Navn'
FROM
    Studenrede
    RIGHT JOIN Kurser ON Studenrede.stu_id = Kurser.stu_id;
