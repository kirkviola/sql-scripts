SELECT * -- Presenting sales below average in descending order
	from Customers c
	where c.Sales < (SELECT avg(sales) from Customers) -- c.Sales did not work due to being an 'outside reference' (alias from first select statement)
	order by c.Sales desc;