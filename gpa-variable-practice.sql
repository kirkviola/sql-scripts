DECLARE @UpperGPA decimal(5,1) = 3.5; --Using variables to navigate GPA data
DECLARE @LowerGPA decimal(5,1) = 2.5;

SELECT *
	from Student
	where GPA >= @UpperGPA or GPA <= @LowerGPA
	order by GPA desc;
