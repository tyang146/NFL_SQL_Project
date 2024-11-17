CREATE VIEW PassingStats AS
SELECT 
    PlayerID,
    GameID,
    PassesCompleted,
    PassesAttempted,
    PassingYards,
    PassingTouchdowns,
    InterceptionsThrown
FROM PlayerStats
WHERE  (NOT (PassesCompleted IS NULL OR PassesCompleted = 0)) OR
       (NOT (PassesAttempted IS NULL OR PassesAttempted = 0)) OR
       (NOT (PassingYards IS NULL OR PassingYards = 0)) OR
       (NOT (InterceptionsThrown IS NULL OR InterceptionsThrown = 0));