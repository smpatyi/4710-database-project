/* ---------
Functional Requirement:
	Data Manipulation - Users should be able to search the
    database by filtering for certain values.
	Scalability - The system must be able to handle large volumes
    of data and users and perform efficiently under heavy loads.
How:
	Searches database for all levels from a provided game name.
    This query efficiently searches for locations in a game, all
    games dont have an abundance of data, so this query will
    perform well regardless.
--------- */
SELECT LevelID, LevelName
FROM gamewiki.level
INNER JOIN gamewiki.location
	ON level.locationid = location.locationid
    WHERE GameName LIKE "Stardew valley"
ORDER BY LevelID;

/* ---------
Functional Requirement:
	Data Manipulation - Users should be able to search the
    database by filtering for certain values.
How:
	Searches database for all items of a given type found
    in a chosen game.
--------- */
SELECT ItemID, ItemName
FROM gamewiki.item
WHERE item.gamename LIKE "Elden Ring" AND item.itemtype = "Consumable"
ORDER BY ItemID;

/* ---------
Functional Requirement:
	Personalized Recommendations - The system should recognize keywords
    in a guide and search and recommend different tips and guides based
    off of those. For example, if a player looks up how to get a star
    in level one, the system could recommend how to get other items
    on level one as well. 

How:
	Based on the provided keyword, "Weapon" this query searches the
    database for all guides with weapon mentioned in a given games
    guides table.
--------- */
SELECT *
FROM gamewiki.guides
WHERE gamename LIKE "Final Fantasy 7 Remake"
	AND content LIKE "%Weapon%";

/* ---------
Functional Requirement:
	Data Manipulation - Users should be able to search the
    database by filtering for certain values.
How:
	Searches database for all enemies found in a level.
--------- */
SELECT LevelName, EnemyName
FROM gamewiki.Enemy
INNER JOIN gamewiki.level ON Enemy.LevelID = Level.LevelID
WHERE LevelName LIKE "%Lava Floor%";

/* ---------
Functional Requirement:
	Data Manipulation - Users should be able to search the
    database by filtering for certain values.
How:
	Searches database for all items found in a level.
--------- */
SELECT levelName, ItemName
FROM gamewiki.Level
INNER JOIN gamewiki.LevelItem ON LevelItem.LevelID = Level.LevelID
NATURAL JOIN gamewiki.item
WHERE Levelname LIKE "%Elleh%";

/* ---------
Functional Requirement:
	Data Manipulation - Users should be able to search the
    database by filtering for certain values.
How:
	Searches database for all items that a given NPC sells.
--------- */
SELECT NPCName, ItemName
FROM gamewiki.NPC
INNER JOIN gamewiki.NPCItem ON NPCItem.NPCID = NPC.NPCID
NATURAL JOIN gamewiki.item
WHERE NPCName LIKE "%Kale%";

/* ---------
Functional Requirement:
	Data Manipulation - Users should be able to search the
    database by filtering for certain values.
How:
	Searches database for all items dropped by an enemy.
--------- */
SELECT EnemyName, ItemName
FROM gamewiki.Enemy
INNER JOIN gamewiki.EnemyItem ON EnemyItem.EnemyID = Enemy.EnemyID
NATURAL JOIN gamewiki.item
WHERE EnemyName LIKE "%Monk%";

/* ---------
Functional Requirement:
	Extract Text - The system should be able to extract text
    from guides and tips when the user searches a keyword.
How:
	Searches database for all guides that relate to a given keyword.
--------- */
SELECT itemName, itemType, item.GameName, title, content
FROM gamewiki.guides g
INNER JOIN gamewiki.item
	ON item.itemname LIKE "%Mythril Saber%"
WHERE 
	MATCH (g.title, g.content) 
    AGAINST ('%Mythril Saber%' IN NATURAL LANGUAGE MODE);

/* ---------
Functional Requirement:
	Achievement Management - The user should be able to store and 
    retrieve information about in-game achievements.
How:
	Show the achievements already in the database, then insert a new
    one, and retrieve the achievements with the new entry.
--------- */
SELECT AchievementName, Requirement, GameName
FROM gamewiki.achievement WHERE GameName LIKE "%Elden Ring%"
ORDER BY AchievementName ASC;

