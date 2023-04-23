INSERT IGNORE INTO gamewiki.game
VALUES
("Elden Ring", "PC", "Action RPG", 59.99, 57, "M"),
("Stardew Valley", "PC", "Indie", 14.99, 53, "E-10+"),
("Final Fantasy 7 Remake", "PC", "Action RPG", 59.99, 37, "T");

INSERT IGNORE INTO gamewiki.location
VALUES
(001, "Limgrave", "Limgrave is a lush, expansive section of the Tenebrae Demesne. Golden trees and tall grass and bushes provide plenty of sustenance for the local wildlife, that features boars, sheep, goat and rodents in addition to flying creatures such as eagles and owls. More sinister and aggressive wildlife also exists, and those venturing forth should be prepared to combat them.", "Elden Ring"),
(002, "Caelid", "Caelid, known as the locale of the last battle between General Radahn and Malenia, Blade of Miquella, is a vast land consummately marred by scarlet rot.", "Elden Ring"),
(003, "Mountaintops of the Giants", "The fabled domain of the Giants, now in ruins. Devasted after their war against the Erdtree, their corpses lay frozen at the peak, with only the Fire Monks residing close by.", "Elden Ring"),

(004, "Pelican Town", "Pelican Town is where the player moves to at the start of the game, located in Stardew Valley. Pelican Town is where most of the villagers live, work, and socialize.", "Stardew Valley"),
(005, "Cindersap Forest", "Cindersap Forest is a large exterior region found in the southwest part of Stardew Valley. It has exits to the north into the Farm, to the east into Pelican Town, to the south into The Sewers, and to the northwest into the Secret Woods.", "Stardew Valley"),
(006, "The Beach", "The Beach is located to the south of Pelican Town. It is a valuable area for fishing as it is one of the few sources for saltwater fish.", "Stardew Valley"),
(007, "The Mines", "The Mines are located in the north area of The Mountains (northeast of the Carpenter's Shop and to the west of the Adventurer's Guild).", "Stardew Valley");
 
INSERT IGNORE INTO gamewiki.level
VALUES
(001, "Church of Elleh", null, null, 001),
(002, "Highroad Cave", "Guardian Golem", 1700, 001),
(003, "Caelid Catacombs", "Cemetery Shade", 2200, 002),
(004, "Redmane Castle", "Starscourge Radahn", 70000, 002),
(005, "Forbidden Lands", "Night's Cavalry", 36000, 003),
(006, "Forge of the Giants", "Fire Giant", 180000, 003),
(007, "Third Church of Marika", null, null, 001),

(008, "Pierre's General Store", null, null, 004),
(009, "Stardrop Saloon", null, null, 004),
(010, "Blacksmith", null, null, 004),
(011, "Marnie's Ranch", null, null, 005),
(012, "Leah's Cottage", null, null, 005),
(013, "Elliott's Cabin", null, null, 006),
(014, "Fish Shop", null, null, 006),
(015, "Earth Floor", "Stone Golem", null, 007),
(016, "Frozen Earth Floor", "Skeleton", null, 007),
(017, "Lava Floor", "Squid Kid", null, 007),
(018, "24 Mountain Road", null, null, 004);

INSERT IGNORE INTO gamewiki.item
VALUES
(001, "Stone Sword Key", "Consumable", "Elden Ring"),
(002, "Sacred Tear", "Consumable", "Elden Ring"),
(003, "Flask of Crimson Tears", "Consumable", "Elden Ring"),
(004, "Rune Arc", "Consumable", "Elden Ring"),
(005, "Boiled Prawn", "Consumable", "Elden Ring"),
(006, "Uchigatana", "Weapon", "Elden Ring"),
(007, "Cleanrot Knight's Sword", "Weapon", "Elden Ring"),
(008, "Broadsword", "Weapon", "Elden Ring"),
(009, "Monk's Flamemace", "Weapon", "Elden Ring"),
(010, "Longbow", "Weapon", "Elden Ring"),
(011, "Hefty Beast Bone", "Consumable", "Elden Ring"),
(012, "Spear", "Weapon", "Elden Ring"),
(013, "Kale's Bell Bearing", "Consumable", "Elden Ring"),
(014, "Royal Greatsword", "Weapon", "Elden Ring"),

