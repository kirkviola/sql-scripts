-- This Procedure adds a request line to a request
CREATE OR ALTER PROCEDURE AddRequestline
	@RequestId int = null,
	@PName varchar(30) = null,
	@Quantity int = null
AS
BEGIN
	-- Check if any data is null
	If @RequestId is null OR @PName is null OR @Quantity is null
	BEGIN
		PRINT 'All parameters must be entered.';
		RETURN -1;
	END
	-- Check for valid request ID
	IF NOT EXISTS(SELECT 1 From Requests Where Id = @RequestId)
	BEGIN
		PRINT 'Request not found.';
		RETURN -2;
	END
	-- Check for valid product name
	If NOT EXISTS(SELECT 1 From Products Where Name = @PName)
	BEGIN
		PRINT 'Product not found.';
		RETURN -3;
	END
	-- Check for valid Quantity
	If @Quantity < 1
	BEGIN
		PRINT 'Quantity must be greater than 0.';
		RETURN -4;
	END
	-- All parameters are checked
	DECLARE @ProductId int;
	SELECT @ProductId = Id From Products Where Name = @PName;
	-- Do the Insert
	INSERT Requestlines(RequestId, ProductId, Quantity)
		VALUES(@RequestId, @ProductId, @Quantity);
	PRINT 'Insert successful!'
	RETURN 0;
END
GO
EXEC AddRequestline @RequestId = 1, @PName = 'Music Bookz', @Quantity = 2
 