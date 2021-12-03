DELETE From RequestLines;
DELETE From Products;
DELETE From Requests;
DELETE From Vendors;
DELETE From Users;
GO

INSERT Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
VALUES	('admin', 'admin', 'Supreme', 'Commander', '513-123-4567', 'theadmin@MAXcityschools.org', 0, 1),
		('PrincipalA', 'principal', 'Ivan', 'Idea', '513-347-1111', 'principala@MAXcityschools.org', 0, 0),
		('PrincipalB', 'principal', 'Justin', 'Time', '513-444-4444', 'principalb@MAXcityschools.org', 0, 0),
		('PrincipalC', 'principal', 'Billy', 'TheKid', '513-555-1234', 'principalc@MAXcityschools.org', 0, 0),
		('Treasurer', 'treasurer', 'Phil', 'LaCoffers', '513-555-5678', 'treasurer@MAXcityschools.org', 1, 0);
GO

INSERT Vendors (Code, Name, Address, City, State, Zip, Phone, Email)
VALUES ('STPL', 'Staples', '123 Staple Street', 'Cincinnati', 'OH', '45204', '513-732-2232', 'supplier@staples.com'),
	   ('BB', 'BestBuy', 'LaBest Lane', 'Dayton', 'KY', '41074', '859-432-1121', 'geeks@bestbuy.com'),
	   ('MC', 'Micro Center', '11755 Mosteller Road', 'Sharonville', 'OH', '45241', '513-782-8500', 'micro@microcenter.com'),
	   ('AF', 'Ashley Furniture', '5600 Deerfield Blvd', 'Mason', 'OH', '45040', '513-770-6200', 'ashley@ashleyfurniture.com'),
	   ('OFC', 'Office Furniture Source', '2929 E Kemper Rd', 'Cincinnati', 'OH', '45241', '513-531-0900', 'office@ofc.com'),
	   ('OM', 'Office Max', '4540 Eastgate Blvd', 'Cincinnati', 'OH', '45245', '513-752-2406', 'max@officemax.com');
GO

INSERT Products (PartNbr, Name, Price, Unit, VendorId)
VALUES ('SPNC', 'Staples Pencil', 0.99, 'Per Pack', (SELECT id From Vendors where code = 'STPL')),
	   ('SBPN', 'Staples Black Pen', 1.29, 'Per Pack', (SELECT Id From Vendors where code = 'STPL')),
	   ('SP', 'Staples Paper', 5.99, 'Per Ream', (SELECT Id From Vendors where code = 'STPL')),
	   ('OMPNC', 'Office Max Pencil', 0.89, 'Per Pack', (SELECT Id from Vendors where code = 'OM')),
	   ('OMBPN', 'Office Max Black Pen', 1.39, 'Per Pack', (SELECT Id from Vendors where code = 'OM')),
	   ('OMP', 'Office Max Paper', 8.99, 'Per Ream', (SELECT Id from Vendors where code = 'OM')),
	   ('BBComp', 'Best Buy Base Computer', 699.99, 'Each', (SELECT Id from Vendors where code = 'BB')),
	   ('BBSBoard', 'Best Buy SmartBoard', 2999.99, 'Each', (SElect Id from Vendors where code = 'BB')),
	   ('BBSound', 'Best Buy Sound System', 999.99, 'Each', (SELECT Id from Vendors where code = 'BB')),
	   ('MCBComp', 'Micro Center Base Computer', 689.99, 'Each', (SELECT Id from Vendors where code = 'MC')),
	   ('MCMComp', 'Micro Center Mega Super Computer', 9999.99, 'Each', (SELECT Id from Vendors where code = 'MC')),
	   ('AFDsk', 'Ashley Furniture Basic Desk', 149.99, 'Each', (SELECT Id from Vendors where code = 'AF')),
	   ('AFEDsk', 'Ashley Furniture Executive Desk', 399.99, 'Each', (SELECT Id from Vendors where code = 'AF')),
	   ('OMC', 'Office Max Basic Chair', 24.99, 'Each', (SELECT Id from Vendors where code = 'OM')),
	   ('OMFC', 'Office Max Fancy Chair', 49.99, 'Each', (SELECT Id from Vendors where code = 'OM'));
GO

INSERT Requests (Description, Justification, UserId)
VALUES ('Beginning of the year requisition', 'Old items need replacing', (SELECT Id from Users where Username = 'PrincipalA')),
	   ('Supplies for teachers', 'Small budget surplus at end of year', (SELECT Id from Users where Username = 'PrincipalB')),
	   ('New Computer request', 'Our basic ones are slow', (SELECT Id from Users where Username = 'PrincipalC'));
GO

INSERT RequestLines (RequestId, ProductId, Quantity)
VALUES ((SELECT Id from Requests where Description = 'Beginning of the year requisition'),
		(SELECT Id from Products where PartNbr = 'OMC'), 25),
		((SELECT Id from Requests where Description = 'Beginning of the year requisition'),
		(SELECT Id from Products where PartNbr = 'OMFC'), 2),
		((SELECT Id from Requests where Description = 'Beginning of the year requisition'),
		(SELECT Id from Products where PartNbr = 'AFEDsk'), 1),
		((SELECT Id from Requests where Description = 'Beginning of the year requisition'),
		(SELECT Id from Products where PartNbr = 'MCBComp'), 25),
		((SELECT Id from Requests where Description = 'New Computer Request'),
		(SELECT Id from Products where PartNbr = 'MCMComp'), 1),
		((SELECT Id from Requests where Description = 'Supplies for teachers'),
		(SELECT Id from Products where PartNbr = 'SBPN'), 20),
		((SELECT Id from Requests where Description = 'Supplies for teachers'),
		(SELECT Id from Products where PartNbr = 'OMP'), 2);