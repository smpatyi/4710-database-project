CREATE DATABASE IF NOT EXISTS GameWiki;

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
	GameName varchar(50) NOT NULL,
    constraint foreign key (GameName) references GameWiki.Game(GameName)
);

CREATE TABLE IF NOT EXISTS GameWiki.Level (
	LevelID int check(LevelID > 0 AND LevelID < 1000) not null primary key,
    LevelName varchar(50) not null,
    Boss varchar(50),
    RewardXP int,
    LocationID int not null,
    constraint foreign key (LocationID) references gamewiki.location(LocationID)
);

CREATE TABLE IF NOT EXISTS GameWiki.Item (
	ItemID int not null check(ItemID > 0 and ItemID < 1000) primary key,
    ItemName varchar(50) not null,
    ItemType varchar(50) check (ItemType = "Weapon" OR ItemType = "Consumable") not null,
    GameName varchar(50) not null,
    constraint foreign key (GameName) references gamewiki.game(GameName)
);

CREATE TABLE IF NOT EXISTS GameWiki.LevelItem (
	LevelID int not null,
    ItemID int not null,
    constraint foreign key (LevelID) references gamewiki.Level(LevelID),
    constraint foreign key (ItemID) references gamewiki.item(ItemID),
    primary key (LevelID, ItemID)
);

CREATE TABLE IF NOT EXISTS GameWiki.NPC (
	NPCID int check(NPCID > 0 and NPCID < 1000) not null primary key,
    NPCName varchar(50) not null,
    Health int,
    XPLevel int,
    Mana int,
    heldItem int,
    LevelID int not null,
    constraint foreign key (HeldItem) references gamewiki.item(ItemID),
    constraint foreign key (LevelID) references gamewiki.level(LevelID)
);

CREATE TABLE IF NOT EXISTS GameWiki.NPCItem (
	NPCID int not null,
    ItemID int not null,
    constraint foreign key (NPCID) references gamewiki.NPC(NPCID),
    constraint foreign key (ItemID) references gamewiki.item(ItemID),
    primary key (NPCID, ItemID)
);

CREATE TABLE IF NOT EXISTS GameWiki.Enemy (
	EnemyID int check(EnemyID > 0 and EnemyID < 1000) not null primary key,
    EnemyName varchar(50) not null,
    Difficulty varchar(50) not null,
    Health int check(Health > 0) not null,
    RewardXP int,
    heldItem int,
	levelID int not null,
    constraint foreign key (heldItem) references gamewiki.item(ItemID),
    constraint foreign key (levelID) references gamewiki.Level(LevelID)
);

CREATE TABLE IF NOT EXISTS GameWiki.EnemyItem (
	EnemyID int not null,
    ItemID int not null,
    constraint foreign key (EnemyID) references gamewiki.enemy(EnemyID),
    constraint foreign key (ItemID) references gamewiki.item(ItemID),
    primary key (EnemyID, ItemID)
);

CREATE TABLE IF NOT EXISTS GameWiki.Weapon (
	WeaponID int not null check(WeaponID > 0 and WeaponID < 1000) primary key,
    WeaponType varchar(50) not null,
    BasicAttack varchar(50) not null,
    StrongAttack varchar(50),
    SpecialAttack varchar(50),
    constraint foreign key (WeaponID) references gamewiki.item(ItemID)
);

CREATE TABLE IF NOT EXISTS GameWiki.Consumable (
	ConsumableID int not null check(ConsumableID > 0 and ConsumableID < 1000) primary key,
    ConsumableType varchar(50) not null,
    Uses int,
    Effect varchar(500),
    Cost decimal(9, 2),
    constraint foreign key (ConsumableID) references gamewiki.item(ItemID)
);

CREATE TABLE IF NOT EXISTS GameWiki.Character (
	CharacterID int not null check(CharacterID > 0 and CharacterID < 1000) primary key,
    CharacterType varchar(50) not null,
    MaxMana int,
    MaxHealth int,
    GameName varchar(50) not null,
    constraint foreign key (GameName) references gamewiki.game(GameName)
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
    constraint foreign key (CharacterID) references gamewiki.character(CharacterID),
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
    constraint foreign key (QuestType, QuestName)
    references gamewiki.quest(QuestType, QuestName),
    constraint foreign key (NPCID) references gamewiki.NPC(NPCID),
    primary key (QuestType, QuestName)
);

CREATE TABLE IF NOT EXISTS GameWiki.Achievement (
	AchievementID int not null check(AchievementID > 0 AND AchievementID < 1000) primary key,
    AchievementName varchar(50),
    Requirement varchar(500),
    GameName varchar(50) not null,
    constraint foreign key (GameName) references gamewiki.game(GameName)
);

CREATE TABLE IF NOT EXISTS GameWiki.Guides (
	GuideID int not null check(GuideID > 0 AND GuideID < 1000) primary key,
    title varchar(50) not null,
    content varchar(500) not null,
    author varchar(50),
    GameName varchar(50) not null,
    constraint foreign key (GameName) references gamewiki.game(GameName)
);