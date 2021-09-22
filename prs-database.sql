--This script is the database for the PRS
use master;
go
drop database if exists PRS;
go
CREATE DATABASE PRS;
go
use PRS;
go
-- TABLES
CREATE TABLE Users(
	Id int not null primary key identity (1,1),
	Username varchar(30) not null unique,
	Password varchar(30) not null,
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	Phone varchar(12) null,
	Email varchar(255) null,
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0
);
GO
CREATE TABLE Vendors(
	Id int not null primary key identity (1, 1),
	Code varchar(30) not null unique,
	Name varchar(30) not null,
	Address varchar(30) not null,
	City Varchar(30) not null,
	State varchar(2) not null,
	Zip varchar(5) not null,
	Phone varchar(12) null,
	Email varchar(255) null
);
GO
CREATE TABLE Products(
	Id int not null primary key identity (1,1),
	PartNbr varchar(30) not null unique,
	Name varchar(30) not null,
	Price decimal(9,2) not null default 0 check (Price >=0),
	Unit varchar(30) not null default 'Each',
	PhotoPath varchar(255) null,
	VendorId int not null foreign key references Vendors(Id)
);
GO
CREATE TABLE Requests(
	Id int not null primary key identity (1,1),
	Description varchar(80) not null,
	Justification varchar(80) not null,
	RejectionReason varchar(80) null,
	DeliveryMode varchar(20) not null,
	Status varchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0 check (Total >=0),
	UserId int not null foreign key references Users(id)
);
GO
CREATE TABLE Requestlines(
	Id int not null primary key identity(1,1),
	RequestId int not null foreign key references Requests(Id),
	ProductId int not null foreign key references Products(Id),
	Quantity int not null default 1
);
GO
-- Insert seed data here
INSERT into Users
(Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
VALUES
('Koolgai', 'hackerman', 'Kool', 'Kid', '741-1111', 'email@email.com', 0, 1),
('Sledgehammer', 'hackerman', 'Sledge', 'Beast', '741-1111', 'email@email.com', 0, 0),
('Catalyst', 'hackerman', 'Insta', 'Gator', '741-1111', 'email@email.com', 1, 0),
('Renegade', 'hackerman', 'Ben', 'Rebelling','741-1111','email@email.com', 0, 0),
('MasterControl','hackerman','Ivan','Database','741-1111','email@email.com',1,1);
GO
INSERT into Vendors
(Code, Name, Address, City, State, Zip,	Phone, Email)
VALUES
('FF', 'Fairfield', '1 Street st.', 'Fairfield', 'OH', '44444', '555-5555', 'email@email.com'),
('HAM', 'Hamilton', '1 Street st.', 'Hamilton', 'OH', '44444', '555-5555', 'email@email.com'),
('SYC', 'Sycamore', '1 Street st.', 'Blue Ash', 'OH', '44444', '555-5555', 'email@email.com'),
('BN', 'Boone County', '1 Street st.', 'Newport', 'KY', '44444', '555-5555', 'email@email.com'),
('VH', 'Vacaville', '1 Street st.', 'Vacaville', 'CA', '44444', '555-5555', 'email@email.com');
GO
INSERT into Products
(PartNbr, Name, Price, VendorId)
VALUES
('123', 'Science Book', 69.99, (SELECT Id from Vendors where Code = 'FF') ),
('234', 'Music Book', 199.99,  (SELECT Id from Vendors where Code = 'SYC' )),
('345', 'Violin', 2999.99,  (SELECT Id from Vendors where Code = 'FF') ),
('456', 'Strings', 199.99, (SELECT Id from Vendors where Code = 'HAM')),
('567', 'Music Stand', 149.99, (SELECT Id from Vendors where Code = 'BN'));
GO
INSERT into Requests
(Description, Justification, DeliveryMode, UserId)
VALUES
('Violin Purchase', 'We had none', 'Truck', (SELECT Id From Users where username = 'Sledgehammer')),
('Science Books', 'Need class set', 'Air mail', (SELECT Id From Users where username = 'Sledgehammer')),
('Strings Purchase', 'Need backup after strings broke','Replicator',  (SELECT Id From Users where username = 'MasterControl')),
	('Strings','Forgot we needed more', 'Replicator',  (SELECT Id From Users where username = 'Catalyst'));
GO

INSERT into Requestlines
(RequestId, ProductId, Quantity)
VALUES
((SELECT Id from Requests where Description like 'Violin%'),
	(SELECT Id from Products where partnbr = '345'), '100'),
((SELECT Id from Requests where Description like 'Science%'),
	(SELECT Id from Products where PartNbr = '123'), '50'),
((SELECT Id from Requests where Description like 'Strings P%'),
	(SELECT Id from Products where PartNbr ='456'), '4'),
((SELECT Id from Requests where Description = 'Strings'),
	(SELECT Id from Products where PartNbr = '456'), 1);