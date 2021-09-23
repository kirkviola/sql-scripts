CREATE OR ALTER PROCEDURE StudentGpaAdjustment
AS
BEGIN
	DECLARE @Firstname varchar(30);
	DECLARE @Lastname varchar(30);
	DECLARE @GpaDelta decimal(5,2);
	DECLARE cur CURSOR For 
		SELECT Firstname, Lastname, GpaDelta 
			from Adjustments Where Completed = 0;

	OPEN cur;
	
	FETCH Next from cur into @Firstname, @Lastname, @GpaDelta;
	-- Loops through Student table to adjust students
	WHILE @@FETCH_STATUS = 0 -- In this case, that means no problems
	BEGIN
		UPDATE Student SET
		GPA += @GpaDelta where @Firstname = Firstname
							and @Lastname = Lastname;
	/*
	SELECT Firstname, Lastname, GPA, @GpaDelta Delta, (GPA + @GpaDelta) 'New GPA'
		from Student
			where @Firstname = Firstname and @Lastname = Lastname
	*/
	-- Pushes to the next line in the table
	FETCH Next from cur into @Firstname, @Lastname, @GpaDelta;
	END
		

	CLOSE cur;
	DEALLOCATE cur;
	-- Changes completed status
	UPDATE Adjustments Set
		Completed = 1
		Where Completed = 0;
END
GO
EXEC StudentGpaAdjustment;