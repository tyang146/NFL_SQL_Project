CREATE VIEW ReceivingStats AS
SELECT 
    PlayerID,
    GameID,
    PassTargets,
    Receptions,
    RecievingYards,
    RecievingTouchdowns
FROM PlayerStats
WHERE  (NOT (PassTargets IS NULL OR PassTargets = 0)) OR
       (NOT (Receptions IS NULL OR Receptions = 0)) OR
       (NOT (RecievingYards IS NULL OR RecievingYards = 0)) OR
       (NOT (RecievingTouchdowns IS NULL OR RecievingTouchdowns = 0));