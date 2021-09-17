SELECT concat(Firstname, ' ', Lastname) 'Name', SAT --Practice showing how to use a subquery 2 times
	from Student
	where SAT > (SELECT avg(SAT) from student)

SELECT concat(Firstname, ' ', Lastname) 'Name', GPA
	from Student
	where GPA < (Select avg(GPA) from Student)
	order by GPA desc;