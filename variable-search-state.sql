DECLARE @State varchar(2) = 'KY'; -- String datatype practice variable

SELECT *
	from Student
	where StateCode = @State
	order by Lastname;