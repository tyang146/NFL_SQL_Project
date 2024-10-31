create table Players(
	PlayerID int primary key identity(1,1),
	FirstName nvarchar(50),
	LastName nvarchar(50),
	Position nvarchar(50),
	Birthdate date,
	TeamID int,
	foreign key (TeamID) references Teams(TeamID)
	);