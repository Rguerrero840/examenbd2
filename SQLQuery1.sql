create database Exa_2
USE Exa_2
DROP DATABASE Exa_2

CREATE TABLE tblUser(
Id_User TINYINT AUTO_INCREMENT NOT NULL,
Username  VARCHAR (100),
Email VARCHAR (100) NOT NULL,
Pass BLOB NOT NULL,

 PRIMARY KEY (Id_User)
)

ALTER TABLE tblUser 
ADD UNIQUE (Id_User);

select * from tblUser

INSERT INTO tblUser (Username, Email, Pass)
VALUES ("Dierdre", "dierdre840@gmail.com", aes_encrypt('Dierdre840#','key'));