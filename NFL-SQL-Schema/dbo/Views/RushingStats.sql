CREATE VIEW RushingStats AS
SELECT 
    PlayerID,
    GameID,
    RushingAttempts,
    RushingYards,
    RushingTouchdowns
FROM PlayerStats
WHERE  (NOT (RushingAttempts IS NULL OR RushingAttempts = 0)) OR
       (NOT (RushingYards IS NULL OR RushingYards = 0)) OR
       (NOT (RushingTouchdowns IS NULL OR RushingTouchdowns = 0));