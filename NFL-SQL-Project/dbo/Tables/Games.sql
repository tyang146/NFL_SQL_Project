CREATE TABLE [dbo].[Games] (
    [GameID]     INT           IDENTITY (1, 1) NOT NULL,
    [GameDate]   DATE          NULL,
    [HomeTeamID] INT           NULL,
    [AwayTeamID] INT           NULL,
    [Stadium]    NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([GameID] ASC),
    FOREIGN KEY ([AwayTeamID]) REFERENCES [dbo].[Teams] ([TeamID]),
    FOREIGN KEY ([HomeTeamID]) REFERENCES [dbo].[Teams] ([TeamID]),
    CONSTRAINT [UQ_Games] UNIQUE NONCLUSTERED ([GameDate] ASC, [HomeTeamID] ASC, [AwayTeamID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_game_team]
    ON [dbo].[Games]([HomeTeamID] ASC, [AwayTeamID] ASC);

