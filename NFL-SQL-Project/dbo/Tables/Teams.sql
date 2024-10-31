create table Teams(
	TeamID int primary key identity(1,1),
	TeamName nvarchar(50),
	[Location] nvarchar(50),
	Conference nvarchar(10),
	Division nvarchar(10),
	);