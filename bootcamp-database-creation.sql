CREATE TABLE Students (
	Id int not null PRIMARY KEY IDENTITY(1,1),
	Name varchar(50) not null ,
	Favnumber int not null,
	Favcolor varchar(20) null default 'Grey',
	Milk bit null default 0
);
go
INSERT into Students 
	(Name, Favnumber, Favcolor, Milk)
	VALUES
	('Matt', 144, 'Green', 1),
	('Parth', 84, 'Blue', 1),
	('Caroline', 25, null, 0);

CREATE TABLE Topics (
	Id int not null PRIMARY KEY IDENTITY(1,1),
	Description varchar(30) not null ,
	Sequence int not null unique,
	TooEasy bit not null default 1
);
GO
INSERT into Topics 
	(Description, Sequence, TooEasy)
	VALUES
	('Git/GitHub', 1, 1),
	('SQL Server', 2, 1),
	('C#', 3, 1),
	('EntityFrameworkCore', 4, 0),
	('Java', 5, 1),
	('Spring', 6, 1),
	('HTML', 7, 0),
	('CSS', 8, 1),
	('JavaScript', 9, 1),
	('Bootstrap', 10, 1),
	('jQuery', 11, 0),
	('Typescript', 12, 0),
	('Angular', 13, 1);
Select *
	from Topics