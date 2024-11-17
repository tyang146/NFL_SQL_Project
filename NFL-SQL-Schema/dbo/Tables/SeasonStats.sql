CREATE TABLE [dbo].[SeasonStats] (
    [SeasonStatsId]            INT IDENTITY (1, 1) NOT NULL,
    [PlayerID]                 INT NULL,
    [Year]                     INT NULL,
    [TotalPassesCompleted]     INT DEFAULT ((0)) NULL,
    [TotalPassesAttempted]     INT DEFAULT ((0)) NULL,
    [TotalPassingYards]        INT DEFAULT ((0)) NULL,
    [TotalPassingTouchdowns]   INT DEFAULT ((0)) NULL,
    [TotalInterceptionsThrown] INT DEFAULT ((0)) NULL,
    [TotalRushingAttempts]     INT DEFAULT ((0)) NULL,
    [TotalRushingYards]        INT DEFAULT ((0)) NULL,
    [TotalRushingTouchdowns]   INT DEFAULT ((0)) NULL,
    [TotalPassTargets]         INT DEFAULT ((0)) NULL,
    [TotalReceptions]          INT DEFAULT ((0)) NULL,
    [TotalRecievingYards]      INT DEFAULT ((0)) NULL,
    [TotalRecievingTouchdowns] INT DEFAULT ((0)) NULL,
    [TotalFieldGoalsAttempted] INT DEFAULT ((0)) NULL,
    [TotalFieldGoalsMade]      INT DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([SeasonStatsId] ASC),
    FOREIGN KEY ([PlayerID]) REFERENCES [dbo].[Players] ([PlayerID])
);

