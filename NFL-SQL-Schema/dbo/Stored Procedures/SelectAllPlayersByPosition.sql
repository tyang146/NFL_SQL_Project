CREATE PROCEDURE [dbo].[SelectAllPlayersByPosition]
	@Position NVARCHAR(50) 
AS
BEGIN
    -- Get all players with the specified position
    SELECT *
    FROM Players
    WHERE Position = @Position;
END
GO