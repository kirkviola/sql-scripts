-- This first process switches to master,
-- Removes this Db if exists, and then replaces
-- it with a fresh copy of all the script below
use master;
go
drop database if exists BcDb;
go
CREATE DATABASE BcDb;
go
use BcDb;
go
-- Create the table here
CREATE TABLE Customers (
	Id int not null PRIMARY KEY identity (1,1),
	Code varchar(10) not null unique,
	Name varchar(30) not null,
	Sales decimal(9,2) not null check (Sales >=0)  default 0,
	Active bit not null default 1,
	Created datetime not null default getdate()
);
go
-- Do your inserts here
INSERT into Customers
	(Code, Name, Sales)
	VALUES
	('DK', 'Doctor Krumz', 11.01),
	('SS', 'Silly String', 1.02),
	('CO', 'Captain Obvious', 12334.54),
	('LC', 'Lord Catastrophe', 500.52),
	('DS', 'Duke Saladface', 236.89);

go
-- Addes column to the table
ALTER TABLE Customers
	Add Updated DateTime;

ALTER TABLE Customers
	Alter Column Note varchar(30) not null;

UPDATE Customers Set
	Note = 'Default Note'

SELECT *
	FROM Customers