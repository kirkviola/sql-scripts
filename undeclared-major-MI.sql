-- Display students who are undeclared from Michigan
SELECT Lastname, isnull(m.Description, 'Undeclared') as Major --Brings in last names, replaces null descriptions with string and named column
	from Student s 
	left join Major m --Brings in majors, including null
		on m.Id = s.MajorId
	where StateCode = 'MI' and MajorId is null --Checks both state code and null status of major id