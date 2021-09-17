SELECT city, sum(sales), count(*) --Lesson on group by and having
	from Customers
	where sales > 20000 --Elimiates individual sales before grouping
	group by city -- picks city column to group the data
	having sum(sales) > 600000; --examines each of the groups for condition