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
INSERT INTO Teams (TeamAbbreviations, TeamName, [Location], Conference, Division)
SELECT * FROM (VALUES 
    -- NFC East
    ('DAL', 'Dallas Cowboys', 'Dallas', 'NFC', 'East'),
    ('NYG', 'New York Giants', 'New York', 'NFC', 'East'),
    ('PHI', 'Philadelphia Eagles', 'Philadelphia', 'NFC', 'East'),
    ('WAS', 'Washington Commanders', 'Washington D.C.', 'NFC', 'East'),

    -- NFC North
    ('CHI', 'Chicago Bears', 'Chicago', 'NFC', 'North'),
    ('DET', 'Detroit Lions', 'Detroit', 'NFC', 'North'),
    ('GNB',  'Green Bay Packers', 'Green Bay', 'NFC', 'North'),
    ('MIN', 'Minnesota Vikings', 'Minneapolis', 'NFC', 'North'),

    -- NFC South
    ('ATL', 'Atlanta Falcons', 'Atlanta', 'NFC', 'South'),
    ('CAR', 'Carolina Panthers', 'Charlotte', 'NFC', 'South'),
    ('NOR',  'New Orleans Saints', 'New Orleans', 'NFC', 'South'),
    ('TAM',  'Tampa Bay Buccaneers', 'Tampa', 'NFC', 'South'),

    -- NFC West
    ('ARI', 'Arizona Cardinals', 'Phoenix', 'NFC', 'West'),
    ('LAR', 'Los Angeles Rams', 'Los Angeles', 'NFC', 'West'),
    ('SFO',  'San Francisco 49ers', 'San Francisco', 'NFC', 'West'),
    ('SEA', 'Seattle Seahawks', 'Seattle', 'NFC', 'West'),

    -- AFC East
    ('BUF', 'Buffalo Bills', 'Buffalo', 'AFC', 'East'),
    ('MIA', 'Miami Dolphins', 'Miami', 'AFC', 'East'),
    ('NE',  'New England Patriots', 'New England', 'AFC', 'East'),
    ('NYJ', 'New York Jets', 'New York', 'AFC', 'East'),

    -- AFC North
    ('BAL', 'Baltimore Ravens', 'Baltimore', 'AFC', 'North'),
    ('CIN', 'Cincinnati Bengals', 'Cincinnati', 'AFC', 'North'),
    ('CLE', 'Cleveland Browns', 'Cleveland', 'AFC', 'North'),
    ('PIT', 'Pittsburgh Steelers', 'Pittsburgh', 'AFC', 'North'),

    -- AFC South
    ('HOU', 'Houston Texans', 'Houston', 'AFC', 'South'),
    ('IND', 'Indianapolis Colts', 'Indianapolis', 'AFC', 'South'),
    ('JAX', 'Jacksonville Jaguars', 'Jacksonville', 'AFC', 'South'),
    ('TEN', 'Tennessee Titans', 'Nashville', 'AFC', 'South'),

    -- AFC West
    ('DEN', 'Denver Broncos', 'Denver', 'AFC', 'West'),
    ('KAN',  'Kansas City Chiefs', 'Kansas City', 'AFC', 'West'),
    ('LVR',  'Las Vegas Raiders', 'Las Vegas', 'AFC', 'West'),
    ('LAC', 'Los Angeles Chargers', 'Los Angeles', 'AFC', 'West')) AS TeamsToInsert(TeamAbbreviations, TeamName, Location, Conference, Division)
WHERE NOT EXISTS (
    SELECT 1 
    FROM Teams t 
    WHERE t.TeamName = TeamsToInsert.TeamName
);
