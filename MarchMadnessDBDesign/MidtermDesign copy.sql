CREATE TABLE GameResults
(
    GameResultID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
    ScheduleID INT NOT NULL,
    HomeTeamID INT NOT NULL,
    AwayTeamID INT NOT NULL,
    HomeTeamWon BIT NOT NULL,
    HomeTeamScore INT NOT NULL,
    AwayTeamScore INT NOT NULL,
    HomeTeamName VARCHAR(60) NOT NULL,
    AwayTeamName VARCHAR(60) NOT NULL,
    HomeTeamSeed INT NOT NULL,
    AwayTeamSeed INT NOT NULL
);
SET IDENTITY_INSERT GameResults ON
INSERT INTO 
GameResults
    (GameResultID, ScheduleID, HomeTeamID, AwayTeamID, HomeTeamWon,
    HomeTeamScore, AwayTeamScore, HomeTeamName, AwayTeamName, HomeTeamSeed, AwayTeamSeed)
VALUES
    (1, 1, 1, 2, 1, 102, 83, 'Xavier University', 'Texas Southern University', 1, 16),
    (2, 2, 3, 4, 0, 54, 67, 'Missouri University', 'Florida State Univeristy', 8, 9),
    (3, 3, 5, 6, 1, 81, 73, 'Ohio State University', 'South Dakota State University', 5, 12),
    (4, 4, 7, 8, 1, 68, 64, 'Gonzaga University', 'The University of North Carolina at Greensboro', 4, 13),
    (5, 5, 9, 10, 1, 67, 65, 'University of Houston', 'San Diego State University', 6, 11),
    (6, 6, 11, 12, 1, 61, 47, 'University of Michigan', 'University of Montana', 3, 14),
    (7, 7, 13, 14, 1, 73, 69, 'Texas A&M University', 'Providence College', 7, 10),
    (8, 8, 15, 16, 1, 84, 66, 'University of North Carolina', 'Lipscomb University', 2, 15),
    (9, 9, 1, 4, 0, 70, 75, 'Xavier University', 'Florida State Univeristy', 1, 9),
    (10, 10, 5, 7, 0, 84, 90, 'Ohio State University', 'Gonzaga University', 5, 4),
    (11, 11, 9, 11, 0, 63, 64, 'University of Houston', 'University of Michigan', 6, 3),
    (12, 12, 13, 15, 1, 86, 65, 'Texas A&M University', 'University of North Carolina', 7, 2),
    (13, 13, 4, 7, 1, 75, 60, 'Florida State Univeristy', 'Gonzaga University', 9, 4),
    (14, 14, 11, 13, 1, 99, 72, 'University of Michigan', 'Texas A&M University', 3, 7),
    (15, 15, 4, 11, 0, 54, 58, 'Florida State Univeristy', 'University of Michigan', 9, 3)
SET IDENTITY_INSERT GameResults OFF


CREATE TABLE Regions
(
    RegionID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    RegionName VARCHAR (15) NOT NULL
);
SET IDENTITY_INSERT Regions ON
INSERT INTO 
Regions
    (RegionID, RegionName)
VALUES
    (1, 'West'),
    (2, 'East'),
    (3, 'North'),
    (4, 'South')
SET IDENTITY_INSERT Regions OFF


CREATE TABLE Teams
(
    TeamID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    SchoolName VARCHAR(60) NOT NULL,
    RegionID INT NOT NULL,
    SeedNum INT NOT NULL,
    GameName VARCHAR(50) NOT NULL,
    HomeTown VARCHAR(50) NOT NULL
);
SET IDENTITY_INSERT Teams ON
INSERT INTO Teams
    (TeamID, SchoolName, RegionID, SeedNum, GameName, HomeTown)
VALUES
    (1, 'Xavier University', 1, 1, 'Xavier Musketeers', 'Cincinnati, Ohio'),
    (2, 'Texas Southern University', 1, 16, 'Texas Southern Tigers', 'Houston, Texas'),
    (3, 'Missouri University', 1, 8, 'Missouri Tigers', 'Columbia, Missouri'),
    (4, 'Florida State Univeristy', 1, 9, 'Florida State Seminoles', 'Tallahassee, Florida'),
    (5, 'Ohio State University', 1, 5, 'Ohio State Buckeyes', 'Columbus, Ohio'),
    (6, 'South Dakota State University', 1, 12, 'South Dakota State Jackrabbits', 'Brookings, South Dakota'),
    (7, 'Gonzaga University', 1, 4, 'Gonzaga Bulldogs', 'Spokane, Washington'),
    (8, 'The University of North Carolina at Greensboro', 1, 13, 'UNC Greensboro Spartans', 'Greensboro, North Carolina'),
    (9, 'University of Houston', 1, 6, 'Houston Cougars', 'Houston, Texas'),
    (10, 'San Diego State University', 1, 11, 'San Diego State Aztecs', 'San Diego, California'),
    (11, 'University of Michigan', 1, 3, 'Michigan Wolverines', 'Ann Arbor, Michigan'),
    (12, 'University of Montana', 1, 14, 'Montana Grizzlies', 'Missoula, Montana'),
    (13, 'Texas A&M University', 1, 7, 'Texas A&M Aggies', 'College Station, Texas'),
    (14, 'Providence College', 1, 10, 'Providence Friars', 'Providence, Rhode Island'),
    (15, 'University of North Carolina', 1, 2, 'North Carolina Tar Heels', 'Chapel Hill, North Carolina'),
    (16, 'Lipscomb University', 1, 15, 'Lipscomb Bisons', 'Nashville, Tennessee')
