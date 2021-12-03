INSERT Users
	(Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
	VALUES
	('MattK', 'goodpassword', 'Matt', 'Kirkendall', '555-5555', 'email@gmail.com', 1, 1),
	('Johnsmith', 'password', 'John', 'Smith', '111-1111', 'email@ymail.com', 0, 0),
	('captainCrunch', 'tasty', 'Reginald', 'Crunch', '222-2222', 'cereal@yummy.com', 0, 0);
GO
INSERT Vendors
	(Code, Name, Address, City, State, Zip, Phone, Email)
	VALUES
	('BVS', 'Baroque Violin Shop', '1038 W North Bend Rd', 'Cincinnati', 'OH', '45224', '541-2000', 'email@bvs.com'),
	('AV', 'Antonio Violins', '214 W Main St', 'Mason', 'OH', '45040', '234-0555', 'email@antonio.com'),
	('MM', 'Mehas Music', '245 High St', 'Hamilton', 'OH', '45011', '867-1811', 'email@mehas.com');
GO
INSERT Products
	(PartNbr, Name, Price, Unit, VendorId)
	VALUES
	('BVLN', 'BVS Violin', 200.00, 'each', (SELECT ID from Vendors where code = 'BVS')),
	('BVLA', 'BVS Viola', 250.00, 'each', (SELECT ID from Vendors where code = 'BVS')),
	('AVLN', 'AV Violin', 205.00, 'each', (SELECT ID from Vendors where code = 'AV')),
	('AVLA', 'AV Viola', 245.00, 'each', (SELECT ID from Vendors where code = 'AV')),
	('MVLN', 'Mehas Violin', 190.00, 'each', (SELECT ID from Vendors where code = 'MM')),
	('MVLA', 'Mehas Viola', 220.00, 'each', (SELECT ID from Vendors where code = 'MM'));
GO
INSERT Requests
	(Description, Justification, UserId)
	VALUES
	('Matt first request', 'In need of instruments', (SELECT ID from Users where Username = 'MattK')),
	('Captain wants violins', 'Not enough crunch to go around', (SELECT ID from Users where Username = 'captainCrunch'));
GO
INSERT RequestLines
	(RequestId, ProductId, Quantity)
	VALUES
	(1, (SELECT ID from Products where PartNbr = 'BVLN'), 2),
	(1, (SELECT ID from Products where PartNbr = 'BVLA'), 3),
	(2, (SELECT ID from Products where PartNbr = 'AVLA'), 1),
	(2, (SELECT ID from Products where PartNbr = 'MVLN'), 2),
	(2, (SELECT ID from Products where PartNbr = 'MVLA'), 2);
GO


DELETE RequestLines