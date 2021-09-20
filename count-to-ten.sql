-- Practice creating a procedure that counts
-- numbers and returns a message
CREATE OR ALTER PROCEDURE CountToTen 
AS
BEGIN
	DECLARE @Index int = 1;
	DECLARE @Stop int = 10;

	WHILE @Index <= @Stop
	BEGIN
		PRINT '@Index is ' + CAST(@Index as varchar(5));
		IF @Index = 5 
		BEGIN
			PRINT 'WOW @Index is 5';
		END
		ELSE
			BEGIN
			PRINT 'THIS NUMBER SUX'
			END
		SET @Index += 1;
	END
END;
GO
EXEC CountToTen;
