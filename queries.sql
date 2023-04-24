/* ---------
List all levels from a given game
--------- */
SELECT LevelID, LevelName
FROM gamewiki.level
INNER JOIN gamewiki.location
	ON level.locationid = location.locationid
    WHERE GameName LIKE "Stardew valley"
ORDER BY LevelID;

/* ---------
Find all items that can be obtained at a given level.
--------- */
SELECT ItemID, ItemName, LevelName
FROM gamewiki.item
NATURAL JOIN gamewiki.levelitem
NATURAL JOIN gamewiki.level
WHERE level.levelname LIKE "Church of Elleh"
ORDER BY itemid;

/* ---------
Find all consumable items from a given game
--------- */
SELECT ItemID, ItemName
FROM gamewiki.item
WHERE item.gamename LIKE "Elden Ring" AND item.itemtype = "Consumable"
ORDER BY ItemID;

/* ---------
Find guides for a given game based on a keyword
--------- */
SELECT *
FROM gamewiki.guides
WHERE gamename LIKE "Final Fantasy 7 Remake"
	AND content LIKE "%Weapon%";

/* ---------
Find Enemies found at a given level
--------- */
SELECT LevelName, EnemyName
FROM gamewiki.Enemy
INNER JOIN gamewiki.level ON Enemy.LevelID = Level.LevelID
WHERE LevelName LIKE "%Lava Floor%";

/* ---------
Find items that found in a given level
--------- */
SELECT levelName, ItemName
FROM gamewiki.Level
INNER JOIN gamewiki.LevelItem ON LevelItem.LevelID = Level.LevelID
NATURAL JOIN gamewiki.item
WHERE Levelname LIKE "%Lava Floor%";

/* ---------
Find items that a given NPC can sell
--------- */
SELECT NPCName, ItemName
FROM gamewiki.NPC
INNER JOIN gamewiki.NPCItem ON NPCItem.NPCID = NPC.NPCID
NATURAL JOIN gamewiki.item
WHERE NPCName LIKE "%Kale%";

/* ---------
Find items that a given enemy can drop
--------- */
SELECT EnemyName, ItemName
FROM gamewiki.Enemy
INNER JOIN gamewiki.EnemyItem ON EnemyItem.EnemyID = Enemy.EnemyID
NATURAL JOIN gamewiki.item
WHERE EnemyName LIKE "%Monk%";