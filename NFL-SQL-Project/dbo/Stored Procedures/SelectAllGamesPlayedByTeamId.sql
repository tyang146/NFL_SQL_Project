CREATE PROCEDURE [dbo].[SelectAllGamesPlayedByTeamId]
	@HomeTeamID INT = NULL, 
    @AwayTeamID INT = NULL  
AS
BEGIN
    SELECT *
    FROM Games
    WHERE (@HomeTeamID IS NOT NULL AND HomeTeamID = @HomeTeamID)
       OR (@AwayTeamID IS NOT NULL AND AwayTeamID = @AwayTeamID);
END
GO