(015, "Salad", "Consumable", "Stardew Valley"),
(016, "Hot Pepper", "Consumable", "Stardew Valley"),
(017, "Infinity Blade", "Weapon", "Stardew Valley"),
(018, "Sap", "Consumable", "Stardew Valley"),
(019, "Bat Wings", "Consumable", "Stardew Valley"),
(020, "Void Essence", "Consumable", "Stardew Valley"),
(021, "Coal", "Consumable", "Stardew Valley");


INSERT IGNORE INTO gamewiki.consumable
VALUES
(001, "Key Item", 1, "Breaks one imp statue seal", 2000),
(002, "Upgrade Material", 1, "Allows user to upgrade the Crimson and Cerulean Flask potency", null),
(003, "Potion", 1, "Restores HP", null),
(004, "Potion", 1, "Activates effects of Great Rune", 4000),
(005, "Potion", 1, "Boosts physical damage negation", 600),
(011, "Crafting Material", 1, "Used to create a wide variety of items", 250),
(013, "Key Item", 1, "Unlocks new items offered by Twin Maiden Husks", null),

(015, "Food Item", 1, "Salad is a cooked dish. Restores health and energy", 220),
(016, "Food Item", 1, "The Hot Pepper is a fruit crop. Restores health and energy.", null),
(018, "Crafting Item", 1, "It is used in various crafting recipes", null),
(019, "Monster Loot", 1, "It is used in various crafting recipes", 30),
(020, "Monster Loot", 1, "It is used in various crafting recipes", 100),
(021, "Basic Resource", 1, "It is used for smelting in a furnace", null);

INSERT IGNORE INTO gamewiki.weapon
VALUES
(006, "Katana", "Slash", "Pierce", "Unsheath"),
(007, "Sword", "Standard", "Pierce", "Impaling Thrust"),
(008, "Sword", "Standard", "Pierce", "Square Off"),
(009, "Mace", "Hammer", null, "Kick"),
(010, "Bow", "Bow", null, "Mighty Shot"),
(012, "Spear", "Pierce", null, "Impaling Thrust"),
(014, "Sword", "Standard", null, "Wolf's Assault"),

(017, "Sword", "Standard", null, null);

INSERT IGNORE INTO  gamewiki.enemy
VALUES
(001, "Boar", "Easy", 82, 16, 011),
(002, "Exile Soldier", "Easy", 735, 938, 012),
(003, "Cleanrot Knight", "Hard", 1980, 3300, 007),
(004, "Fire Monk", "Medium", 765, 1076, 009),

(005, "Slime", "Easy", 24, 3, 018),
(006, "Lava Bat", "Medium", 80, 7, 019),
(007, "Shadow Shaman", "Hard", 80, 15, 020),
(008, "Dust Sprite", "Easy", 40, 2, 021);

INSERT IGNORE INTO gamewiki.levelenemy
VALUES
("Boar", "Easy", 82, 001),
("Exile Soldier", "Easy", 735, 002),
("Cleanrot Knight", "Hard", 1980, 004),
("Fire Monk", "Medium", 765, 005),

("Shadow Shaman", "Hard", 80, 017),
("Lava Bat", "Medium", 80, 017),
("Slime", "Easy", 24, 015),
("Dust Sprite", "Easy", 40, 016);

INSERT IGNORE INTO gamewiki.npc
VALUES
(001, "Merchant Kale", null, null, null, 013, 001),
(002, "Blaidd", 3175, null, null, 014, 004),
(003, "Melina", null, null, null, null, 007),

(004, "Leah", null, null, null, null, 012),
(005, "Pierre", null, null, null, null, 008),
(006, "Gus", null, null, null, null, 009),
(007, "Clint", null, null, null, null, 010),
(008, "Marnie", null, null, null, null, 011),
(009, "Elliott", null, null, null, null, 013),
(010, "Sebastian", null, null, null, null, 018),
(011, "Willy", null, null, null, null, 014);

