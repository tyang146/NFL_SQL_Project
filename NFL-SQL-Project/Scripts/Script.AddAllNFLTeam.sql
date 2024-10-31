/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
-- Insert the whole 32 NFL teams into the Teams table if they don't already exist
INSERT INTO Teams (TeamName, [Location], Conference, Division)
SELECT * FROM (VALUES 
    -- NFC East
    ('Dallas Cowboys', 'Dallas', 'NFC', 'East'),
    ('New York Giants', 'New York', 'NFC', 'East'),
    ('Philadelphia Eagles', 'Philadelphia', 'NFC', 'East'),
    ('Washington Commanders', 'Washington D.C.', 'NFC', 'East'),

    -- NFC North
    ('Chicago Bears', 'Chicago', 'NFC', 'North'),
    ('Detroit Lions', 'Detroit', 'NFC', 'North'),
    ('Green Bay Packers', 'Green Bay', 'NFC', 'North'),
    ('Minnesota Vikings', 'Minneapolis', 'NFC', 'North'),

    -- NFC South
    ('Atlanta Falcons', 'Atlanta', 'NFC', 'South'),
    ('Carolina Panthers', 'Charlotte', 'NFC', 'South'),
    ('New Orleans Saints', 'New Orleans', 'NFC', 'South'),
    ('Tampa Bay Buccaneers', 'Tampa', 'NFC', 'South'),

    -- NFC West
    ('Arizona Cardinals', 'Phoenix', 'NFC', 'West'),
    ('Los Angeles Rams', 'Los Angeles', 'NFC', 'West'),
    ('San Francisco 49ers', 'San Francisco', 'NFC', 'West'),
    ('Seattle Seahawks', 'Seattle', 'NFC', 'West'),

    -- AFC East
    ('Buffalo Bills', 'Buffalo', 'AFC', 'East'),
    ('Miami Dolphins', 'Miami', 'AFC', 'East'),
    ('New England Patriots', 'New England', 'AFC', 'East'),
    ('New York Jets', 'New York', 'AFC', 'East'),

    -- AFC North
    ('Baltimore Ravens', 'Baltimore', 'AFC', 'North'),
    ('Cincinnati Bengals', 'Cincinnati', 'AFC', 'North'),
    ('Cleveland Browns', 'Cleveland', 'AFC', 'North'),
    ('Pittsburgh Steelers', 'Pittsburgh', 'AFC', 'North'),

    -- AFC South
    ('Houston Texans', 'Houston', 'AFC', 'South'),
    ('Indianapolis Colts', 'Indianapolis', 'AFC', 'South'),
    ('Jacksonville Jaguars', 'Jacksonville', 'AFC', 'South'),
    ('Tennessee Titans', 'Nashville', 'AFC', 'South'),

    -- AFC West
    ('Denver Broncos', 'Denver', 'AFC', 'West'),
    ('Kansas City Chiefs', 'Kansas City', 'AFC', 'West'),
    ('Las Vegas Raiders', 'Las Vegas', 'AFC', 'West'),
    ('Los Angeles Chargers', 'Los Angeles', 'AFC', 'West')) AS TeamsToInsert(TeamName, Location, Conference, Division)
WHERE NOT EXISTS (
    SELECT 1 
    FROM Teams t 
    WHERE t.TeamName = TeamsToInsert.TeamName
);