SET IDENTITY_INSERT Teams OFF


--FK for GameResults-Teams
ALTER TABLE GameResults ADD CONSTRAINT fk_GameResults1 FOREIGN KEY(HomeTeamID) 
	REFERENCES Teams(TeamID);

--FK for GameResults-Schedules
ALTER TABLE GameResults ADD CONSTRAINT fk_GameResults4 FOREIGN KEY(AwayTeamID) 
	REFERENCES Teams(TeamID);
--FK for Teams-Regions
ALTER TABLE Teams ADD CONSTRAINT fk_Teams FOREIGN KEY(RegionID) 
	REFERENCES Regions(RegionID);

CREATE TABLE Locations
(
    LocationID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    LocationName VARCHAR (30) NOT NULL
);
SET IDENTITY_INSERT Locations ON
INSERT INTO 
Locations
    (LocationID, LocationName)
VALUES
    (1, 'Nashville, TN'),
    (2, 'Boise, ID'),
    (3, 'Wichita, KS'),
    (4, 'Charlotte, NC'),
    (5, 'Los Angeles, CA')
SET IDENTITY_INSERT Locations OFF


CREATE TABLE Schedules
(
    ScheduleID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    DateAndTime SMALLDATETIME NOT NULL,
    LocationID INT NOT NULL,
    RoundName VARCHAR (30) NOT NULL
);
SET IDENTITY_INSERT Schedules ON
INSERT INTO 
Schedules
    (ScheduleID, DateAndTime, LocationID, RoundName)
VALUES
    (1, '2018-03-03 13:00:00 PM', 1, '1st Round'),
    (2, '2018-03-03 15:00:00 PM', 1, '1st Round'),
    (3, '2018-03-04 12:45:00 PM', 2, '1st Round'),
    (4, '2018-03-04 14:45:00 PM', 2, '1st Round'),
    (5, '2018-03-05 15:00:00 PM', 3, '1st Round'),
    (6, '2018-03-05 17:00:00 PM', 3, '1st Round'),
    (7, '2018-03-06 13:30:00 PM', 4, '1st Round'),
    (8, '2018-03-06 15:30:00 PM', 4, '1st Round'),
    (9, '2018-03-07 12:30:00 PM', 1, '2nd Round'),
    (10, '2018-03-07 13:00:00 PM', 2, '2nd Round'),
    (11, '2018-03-08 13:00:00 PM', 3, '2nd Round'),
    (12, '2018-03-08 14:00:00 PM', 4, '2nd Round'),
    (13, '2018-03-10 15:15:00 PM', 5, 'Sweet 16'),
    (14, '2018-03-10 17:15:00 PM', 5, 'Sweet 16'),
    (15, '2018-03-12 18:00:00 PM', 5, 'Elite Eight')
SET IDENTITY_INSERT Schedules OFF
--FK for GameResults-Teams
ALTER TABLE GameResults ADD CONSTRAINT fk_GameResults FOREIGN KEY(ScheduleID) 
	REFERENCES Schedules(ScheduleID);

--FK for Schedules-Locations
ALTER TABLE Schedules ADD CONSTRAINT fk_Schedules FOREIGN KEY(LocationID) 
	REFERENCES Locations(LocationID);

-- add unique to SchoolName in Teams table
ALTER TABLE Teams ADD UNIQUE(SchoolName)

-- add unique to SeedNum in Teams table
ALTER TABLE Teams ADD UNIQUE(SeedNum)

--FK for HomeTeamName-Teams
ALTER TABLE GameResults ADD CONSTRAINT fk_GameResults2 FOREIGN KEY(HomeTeamName) 
	REFERENCES Teams(SchoolName);

--FK for AwayTeanName-Teams
ALTER TABLE GameResults ADD CONSTRAINT fk_GameResults3 FOREIGN KEY(AwayTeamName) 
	REFERENCES Teams(SchoolName);

--FK for HomeTeamSeed-Teams
ALTER TABLE GameResults ADD CONSTRAINT fk_GameResults10 FOREIGN KEY(HomeTeamSeed) 
	REFERENCES Teams(SeedNum);

--FK for AwayTeanSeed-Teams
ALTER TABLE GameResults ADD CONSTRAINT fk_GameResults11 FOREIGN KEY(AwayTeamSeed) 
	REFERENCES Teams(SeedNum);


-- DROP TABLE Regions;
-- DROP TABLE Teams;
-- DROP TABLE Schedules;
-- DROP TABLE Locations;
-- DROP TABLE GameResults;

/* 
Querry of all games, including game number with correspondin schedule, 
the seed, name, and score of both teams, and a home team win indicator 
to tell us which team won or lost
*/
SELECT
    GR.GameResultID,
    GR.ScheduleID,
    gr.HomeTeamSeed,
    gr.AwayTeamSeed,
    GR.HomeTeamName,
    GR.AwayTeamName,
    GR.HomeTeamScore,
    GR.AwayTeamScore,
    GR.HomeTeamWon
FROM
    GameResults GR
    INNER JOIN
    Teams T
    ON T.TeamID = GR.HomeTeamID