-- Script that runs the Fibonacci sequence up to
-- The limit specified by the user and returns
-- The sum of the even numbers in the sequence
CREATE OR ALTER PROCEDURE EvenFibonacci
@MaxNumber int
AS
BEGIN
	DECLARE @InitNumber int = 0
	DECLARE @NewNumber int = 1
	DECLARE @NewestNumber int = 0
	DECLARE @SumNumber int = 0
	WHILE @InitNumber <= @MaxNumber
		BEGIN
		IF (@NewestNumber % 2) = 0
			BEGIN
			SET @SumNumber += @NewestNumber
			END
		SET @NewestNumber = @InitNumber + @NewNumber
		SET @InitNumber = @NewNumber
		SET @NewNumber = @NewestNumber

		PRINT Cast(@InitNumber as varchar(10))
		END

	Print 'The sum is ' + CAST(@SumNumber as varchar(10));
END
GO
EXEC EvenFibonacci 875634240