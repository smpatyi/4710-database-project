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
ORDER BY ItemID