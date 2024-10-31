CREATE VIEW KickingStats AS
SELECT 
    PlayerID,
    GameID,
    FieldGoalsAttempted,
    FieldGoalsMade
FROM PlayerStats
WHERE (NOT(FieldGoalsAttempted IS NULL OR FieldGoalsAttempted = 0)) OR
      (NOT (FieldGoalsMade IS NULL OR FieldGoalsMade = 0));