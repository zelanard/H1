USE master;

DROP DATABASE db_name;

CREATE DATABASE db_name;

GO
    --go to the database
    USE db_name;

--create each table in the database
CREATE TABLE t_name(
    t_atb_key int PRIMARY KEY,
    t_atb_f_key int FOREIGN KEY REFERENCES f_table(f_key);
    t_atb varchar(50)
);

INSERT INTO
    t_name()
VALUES
    (),

