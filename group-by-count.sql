SELECT c.name, count(*) as Orders --Lists customers and number of orders
	from Customers c
	join orders o
		on o.CustomerId = c.Id
	group by c.id, c.Name --c.id or c.Name are the only acceptable select columns
	having count(*) > 1 --Having looks back through each of the groups