INSERT IGNORE INTO gamewiki.quest
VALUES
(001, "Story", "Marnie's Request", "Easy", 0),
(002, "Story", "Smelting", "Easy", 0),
(003, "Story", "To The Beach", "Easy", 0),
(004, "Special Order", "Cave Patrol", "Hard", 6000),
(005, "Special Order", "Gus' Famous Omelet", "Medium", 3000),
(006, "Special Order", "Pierre's Prime Produce", "Easy", 2500),
(007, "Special Order", "Juicy Bugs Wanted!", "Medium", 3000),
(008, "Special Order", "Tropical Fish", "Medium", 2500);

INSERT IGNORE INTO gamewiki.npcquest
VALUES
("Story", "Marnie's Request", 008),
("Story", "Smelting", 007),
("Story", "To The Beach", 011),
("Special Order", "Cave Patrol", 007),
("Special Order", "Gus' Famous Omelet", 006),
("Special Order", "Pierre's Prime Produce", 005),
("Special Order", "Juicy Bugs Wanted!", 011),
("Special Order", "Tropical Fish", 011);

INSERT IGNORE INTO gamewiki.levelitem
VALUES
(002, 007, null, 003), 
(013, 001, null, 001),
(014, 004, null, 002),
(009, 006, 004, null),
(011, 001, 001, null),
(012, 002, 002, null),
(007, 003, 003, null);

INSERT IGNORE INTO gamewiki.character
VALUES
(001, "Hero", 75, 499, "Elden Ring"),
(002, "Bandit", 82, 414, "Elden Ring"),
(003, "Astrologer", 95, 396, "Elden Ring"),
(004, "Warrior", 85, 434, "Elden Ring"),
(005, "Prisoner", 85, 434, "Elden Ring"),
(006, "Confessor", 88, 414, "Elden Ring"),
(007, "Wretch", 78, 414, "Elden Ring"),
(008, "Vagabond", 78, 522, "Elden Ring"),
(009, "Prophet", 91, 414, "Elden Ring"),
(010, "Samurai", 82, 455, "Elden Ring"),

(011, "The Player", 100, 100, "Stardew Valley");

INSERT IGNORE INTO gamewiki.jobname
VALUES
(001, "Easy Fishing"),
(002, "Hard Fishing"),
(003, "Mining"),
(004, "Foraging"),
(005, "Farming"),
(006, "Combat");

INSERT IGNORE INTO gamewiki.job
VALUES
(001, 011, "Easy", null),
(002, 011, "Hard", null),
(003, 011, "Medium", 12),
(004, 011, "Easy", 7),
(005, 011, "Easy", 5),
(006, 011, "Medium", null);

INSERT IGNORE INTO gamewiki.achievement
VALUES
(001, "Elden Lord", "Achieve the 'Elden Lord' ending", "Elden Ring"),
(002, "Age of the Stars", "Achieve the 'Age of the Stars' ending", "Elden Ring"),
(003, "Lord of the Frenzied Flame", "Achieve the 'Lord of the Frenzied Flame' ending", "Elden Ring"),
(004, "God-Slaying Armament", "Upgrade any armament to its highest stage", "Elden Ring"),
(005, "Legendary Armaments", "Acquire all nine legendary weapons", "Elden Ring"),

(006, "Millionaire", "Earn 1,000,000g", "Stardew Valley"),
(007, "Best Friends", "Reach a 10-heart friend level with someone", "Stardew Valley"),
(008, "Moving Up", "Upgrade your house", "Stardew Valley"),
(009, "The Bottom", "Reach the lowest level of the mines", "Stardew Valley");

INSERT IGNORE INTO gamewiki.guides
VALUES
(
	001,
	'Mythril Saber',
	'How to Get the Mythril Saber: Purchase from the weapons shop in Wall Market as soon as Chapter 14 - In Search of Hope',
	null,
    'Final Fantasy 7 Remake'
),
(
	002,
	'Bloodhound',
	'Military canines trained by Shinras Public Security Division. Genetic modifications have bestowed these animals with tentacles that can drain energy from their victim. Drops a Antitodte once their health of 50 gets depleted',
	null,
    'Final Fantasy 7 Remake'
),
(
	003,
	'On the Prowl Walkthrough',
	'The fight against the wrath hound has 2 parts. The first time you encounter it you just need to get its health down to 2/3rds. At this point it will flee. Then continue ahead (towards the next map marker) and fight it for real, this time until it’s dead.',
	null,
    'Final Fantasy 7 Remake'
);