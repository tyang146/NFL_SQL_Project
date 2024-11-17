CREATE PROCEDURE [dbo].[GetAllGameDetails]
AS
BEGIN
    -- Get game details along with team names
    SELECT 
        g.GameID, 
        g.GameDate, 
        ht.TeamName AS HomeTeam, 
        at.TeamName AS AwayTeam
    FROM 
        Games g
    JOIN 
        Teams ht ON g.HomeTeamID = ht.TeamID
    JOIN 
        Teams at ON g.AwayTeamID = at.TeamID;
END
GO