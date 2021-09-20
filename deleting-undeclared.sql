-- Delete students from Michigan
-- but only those with no major
SELECT *
	from Student 
	where StateCode = 'MI' AND MajorId is null