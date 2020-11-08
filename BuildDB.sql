-- Relational schema
-- - Player(UserName)
--     Primary Key(UserName
-- )
-- Choice(ChoiceName)
-- Primary Key (ChoiceName)

-- Round(DateTime,UserName,ChoiceName)
-- Primary Key (PlayTime,UserName)
-- Foreign Key (UserName)REFERENCES Player
-- Foreign Key (ChoiceName)REFERENCES Choice
using test;
IF OBJECT_ID('Player') IS NOT NULL 
  DROP TABLE Player;
IF OBJECT_ID('Choice') IS NOT NULL 
  DROP TABLE Choice;
IF OBJECT_ID('Round') IS NOT NULL 
  DROP TABLE Round;
  GO;

CREATE TABLE Player(
      UserName NVARCHAR(100),
      Primary KEY (UserName)
  )
CREATE TABLE Choice(
    ChoiceName NVARCHAR(10),
    CHECK (ChoiceName In ('PAPER','SCISSOR','ROCK')),
    Primary Key (ChoiceName)
)
CREATE TABLE Round(
    PlayTime DateTime,
    UserName NVARCHAR(100),
     ChoiceName NVARCHAR(10),
    CHECK (ChoiceName In ('PAPER','SCISSOR','ROCK')),
    Primary Key(PlayTime,UserName),
    Foreign KEY(UserName) REFERENCES Player,
    Foreign KEY(ChoiceName) REFERENCES Choice
)
INSERT INTO Player(UserName)VALUES
('Sarah'),
('Kyle'),
('Magnolia');

INSERT INTO Choice(ChoiceName) VALUES
('PAPER'),
('SCISSOR'),
('ROCK');

INSERT INTO Round(PlayTime,UserName,ChoiceName)VALUES
('2019-10-01 12:00:00','Sarah','PAPER'),
('2019-10-01 11:00:00','Kyle','PAPER'),
('2019-10-01 11:10:00','Magnolia','SCISSOR');

