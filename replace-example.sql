DECLARE @name varchar(30) = 'O''Brien';

Select REPLACE('''','''''', @name); -- REPLACE statement (to find, to replace, what to examine)