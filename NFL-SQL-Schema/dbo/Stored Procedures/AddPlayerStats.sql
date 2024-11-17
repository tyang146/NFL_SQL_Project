CREATE PROCEDURE AddPlayerStats
    @PlayerID INT,
    @GameID INT,
    @PassesCompleted INT,
    @PassesAttempted INT,
    @PassingYards INT,
    @PassingTouchdowns INT,
    @InterceptionsThrown INT,
    @RushingAttempts INT,
    @RushingYards INT,
    @RushingTouchdowns INT,
    @PassTargets INT,
    @Receptions INT,
    @RecievingYards INT,
    @RecievingTouchdowns INT,
    @FieldGoalsAttempted INT,
    @FieldGoalsMade INT
AS
BEGIN
    -- Check if PlayerID exists in the Players table
    IF NOT EXISTS (SELECT 1 FROM Players WHERE PlayerID = @PlayerID)
    BEGIN
        PRINT 'Error: PlayerID does not exist in the Players table.';
        RETURN;
    END

    -- Check if GameID exists in the Games table
    IF NOT EXISTS (SELECT 1 FROM Games WHERE GameID = @GameID)
    BEGIN
        PRINT 'Error: GameID does not exist in the Games table.';
        RETURN;
    END

    -- Check if the combination of GameID and PlayerID already exists in PlayerStats
    IF NOT EXISTS (SELECT 1 
                   FROM PlayerStats 
                   WHERE PlayerID = @PlayerID 
                   AND GameID = @GameID)
    BEGIN
        -- If the record does not exist, proceed with the insert
        INSERT INTO PlayerStats (PlayerID, GameID, PassesCompleted, PassesAttempted, PassingYards, PassingTouchdowns, InterceptionsThrown, RushingAttempts, RushingYards, RushingTouchdowns, PassTargets, Receptions, RecievingYards, RecievingTouchdowns, FieldGoalsAttempted, FieldGoalsMade)
        VALUES (@PlayerID, @GameID, @PassesCompleted, @PassesAttempted, @PassingYards, @PassingTouchdowns, @InterceptionsThrown, @RushingAttempts, @RushingYards, @RushingTouchdowns, @PassTargets, @Receptions, @RecievingYards, @RecievingTouchdowns, @FieldGoalsAttempted, @FieldGoalsMade);
    END
    ELSE
    BEGIN
        -- If the record exists, print a message or return an error
        PRINT 'Error: A record for this PlayerID and GameID combination already exists in PlayerStats.';
    END
END;