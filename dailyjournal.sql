CREATE TABLE `JournalEntries` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `concept` TEXT NOT NULL,
    `entry` TEXT NOT NULL,
    `mood_id` INTEGER, 
    FOREIGN KEY (`mood_id`) REFERENCES `Moods`(`id`)
);

CREATE TABLE `Moods` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `label` TEXT NOT NULL
);

INSERT INTO `JournalEntries` VALUES (null, "Python packages", "Today we learned about packages, a pretty cool way to import functions!", 4);
INSERT INTO `JournalEntries` VALUES (null, "SQL", "SQL IS AWESOME", 2);
INSERT INTO `JournalEntries` VALUES (null, "USing SQL with Python", "This is breaking my brain", 1);


INSERT INTO `Moods` VALUES (null, "Oatmeal Brain");
INSERT INTO `Moods` VALUES (null, "Happy");
INSERT INTO `Moods` VALUES (null, "Tired");
INSERT INTO `Moods` VALUES (null, "Excited");
INSERT INTO `Moods` VALUES (null, "Sad");
INSERT INTO `Moods` VALUES (null, "Okay");