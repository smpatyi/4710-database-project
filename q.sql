-- Query to search games by title
SELECT *
FROM GameWiki.Game
WHERE GameName = 'Enter_Game_Title';

-- Query to search items by name
SELECT *
FROM GameWiki.Item
WHERE ItemName = 'Enter_Item_Name';

-- Query to filter games by platform
SELECT *
FROM GameWiki.Game
WHERE Platform = 'Enter_Platform_Name';

-- Query to filter games by genre
SELECT *
FROM GameWiki.Game
WHERE Genre = 'Enter_Genre_Name';

-- Query to filter games by rating
SELECT *
FROM GameWiki.Game
WHERE Rating = 'Enter_Rating_Name';

-- Query to search NPC by NPC name
SELECT *
FROM GameWiki.NPC
WHERE NPCName = 'Enter_NPC_Name';

-- Query to search enemies by enemy name
SELECT *
FROM GameWiki.Enemy
WHERE EnemyName = 'Enter_Enemy_Name';

-- Query to search items by type
SELECT *
FROM GameWiki.Item
WHERE ItemType = 'Enter_Item_Type';

-- Query to search levels by location name
SELECT Level.*
FROM GameWiki.Level
INNER JOIN GameWiki.Location ON Level.LocationID = Location.LocationID
WHERE LocationName = 'Enter_Location_Name';

-- Query to search levels by level name
SELECT *
FROM GameWiki.Level
WHERE LevelName = 'Enter_Level_Name';

-- Query to search levels by boss name
SELECT *
FROM GameWiki.Level
WHERE Boss = 'Enter_Boss_Name';

-- Query to search levels by reward XP
SELECT *
FROM GameWiki.Level
WHERE RewardXP = 'Enter_Reward_XP';

-- Query to search enemies in a level by level ID
SELECT *
FROM GameWiki.LevelEnemy
WHERE LevelID = 'Enter_Level_ID';

-- Query to search items in a level by level ID
SELECT *
FROM GameWiki.LevelItem
WHERE LevelID = 'Enter_Level_ID';

-- Query to filter games by price range
SELECT *
FROM GameWiki.Game
WHERE Price >= 'Enter_Min_Price' AND Price <= 'Enter_Max_Price';

-- Query to search for personalized recommendations based on keywords
SELECT *
FROM GameWiki.Game
WHERE GameName IN (
SELECT DISTINCT GameName
FROM GameWiki.Level
WHERE LevelName LIKE '%Enter_Keyword%' OR Boss LIKE '%Enter_Keyword%'
);

-- Query to extract text from guides and tips for a keyword
SELECT *
FROM GameWiki.Guide
WHERE GuideText LIKE '%Enter_Keyword%';

-- Query to allow admins to create new game entries with placeholder attributes
INSERT INTO GameWiki.Game (GameName, Platform, Genre, Price, GameLength, Rating)
VALUES ('Enter_Game_Name', 'Enter_Platform_Name', 'Enter_Genre_Name', 'Enter_Price', 'Enter_Game_Length', 'Enter_Rating');

-- Query to organize data by video game title
SELECT * FROM game_data ORDER BY video_game_title;

-- Query to organize data by item name
SELECT * FROM game_data ORDER BY item_name;

-- Query to search for guides based on a keyword and recommend other tips/guides for the same game
SELECT * FROM game_data WHERE guide_text LIKE '%<keyword>%' AND video_game_title = '<game_title>';

-- Query to extract text from guides/tips for a specific game and keyword
SELECT guide_text FROM game_data WHERE video_game_title = '<game_title>' AND guide_text LIKE '%<keyword>%';

-- Query to insert a new game entry with placeholder attributes for missing data
INSERT INTO game_data (video_game_title, item_name, guide_text, is_missing_data) VALUES ('<game_title>', '<item_name>', '<guide_text>', true);

-- Query to organize data by video game title
SELECT * FROM game_data ORDER BY video_game_title;

-- Query to organize data by item name
SELECT * FROM game_data ORDER BY item_name;
