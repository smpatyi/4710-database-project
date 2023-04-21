CREATE DATABASE IF NOT EXISTS GameWiki;

CREATE TABLE IF NOT EXISTS GameWiki.Game (
    GameName varchar(50) NOT NULL PRIMARY KEY,
    Platform varchar(50) NOT NULL CHECK (
        Platform = 'Nintendo Switch' OR
        Platform = 'PlayStation' OR
        Platform = 'Xbox' OR
        Platform = 'PC'),
    Genre varchar(50),
    Price decimal(5, 2) NOT NULL,
    GameLength int,
    Rating varchar(50) NOT NULL CHECK (
        Rating = 'E' OR
        Rating = 'E-10+' OR
        Rating = 'T' OR
        Rating = 'M')
);

CREATE TABLE IF NOT EXISTS GameWiki.Location (
    LocationID int CHECK(LocationID > 0 AND LocationID < 1000) NOT NULL PRIMARY KEY,
    LocationName varchar(50) NOT NULL,
    Theme varchar(500),
    GameName varchar(50) NOT NULL,
    CONSTRAINT foreign key (GameName) REFERENCES GameWiki.Game(GameName)
);

CREATE TABLE IF NOT EXISTS GameWiki.Level (
    LevelID int check(LevelID > 0 AND LevelID < 1000) not null primary key,
    LevelName varchar(50) not null,
    Boss varchar(50),
    RewardXP int,
    LocationID int not null,
    CONSTRAINT foreign key (LocationID) REFERENCES GameWiki.Location(LocationID)
);

CREATE TABLE IF NOT EXISTS GameWiki.NPC (
    NPCID int check(NPCID > 0 and NPCID < 1000) not null primary key,
    NPCName varchar(50) not null,
    Health int,
    XPLevel int,
    Mana int,
    ItemID int,
    LevelID int,
    CONSTRAINT foreign key (ItemID) REFERENCES GameWiki.Item(ItemID),
    CONSTRAINT foreign key (LevelID) REFERENCES GameWiki.Level(LevelID)
);

CREATE TABLE IF NOT EXISTS GameWiki.Enemy (
    EnemyID int check(EnemyID > 0 and EnemyID < 1000) not null primary key,
    EnemyName varchar(50) not null,
    Difficulty varchar(50) not null,
    Health int check(Health > 0) not null,
    RewardXP int,
    ItemID int not null,
    CONSTRAINT foreign key (ItemID) REFERENCES GameWiki.Item(ItemID)
);

CREATE TABLE IF NOT EXISTS GameWiki.LevelEnemy (
    EnemyName varchar(50) not null,
    Difficulty varchar(50) not null,
    Health int not null,
    LevelID int not null,
    CONSTRAINT foreign key (LevelID) REFERENCES GameWiki.Level(LevelID),
    primary key (EnemyName, Difficulty, Health)
);


CREATE TABLE IF NOT EXISTS GameWiki.LevelItem (
    ItemID int not null,
    LevelID int not null,
    EnemyID int,
    NPCID int,
    CONSTRAINT foreign key (ItemID) REFERENCES GameWiki.Item(ItemID),
    CONSTRAINT foreign key (LevelID) REFERENCES GameWiki.Level(LevelID)
    );



CREATE TABLE IF NOT EXISTS GameWiki.Character (
	CharacterID int not null check(CharacterID > 0 and CharacterID < 1000) primary key,
    CharacterType varchar(50) not null,
    MaxMana int,
    MaxHealth int
);

CREATE TABLE IF NOT EXISTS GameWiki.JobName (
	JobID int not null check(JobID > 0 and JobID < 1000) primary key,
    JobType varchar(50) not null
);

CREATE TABLE IF NOT EXISTS GameWiki.Job (
	JobID int not null,
    CharacterID int not null,
    Difficulty varchar(50),
    RewardXP int,
    constraint foreign key (JobID) references gamewiki.jobname(JobID),
    constraint foreign key (CharacterID) references gamewiki.Character(CharacterID),
    primary key (JobID, CharacterID)
);

CREATE TABLE IF NOT EXISTS GameWiki.Quest (
	QuestID int not null check(QuestID > 0 AND QuestID < 1000) primary key,
    QuestType varchar(50) not null,
    QuestName varchar(50) not null,
    Difficulty varchar(50),
    RewardXP int,
    constraint unique (QuestType, QuestName)
);

CREATE TABLE IF NOT EXISTS GameWiki.NPCQuest (
	QuestType varchar(50) not null,
    QuestName varchar(50) not null,
    NPCID int not null,
    Constraint foreign key (QuestType, QuestName) references gamewiki.Quest(QuestType, QuestName),
    Constraint foreign key (NPCID) references gamewiki.NPC(NPCID),
    primary key (QuestType, QuestName)
);

CREATE TABLE IF NOT EXISTS GameWiki.Achievement (
	AchievementID int not null check(AchievementID > 0 AND AchievementID < 1000) primary key,
    AchievementName varchar(50),
    Requirement varchar(500)
);
CREATE TABLE IF NOT EXISTS GameWiki.Weapon (
    WeaponID BINARY(16) NOT NULL PRIMARY KEY,
    WeaponType VARCHAR(50) NOT NULL,
    BasicAttack VARCHAR(50) NOT NULL,
    StrongAttack VARCHAR(50),
    SpecialAttack VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS GameWiki.Consumable (
    ConsumableID BINARY(16) NOT NULL PRIMARY KEY,
    ConsumableType VARCHAR(50) NOT NULL,
    Uses INT,
    Effect VARCHAR(500),
    Cost DECIMAL(9, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS GameWiki.Item (
    ItemID INT NOT NULL CHECK (ItemID > 0 AND ItemID < 1000) PRIMARY KEY,
    ItemName VARCHAR(50) NOT NULL,
    ItemType VARCHAR(20) NOT NULL,
    WeaponID BINARY(16),
    ConsumableID BINARY(16),
    CONSTRAINT foreign key (WeaponID) REFERENCES GameWiki.Weapon(WeaponID),
    CONSTRAINT foreign key (ConsumableID) REFERENCES GameWiki.Consumable(ConsumableID)
);
ALTER TABLE GameWiki.Item
ADD COLUMN isConsumable TINYINT(1) NOT NULL,
ADD COLUMN isWeapon TINYINT(1) NOT NULL;

ALTER TABLE GameWiki.Weapon
ADD COLUMN isWeapon TINYINT(1) NOT NULL;

ALTER TABLE GameWiki.Consumable
ADD COLUMN isConsumable TINYINT(1) NOT NULL;

