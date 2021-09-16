SELECT *
	from Student s
	left join Major m
		on s.MajorId = m.Id
	where s.MajorId is NULL;