DECLARE @SatScore int = 1494;

SELECT *
	from Student
	Where SAT > @SatScore
	order by SAT desc;