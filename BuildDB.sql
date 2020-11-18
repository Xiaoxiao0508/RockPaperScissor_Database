-- Relational schema
-- - Player(UserName)
--     Primary Key(UserName
-- )
-- Choice(ChoiceName)
-- Primary Key (ChoiceName)

-- Game(GameID,UserName,GameStarted,GameResult,NumOfTurn)
-- PRIMARY KEY(GameID)
-- FOREIGN key(UserName) REFERENCES Player

-- Turn(TurnNumber,TurnResult)
-- Primary Key (TurnNumber,GameID)
-- Foreign Key (GameID)REFERENCES Game
-- Foreign Key (ChoiceName)REFERENCES Choice
-- CREATE DATABASE test
-- GO
USE test;

IF OBJECT_ID('Turn') IS NOT NULL 
  DROP TABLE Turn;
  IF OBJECT_ID('Game') IS NOT NULL 
  DROP TABLE Game;
IF OBJECT_ID('Player') IS NOT NULL 
  DROP TABLE Player;
-- IF OBJECT_ID('Choice') IS NOT NULL 
  -- DROP TABLE Choice;


  
GO

CREATE TABLE Player
(
  UserName NVARCHAR(100),
  Primary KEY (UserName)
)
-- CREATE TABLE Choice
-- (
--   ChoiceName NVARCHAR(10),
--   CHECK (ChoiceName In ('PAPER','SCISSOR','ROCK')),
--   Primary Key (ChoiceName)
-- )
CREATE TABLE Game
(
  GameID INT,
  UserName NVARCHAR(100),
  GameStarted Nvarchar(max),
  GameResult NVARCHAR(1),
  NumOfTurn INT,
  CHECK (LEN(GameID)=6),
  CHECK (GameResult In ('W','L','D')),
  CHECK (NumOfTurn In (1,3,5)),
  Primary Key(GameID),
  Foreign KEY(UserName) REFERENCES Player,
)

-- CREATE TABLE Turn
-- (
--   TurnNumber INT,
--   GameID INT,
--   TurnResult  NVARCHAR(1),
--   ChoiceName NVARCHAR(10),
--   CHECK (TurnNumber In (1,2,3,4,5)),
--   CHECK (LEN(GameID)=6),
--   CHECK (TurnResult In ('W','L','D')),
--   CHECK (ChoiceName In ('PAPER','SCISSOR','ROCK')),
--   Primary Key(GameID,TurnNumber),
--   Foreign KEY(GameID)REFERENCES Game,
--   -- Foreign KEY(UserName) REFERENCES Game,
--   Foreign KEY(ChoiceName) REFERENCES Choice,
-- )




-- INSERT INTO Player
--   (UserName)
-- VALUES
--   ('Sarah'),
--   ('Kyle'),
--   ('Magnolia');

-- INSERT INTO Choice
--   (ChoiceName)
-- VALUES
--   ('PAPER'),
--   ('SCISSOR'),
--   ('ROCK');





SELECT table_catalog[database],table_schema [schema],table_name name,table_type type
FROM INFORMATION_SCHEMA.TABLES
GO
-- SELECT * FROM Turn
SELECT * FROM Player
SELECT *FROM Turn
select * FROM Game
Select * from Choice
-- ---------------------ADD PLAYER--------------------------------P
GO
IF OBJECT_ID('ADD_PLAYER') IS NOT NULL
DROP PROCEDURE ADD_PLAYER;
GO
CREATE PROCEDURE ADD_PLAYER @name NVARCHAR(100) AS
BEGIN

    -- SELECT @name=UserName
    -- FROM Player
    -- IF @@ROWCOUNT!=0
    -- THROW 50030,'Duplicate player name',1
    INSERT INTO Player(UserName)VALUES(@name)
  
END;
GO
SELECT * 
  FROM test.INFORMATION_SCHEMA.ROUTINES
 WHERE ROUTINE_TYPE = 'PROCEDURE'
 GO
-- SELECT * FROM Player
-- -------------------Generate game ID-----------------
IF OBJECT_ID('Game_SEQ') IS NOT NULL
DROP SEQUENCE Game_SEQ;
CREATE SEQUENCE Game_SEQ
AS INT
START WITH 111111
INCREMENT BY 1;
GO
------------------------------Add Game Procedure----------------
IF OBJECT_ID('ADD_GAME') IS NOT NULL
DROP PROCEDURE ADD_GAME;
GO
CREATE PROCEDURE ADD_GAME
@UserName NVARCHAR(100),@GameStarted Nvarchar(max),@GameResult NVARCHAR(1),@NumOfTurns INT
AS
BEGIN
  -- BEGIN TRY
  DECLARE @GameID INT
  -- IF ISDATE(@GameStarted)!=1
  --           THROW 50250,'Date not valid',1
  SET @GameID =NEXT VALUE FOR Game_SEQ
  INSERT INTO Game(GameID, UserName,GameStarted,GameResult,NumOfTurn)VALUES
  (@GameID,@UserName,@GameStarted,@GameResult,@NumOfTurns)

  -- END TRY
  -- BEGIN CATCH
  -- IF ERROR_NUMBER()=50250
  -- THROW
  -- END CATCH
END;
GO

  


