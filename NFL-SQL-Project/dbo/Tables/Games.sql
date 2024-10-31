create table Games(
	GameID int primary key identity(1,1),
	GameDate date,
	HomeTeamID int,
	AwayTeamID int,
	Stadium nvarchar(50),
	foreign key (HomeTeamID) references Teams(TeamID),
	foreign key (AwayTeamID) references Teams(TeamID)
	);