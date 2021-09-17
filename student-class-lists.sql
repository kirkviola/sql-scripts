SELECT concat(s.firstname, ' ', s.lastname) as 'Name', Subject --Shows classes required for students by major
	from Student s
	join Major m
		on s.MajorId = m.id
	join MajorClass mc
		on m.Id = mc.MajorId
	join Class c
		on c.Id = mc.ClassId