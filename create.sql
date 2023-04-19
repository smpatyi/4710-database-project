CREATE DATABASE GameWiki;

CREATE TABLE IF NOT EXISTS GameWiki.Game (
	GameName varchar(50) NOT NULL PRIMARY KEY,
	Platform varchar(50) NOT NULL CHECK (
		Platform = 'Nintendo Switch' OR
		Platform = 'PlayStation' OR
		Platform = 'Xbox' OR
		Platform = 'PC' ),
	Genre varchar(50),
	Price decimal(5,2) NOT NULL,
	GameLength int,
	Rating varchar(50) NOT NULL CHECK (
		Rating = 'E' OR
		Rating = 'E-10+' OR
		Rating = 'T' OR
		Rating = 'M' )
);

CREATE TABLE IF NOT EXISTS GameWiki.Location (
	LocationID int CHECK(LocationID > 0 AND LocationID < 1000) NOT NULL PRIMARY KEY,
	LocationName varchar(50) NOT NULL,
	Theme varchar(500),
	GameName varchar(50) NOT NULL REFERENCES GameWiki.Game(GameName)
);

CREATE TABLE IF NOT EXISTS GameWiki.Level (
	LevelID int check(LevelID > 0 AND LevelID < 1000) not null primary key,
    LevelName varchar(50) not null,
    Boss varchar(50),
    RewardXP int,
    LocationID int not null references GameWiki.Location(LocationID)
);

CREATE TABLE IF NOT EXISTS GameWiki.NPC (
	NPCID int check(NPCID > 0 and NPCID < 1000) not null primary key,
    NPCName varchar(50) not null,
    Health int,
    XPLevel int,
    Mana int,
    ItemID int references GameWiki.Item(ItemID),
    LevelID int references GameWiki.Item(ItemID)
);

CREATE TABLE IF NOT EXISTS GameWiki.Enemy (
	EnemyID int check(EnemyID > 0 and EnemyID < 1000) not null primary key,
    EnemyName varchar(50) not null,
    Difficulty varchar(50) not null,
    Health int check(Health > 0) not null,
    RewardXP int,
    ItemID int not null references GameWiki.Item(ItemID)
);

CREATE TABLE IF NOT EXISTS GameWiki.LevelEnemy (
	EnemyName varchar(50) not null,
    Difficulty varchar(50) not null,
    Health int not null,
    LevelID varchar(50) not null references GameWiki.Level(LevelID),
    primary key (EnemyName, Difficulty, Health)
);

CREATE TABLE IF NOT EXISTS GameWiki.Item (
	ItemID int not null check(ItemID > 0 and ItemID < 1000) primary key,
    ItemName varchar(50) not null,
    ItemType binary not null
);

CREATE TABLE IF NOT EXISTS GameWiki.LevelItem (
	ItemID int not null references GameWiki.Item(ItemID),
    LevelID int not null references GameWiki.Level(LevelID),
    EnemyID int references GameWiki.Enemy(EnemyID),
    NPCID int references GameWiki.NPC(NPCID),
    primary key (ItemID, LevelID)
);

CREATE TABLE IF NOT EXISTS GameWiki.Weapon (
	WeaponID int not null check(WeaponID > 0 and WeaponID < 1000) primary key,
    WeaponType varchar(50) not null,
    BasicAttack varchar(50) not null,
    StrongAttack varchar(50),
    SpecialAttack varchar(50)
);

CREATE TABLE IF NOT EXISTS GameWiki.Consumable (
	ConsumableID int not null check(ConsumableID > 0 and ConsumableID < 1000) primary key,
    ConsumableType varchar(50) not null,
    Uses int,
    Effect varchar(500),
    Cost decimal(9, 2) not null
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
	JobID int not null references GameWiki.JobName(JobID),
    CharacterID int not null references GameWiki.Character(CharacterID),
    Difficulty varchar(50),
    RewardXP int,
    primary key (JobID, CharacterID)
);

CREATE TABLE IF NOT EXISTS GameWiki.Quest (
	QuestID int not null check(QuestID > 0 AND QuestID < 1000) primary key,
    QuestType varchar(50) not null,
    QuestName varchar(50) not null,
    Difficulty varchar(50),
    RewardXP int
);

CREATE TABLE IF NOT EXISTS GameWiki.NPCQuest (
	QuestType varchar(50) not null references GameWiki.Quest(QuestType),
    QuestName varchar(50) not null references GameWiki.Quest(QuestName),
    NPCID int not null references GameWiki.NPC(NPCID),
    primary key (QuestType, QuestName)
);

CREATE TABLE IF NOT EXISTS GameWiki.Achievement (
	AchievementID int not null check(AchievementID > 0 AND AchievementID < 1000) primary key,
    AchievementName varchar(50),
    Requirement varchar(500)
);