CREATE TABLE [dbo].[Players] (
    [PlayerID]  INT           IDENTITY (1, 1) NOT NULL,
    [FirstName] NVARCHAR (50) NULL,
    [LastName]  NVARCHAR (50) NULL,
    [Position]  NVARCHAR (50) NULL,
    [Birthdate] DATE          NULL,
    [TeamID]    INT           NULL,
    PRIMARY KEY CLUSTERED ([PlayerID] ASC),
    FOREIGN KEY ([TeamID]) REFERENCES [dbo].[Teams] ([TeamID]),
    CONSTRAINT [UQ_Players] UNIQUE NONCLUSTERED ([FirstName] ASC, [LastName] ASC, [Birthdate] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_player_team]
    ON [dbo].[Players]([TeamID] ASC);

