SELECT description, c.Code, Subject -- Shows required classes and codes for General Business only
	from Major m
	join MajorClass mc
		on m.id = mc.MajorId
	join class c
		on mc.ClassId = c.Id
	where m.Code = 'genb';