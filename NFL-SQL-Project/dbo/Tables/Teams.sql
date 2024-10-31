CREATE TABLE [dbo].[Teams] (
    [TeamID]     INT           IDENTITY (1, 1) NOT NULL,
    [TeamName]   NVARCHAR (50) NULL,
    [Location]   NVARCHAR (50) NULL,
    [Conference] NVARCHAR (10) NULL,
    [Division]   NVARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([TeamID] ASC),
    CONSTRAINT [UQ_Teams] UNIQUE NONCLUSTERED ([TeamName] ASC, [Location] ASC, [Conference] ASC)
);