INSERT INTO gamewiki.achievement (AchievementName, Requirement, GameName)
VALUE ("Fire Giant", "Defeat the Fire Giant", "Elden Ring");

SELECT AchievementName, Requirement, GameName
FROM gamewiki.achievement WHERE GameName LIKE "%Elden Ring%"
ORDER BY AchievementName ASC;

/* ---------
Functional Requirement:
	Data Validation - When a user tries entering a new piece of data,
    the database should accept new entries as long as it follows the
    databases parameters.
How:
	First  Query, inserting a bad game to the game table, throws error.
    Second Query, inserting corrected data to game table.
    Third Query, showing how only the good data is accepted.
--------- */
INSERT INTO gamewiki.game
VALUE ('Bad Example', 'PSP', 'RPG', '39.99', '10', 'E');

INSERT INTO gamewiki.game
VALUE ('Good Example', 'PC', 'RPG', 39.99, 10, 'E');

SELECT * FROM gamewiki.game;

/* ---------
Functional Requirement:
	Data Paucity - The system should allow users to create new game entries
    in the database with placeholder attributes to signify that data is
    missing and is still needed, but will be uploaded over time.
How:
	First and Second Query, inserting data with temporary values
    Third and Fourth Query, seeing data with the temporary values,
    that can be changed later.
--------- */
INSERT INTO gamewiki.game
VALUE ("New Release", "PC", "RPG", -1, -1, 'M');

INSERT INTO gamewiki.location
VALUES
(100, "TEMPORARY", "TEMPORARY", "New Release"),
(101, "TEMPORARY", "TEMPORARY", "New Release");

SELECT * FROM gamewiki.game WHERE GameName LIKE "New Release";
SELECT * FROM gamewiki.location WHERE GameName LIKE "New Release";

/* ---------
Functional Requirement:
	Data Separation - Entities with the same name or attributes from
    separate games shouldn’t show up in queries for the wrong game. 
How:
	We can see the two queries show different enemy data based on the
    game used in the query.
--------- */
Select EnemyID, EnemyName, Difficulty, Health, enemy.RewardXP, HeldItem, enemy.levelID
FROM gamewiki.enemy 
INNER JOIN gamewiki.level ON enemy.levelID = level.levelID
INNER JOIN gamewiki.location ON level.locationID = location.locationID
WHERE location.gamename LIKE "Elden Ring" AND enemy.enemyName LIKE "Rat";

Select EnemyID, EnemyName, Difficulty, Health, enemy.RewardXP, HeldItem, enemy.levelID
FROM gamewiki.enemy 
INNER JOIN gamewiki.level ON enemy.levelID = level.levelID
INNER JOIN gamewiki.location ON level.locationID = location.locationID
WHERE location.gamename LIKE "Final Fantasy 7 Remake" AND enemy.enemyName LIKE "Rat";

/* ---------
Functional Requirement:
	Quest Management - The user should be able to store and 
    retrieve information about in-game quests.
How:
	Show the quests already in the database, then insert a new
    one, and retrieve the quests with the new entry.
--------- */
SELECT quest.QuestID, QuestType, QuestName, Difficulty, RewardXP
FROM gamewiki.quest
INNER JOIN gamewiki.npcquest ON quest.questID = npcquest.questID
INNER JOIN gamewiki.npc ON npcquest.npcid = npc.npcid
WHERE npcname LIKE "Willy";

INSERT INTO gamewiki.quest
VALUE (009, "Example", "Example", "Hard", 10000);

INSERT INTO gamewiki.npcquest
VALUE (009, 011);

SELECT quest.QuestID, QuestType, QuestName, Difficulty, RewardXP
FROM gamewiki.quest
INNER JOIN gamewiki.npcquest ON quest.questID = npcquest.questID
INNER JOIN gamewiki.npc ON npcquest.npcid = npc.npcid
WHERE npcname LIKE "Willy";