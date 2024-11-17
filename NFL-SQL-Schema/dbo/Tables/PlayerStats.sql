CREATE TABLE [dbo].[PlayerStats] (
    [PlayerStatsId]       INT IDENTITY (1, 1) NOT NULL,
    [PlayerID]            INT NULL,
    [GameID]              INT NULL,
    [PassesCompleted]     INT NULL,
    [PassesAttempted]     INT NULL,
    [PassingYards]        INT NULL,
    [PassingTouchdowns]   INT NULL,
    [InterceptionsThrown] INT NULL,
    [RushingAttempts]     INT NULL,
    [RushingYards]        INT NULL,
    [RushingTouchdowns]   INT NULL,
    [PassTargets]         INT NULL,
    [Receptions]          INT NULL,
    [RecievingYards]      INT NULL,
    [RecievingTouchdowns] INT NULL,
    [FieldGoalsAttempted] INT NULL,
    [FieldGoalsMade]      INT NULL,
    PRIMARY KEY CLUSTERED ([PlayerStatsId] ASC),
    FOREIGN KEY ([GameID]) REFERENCES [dbo].[Games] ([GameID]),
    FOREIGN KEY ([PlayerID]) REFERENCES [dbo].[Players] ([PlayerID]),
    CONSTRAINT [UQ_PlayerStats] UNIQUE NONCLUSTERED ([PlayerID] ASC, [GameID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_PassingYards]
    ON [dbo].[PlayerStats]([PassingYards] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_PlayerID_GameID]
    ON [dbo].[PlayerStats]([PlayerID] ASC, [GameID] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_RushingYards]
    ON [dbo].[PlayerStats]([RushingYards] ASC);

