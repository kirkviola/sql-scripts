-- Transaction practice

BEGIN TRANSACTION; -- Starts transaction process

DELETE Student where id = 61; -- SQL Action

SELECT * From Student order by Id desc; -- Checking to see that it was deleted

ROLLBACK TRANSACTION; -- Ends transaction with no changes

COMMIT TRANSACTION; -- Ends transaction and commits changes