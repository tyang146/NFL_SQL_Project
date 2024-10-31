CREATE PROCEDURE UpdateSeasonStats
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert new season stats or update existing ones based on data from PlayerStats
    MERGE INTO SeasonStats AS target
    USING (
        -- Aggregate data from PlayerStats by PlayerID and year derived from GameDate
        SELECT 
            ps.PlayerID,
            YEAR(g.GameDate) AS [Year],
            SUM(ps.PassesCompleted) AS TotalPassesCompleted,
            SUM(ps.PassesAttempted) AS TotalPassesAttempted,
            SUM(ps.PassingYards) AS TotalPassingYards,
            SUM(ps.PassingTouchdowns) AS TotalPassingTouchdowns,
            SUM(ps.InterceptionsThrown) AS TotalInterceptionsThrown,
            SUM(ps.RushingAttempts) AS TotalRushingAttempts,
            SUM(ps.RushingYards) AS TotalRushingYards,
            SUM(ps.RushingTouchdowns) AS TotalRushingTouchdowns,
            SUM(ps.PassTargets) AS TotalPassTargets,
            SUM(ps.Receptions) AS TotalReceptions,
            SUM(ps.RecievingYards) AS TotalRecievingYards,
            SUM(ps.RecievingTouchdowns) AS TotalRecievingTouchdowns,
            SUM(ps.FieldGoalsAttempted) AS TotalFieldGoalsAttempted,
            SUM(ps.FieldGoalsMade) AS TotalFieldGoalsMade
        FROM 
            PlayerStats ps
        JOIN 
            Games g ON ps.GameID = g.GameID
        GROUP BY 
            ps.PlayerID,
            YEAR(g.GameDate)
    ) AS source
    ON target.PlayerID = source.PlayerID AND target.[Year] = source.[Year]
    
    -- When matched, update the existing record
    WHEN MATCHED THEN
        UPDATE SET
            target.TotalPassesCompleted = source.TotalPassesCompleted,
            target.TotalPassesAttempted = source.TotalPassesAttempted,
            target.TotalPassingYards = source.TotalPassingYards,
            target.TotalPassingTouchdowns = source.TotalPassingTouchdowns,
            target.TotalInterceptionsThrown = source.TotalInterceptionsThrown,
            target.TotalRushingAttempts = source.TotalRushingAttempts,
            target.TotalRushingYards = source.TotalRushingYards,
            target.TotalRushingTouchdowns = source.TotalRushingTouchdowns,
            target.TotalPassTargets = source.TotalPassTargets,
            target.TotalReceptions = source.TotalReceptions,
            target.TotalRecievingYards = source.TotalRecievingYards,
            target.TotalRecievingTouchdowns = source.TotalRecievingTouchdowns,
            target.TotalFieldGoalsAttempted = source.TotalFieldGoalsAttempted,
            target.TotalFieldGoalsMade = source.TotalFieldGoalsMade

    -- When not matched, insert a new record
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (PlayerID, [Year], TotalPassesCompleted, TotalPassesAttempted, TotalPassingYards, TotalPassingTouchdowns, 
                TotalInterceptionsThrown, TotalRushingAttempts, TotalRushingYards, TotalRushingTouchdowns, 
                TotalPassTargets, TotalReceptions, TotalRecievingYards, TotalRecievingTouchdowns, 
                TotalFieldGoalsAttempted, TotalFieldGoalsMade)
        VALUES (source.PlayerID, source.[Year], source.TotalPassesCompleted, source.TotalPassesAttempted, source.TotalPassingYards, 
                source.TotalPassingTouchdowns, source.TotalInterceptionsThrown, source.TotalRushingAttempts, 
                source.TotalRushingYards, source.TotalRushingTouchdowns, source.TotalPassTargets, 
                source.TotalReceptions, source.TotalRecievingYards, source.TotalRecievingTouchdowns, 
                source.TotalFieldGoalsAttempted, source.TotalFieldGoalsMade);
END;