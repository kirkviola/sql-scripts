SELECT * , 'A' 'ABC' -- Practice union
	from Student
	where SAT > 1200

UNION
SELECT * , 'B' 'ABC'
	from Student
	where SAT <= 1200 and SAT >= 1000

UNION
SELECT * , 'C' 'ABC'
	from Student
	where SAT <1000
	order by ABC;