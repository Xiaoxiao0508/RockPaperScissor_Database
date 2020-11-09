-- Relational schema
-- - Player(UserName)
--     Primary Key(UserName
-- )
-- Choice(ChoiceName)
-- Primary Key (ChoiceName)

-- Game(GameID,GameStarted,GameResult,NumOfTurn)
-- PRIMARY KEY(GameID)
-- FOREIGN key(UserName) REFERENCES Player

-- Turn(TurnNumber,TurnResult)
-- Primary Key (TurnNumber,GameID)
-- Foreign Key (GameID)REFERENCES Game
-- Foreign Key (ChoiceName)REFERENCES Choice
USE test;
IF OBJECT_ID('Turn') IS NOT NULL 
  DROP TABLE Turn;
  IF OBJECT_ID('Game') IS NOT NULL 
  DROP TABLE Game;
IF OBJECT_ID('Player') IS NOT NULL 
  DROP TABLE Player;
IF OBJECT_ID('Choice') IS NOT NULL 
  DROP TABLE Choice;


  
GO

CREATE TABLE Player
(
  UserName NVARCHAR(100),
  Primary KEY (UserName)
)
CREATE TABLE Choice
(
  ChoiceName NVARCHAR(10),
  CHECK (ChoiceName In ('PAPER','SCISSOR','ROCK')),
  Primary Key (ChoiceName)
)
CREATE TABLE Game
(
  GameID INT,
  UserName NVARCHAR(100),
  GameStarted Date,
  GameResult NVARCHAR(1),
  NumOfTurn INT,
  CHECK (LEN(GameID)=6),
  CHECK (GameResult In ('W','L','D')),
  CHECK (NumOfTurn In (1,3,5)),
  Primary Key(GameID),
  Foreign KEY(UserName) REFERENCES Player,
)

CREATE TABLE Turn
(
  TurnNumber INT,
  GameID INT,
  TurnResult  NVARCHAR(1),
  ChoiceName NVARCHAR(10),
  CHECK (TurnNumber In (1,2,3,4,5)),
  CHECK (LEN(GameID)=6),
  CHECK (TurnResult In ('W','L','D')),
  CHECK (ChoiceName In ('PAPER','SCISSOR','ROCK')),
  Primary Key(GameID,TurnNumber),
  Foreign KEY(GameID)REFERENCES Game,
  -- Foreign KEY(UserName) REFERENCES Game,
  Foreign KEY(ChoiceName) REFERENCES Choice,
)




INSERT INTO Player
  (UserName)
VALUES
  ('Sarah'),
  ('Kyle'),
  ('Magnolia');

INSERT INTO Choice
  (ChoiceName)
VALUES
  ('PAPER'),
  ('SCISSOR'),
  ('ROCK');

INSERT INTO Game
  ( GameID, UserName,GameStarted,GameResult, NumOfTurn)
VALUES
  (111111,'Sarah', '2019-10-01 12:00:00','W',3),
  (222222,'Kyle','2019-10-01 11:00:00',  'W',1),
  (333333,'Magnolia','2019-10-01 11:10:00',  'W',1);
  
  INSERT INTO Turn(TurnNumber,GameID,TurnResult,ChoiceName)VALUES
-- (1,111111,'W','PAPER'),
-- (2,111111,'L','PAPER'),
(3,111111,'W','PAPER'),
(1,222222,'W','ROCK'),
(1,333333,'W','ROCK');

SELECT * FROM Turn

SELECT table_catalog[database],table_schema [schema],table_name name,table_type type
FROM INFORMATION_SCHEMA.TABLES
GO

  
  

