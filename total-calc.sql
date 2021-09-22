CREATE OR ALTER PROCEDURE CalculateRequestTotal
	@RequestId int = NULL
AS
BEGIN
	-- Check for missing RequestId
	IF @RequestId is NULL
	BEGIN
		PRINT 'RequestId is required';
		RETURN -1;
	END
	-- Check the RequestId exists
	IF NOT EXISTS (SELECT 1 from Requests Where Id = @RequestId)
	BEGIN
		PRINT 'Request not found';
		RETURN -2;
	END
	-- Calculate the total
	DECLARE @Total decimal(9,2);
	-- Stores total calculated by query into variable @Total
	SELECT @Total = sum(rl.quantity * p.price)
		from Requests r
		join Requestlines rl
			on rl.RequestId = r.id
		join Products p
			on p.Id = rl. ProductId
		Where r.Id = @RequestId;
	-- Now update the request
	UPDATE Requests Set
		Total = @Total
		Where Id = @RequestId;
	Print 'Updated!';
	RETURN 0;
END
GO
EXEC CalculateRequestTotal 1
GO

 