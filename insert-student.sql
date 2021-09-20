-- Adding a student to the class
/*
INSERT Student
	(Firstname, Lastname, StateCode, SAT, GPA, MajorId)
	VALUES
	('Yolo', 'Swaggins', 'CA', 1550, 2.10, (SELECT Id
												From Major
												Where Description = 'Education')) 
												-- Links MajorId through description
*/
SELECT *
	from Student