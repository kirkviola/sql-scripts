SELECT concat(lastname, ', ', firstname) as 'Name', isnull(description, 'Undecided') as 'Major' -- Shows all majors and replaces NULL with text
	from Student s
	left join Major m
		on m.Id = S.MajorId
	order by lastname;