-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_dashboard`
--

DROP TABLE IF EXISTS `analytics_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analytics_dashboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character` int DEFAULT NULL,
  `player` int DEFAULT NULL,
  `performance` int DEFAULT NULL,
  `time_played` time DEFAULT NULL,
  `achievement` int DEFAULT NULL,
  `community_board` text,
  `milestone` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character` (`character`),
  KEY `player` (`player`),
  KEY `achievements` (`achievement`),
  KEY `milestone` (`milestone`),
  CONSTRAINT `analytics_dashboard_ibfk_1` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  CONSTRAINT `analytics_dashboard_ibfk_2` FOREIGN KEY (`character`) REFERENCES `character` (`id`),
  CONSTRAINT `analytics_dashboard_ibfk_3` FOREIGN KEY (`achievement`) REFERENCES `achievement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_dashboard`
--

LOCK TABLES `analytics_dashboard` WRITE;
/*!40000 ALTER TABLE `analytics_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatar`
--

DROP TABLE IF EXISTS `avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avatar` (
  `avatarId` int NOT NULL AUTO_INCREMENT,
  `cosmetics` int unsigned DEFAULT NULL,
  `outfit` int unsigned DEFAULT NULL,
  `weaponSkin` int unsigned DEFAULT NULL,
  `emotes` int unsigned DEFAULT NULL,
  `race` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`avatarId`),
  KEY `outfit` (`outfit`),
  KEY `cosmetics` (`cosmetics`),
  KEY `weaponSkin` (`weaponSkin`),
  KEY `emotes` (`emotes`),
  KEY `race` (`race`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `player` int DEFAULT NULL,
  `kingdom` int DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `skill_board` int DEFAULT NULL,
  `race` int DEFAULT NULL,
  `item` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player` (`player`),
  KEY `startingRegion` (`kingdom`),
  KEY `class` (`class`),
  KEY `skill_dashboard` (`skill_board`),
  KEY `avatar` (`race`),
  KEY `character_ibfk_6` (`item`),
  CONSTRAINT `character_ibfk_1` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  CONSTRAINT `character_ibfk_2` FOREIGN KEY (`kingdom`) REFERENCES `kingdom` (`id`),
  CONSTRAINT `character_ibfk_3` FOREIGN KEY (`class`) REFERENCES `class` (`id`),
  CONSTRAINT `character_ibfk_4` FOREIGN KEY (`race`) REFERENCES `race` (`id`),
  CONSTRAINT `character_ibfk_5` FOREIGN KEY (`skill_board`) REFERENCES `skill_dashboard` (`id`),
  CONSTRAINT `character_ibfk_6` FOREIGN KEY (`item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `properties` text,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combat`
--

DROP TABLE IF EXISTS `combat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `player` int DEFAULT NULL,
  `move` varchar(20) DEFAULT NULL,
  `turn` int DEFAULT NULL,
  `enemy` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player` (`player`),
  KEY `enemy` (`enemy`),
  CONSTRAINT `combat_ibfk_1` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  CONSTRAINT `combat_ibfk_2` FOREIGN KEY (`enemy`) REFERENCES `enemy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combat`
--

LOCK TABLES `combat` WRITE;
/*!40000 ALTER TABLE `combat` DISABLE KEYS */;
/*!40000 ALTER TABLE `combat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crafting`
--

DROP TABLE IF EXISTS `crafting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crafting` (
  `blueprint` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `item` int DEFAULT NULL,
  PRIMARY KEY (`blueprint`),
  KEY `item` (`item`),
  CONSTRAINT `crafting_ibfk_1` FOREIGN KEY (`item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crafting`
--

LOCK TABLES `crafting` WRITE;
/*!40000 ALTER TABLE `crafting` DISABLE KEYS */;
/*!40000 ALTER TABLE `crafting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialogue`
--

DROP TABLE IF EXISTS `dialogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dialogue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `npc` int DEFAULT NULL,
  `character` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dialogue_ibfk_1` (`npc`),
  KEY `dialogue_ibfk_2` (`character`),
  CONSTRAINT `dialogue_ibfk_1` FOREIGN KEY (`npc`) REFERENCES `npc` (`id`),
  CONSTRAINT `dialogue_ibfk_2` FOREIGN KEY (`character`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialogue`
--

LOCK TABLES `dialogue` WRITE;
/*!40000 ALTER TABLE `dialogue` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `economy`
--

DROP TABLE IF EXISTS `economy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `economy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `economy`
--

LOCK TABLES `economy` WRITE;
/*!40000 ALTER TABLE `economy` DISABLE KEYS */;
/*!40000 ALTER TABLE `economy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enemy`
--

DROP TABLE IF EXISTS `enemy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enemy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `reward` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `enemies_ibfk_1` (`reward`),
  CONSTRAINT `enemy_ibfk_1` FOREIGN KEY (`reward`) REFERENCES `reward` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemy`
--

LOCK TABLES `enemy` WRITE;
/*!40000 ALTER TABLE `enemy` DISABLE KEYS */;
INSERT INTO `enemy` VALUES (2,'Dire Bat','Humanoid',NULL,NULL,NULL),(4,'Twilight Satyr','Beast',NULL,NULL,NULL),(6,'Haunted Marionette','Demon',NULL,NULL,NULL),(9,'Crystal Dragon','Demon',NULL,NULL,NULL),(12,'Frost Giant','Giant',NULL,NULL,NULL),(14,'Cave Spider','Humanoid',NULL,NULL,NULL),(17,'Lunar Witch','Elemental',NULL,NULL,NULL),(18,'Stone Sentinel','Beast',NULL,NULL,NULL),(21,'Crimson Rogue','Humanoid',NULL,NULL,NULL),(23,'Fire Salamander','Undead',NULL,NULL,NULL),(26,'Enchanted Treant','Undead',NULL,NULL,NULL),(29,'Magma Serpent','Demon',NULL,NULL,NULL),(32,'Fire Imp','Beast',NULL,NULL,NULL),(34,'Twilight Satyr','Swarm',NULL,NULL,NULL),(37,'Phantom Banshee','Dragon',NULL,NULL,NULL),(40,'Twilight Satyr','Demon',NULL,NULL,NULL),(41,'Cave Spider','Elemental',NULL,NULL,NULL),(42,'Armored Basilisk','Elemental',NULL,NULL,NULL),(45,'Thunderhawk','Beast',NULL,NULL,NULL),(48,'Cursed Samurai','Elemental',NULL,NULL,NULL),(49,'Unholy Death Knight','Demon',NULL,NULL,NULL),(50,'Infernal Incubus','Humanoid',NULL,NULL,NULL),(53,'Silverback Gorilla','Undead',NULL,NULL,NULL),(54,'Corrupted Alchemist','Swarm',NULL,NULL,NULL),(55,'Fallen Archangel','Flora',NULL,NULL,NULL),(56,'Alpha Wolf','Magical',NULL,NULL,NULL),(58,'Chaos Demon','Construct',NULL,NULL,NULL),(59,'Forest Spirit','Humanoid',NULL,NULL,NULL),(62,'Spiked Behemoth','Swarm',NULL,NULL,NULL),(65,'Unholy Death Knight','Humanoid',NULL,NULL,NULL),(67,'Chaos Demon','Undead',NULL,NULL,NULL),(69,'Ice Elemental','Magical',NULL,NULL,NULL),(70,'Dreaded Chimera','Beast',NULL,NULL,NULL),(71,'Crystal Dragon','Magical',NULL,NULL,NULL),(72,'Twisted Dryad','Magical',NULL,NULL,NULL),(73,'Poisonous Plant','Humanoid',NULL,NULL,NULL),(74,'Cybernetic Scorpion','Undead',NULL,NULL,NULL),(75,'Murderous Wendigo','Undead',NULL,NULL,NULL),(78,'Wandering Yeti','Construct',NULL,NULL,NULL),(81,'Armored Centaur','Magical',NULL,NULL,NULL),(84,'Bloodthirsty Mermaid','Humanoid',NULL,NULL,NULL),(86,'Sand Elemental','Magical',NULL,NULL,NULL),(87,'Lunar Moth','Undead',NULL,NULL,NULL),(89,'Thunderhawk','Elemental',NULL,NULL,NULL),(90,'Cursed Samurai','Undead',NULL,NULL,NULL),(91,'Armored Centaur','Undead',NULL,NULL,NULL),(93,'Armored Centaur','Giant',NULL,NULL,NULL),(94,'Plague Rat','Construct',NULL,NULL,NULL),(97,'Electric Eel','Magical',NULL,NULL,NULL),(98,'Forest Nymph','Undead',NULL,NULL,NULL),(101,'Thunderhawk','Magical',NULL,NULL,NULL),(102,'Voracious Goblin','Magical',NULL,NULL,NULL),(104,'Venomous Serpent','Swarm',NULL,NULL,NULL),(105,'Dire Bat','Flora',NULL,NULL,NULL),(108,'Water Elemental','Beast',NULL,NULL,NULL),(109,'Clockwork Guardian','Beast',NULL,NULL,NULL),(112,'Fallen Archangel','Undead',NULL,NULL,NULL),(115,'Alpha Wolf','Undead',NULL,NULL,NULL),(117,'Earthquake Worm','Beast',NULL,NULL,NULL),(120,'Chaos Demon','Dragon',NULL,NULL,NULL),(123,'Plague Rat','Beast',NULL,NULL,NULL),(126,'Skeletal Mage','Magical',NULL,NULL,NULL),(129,'Screeching Harpy','Demon',NULL,NULL,NULL),(130,'Blazing Phoenix','Beast',NULL,NULL,NULL),(132,'Frostbite Scorpion','Humanoid',NULL,NULL,NULL),(135,'Silverback Gorilla','Undead',NULL,NULL,NULL),(138,'Corrupted Paladin','Elemental',NULL,NULL,NULL),(139,'Shadow Stalker','Humanoid',NULL,NULL,NULL),(140,'Screeching Harpy','Humanoid',NULL,NULL,NULL),(143,'Lunar Moth','Elemental',NULL,NULL,NULL),(145,'Wandering Yeti','Undead',NULL,NULL,NULL),(147,'Crystal Dragon','Construct',NULL,NULL,NULL),(150,'Crystal Gargoyle','Undead',NULL,NULL,NULL),(153,'Frostbite Scorpion','Magical',NULL,NULL,NULL),(156,'Wandering Yeti','Dragon',NULL,NULL,NULL),(159,'Ice Elemental','Magical',NULL,NULL,NULL),(162,'Wandering Yeti','Demon',NULL,NULL,NULL),(165,'Alpha Wolf','Magical',NULL,NULL,NULL),(168,'Spectral Warden','Giant',NULL,NULL,NULL),(170,'Demonic Harbinger','Demon',NULL,NULL,NULL),(172,'Unholy Death Knight','Magical',NULL,NULL,NULL),(173,'Spiked Behemoth','Demon',NULL,NULL,NULL),(176,'Warrior Orc','Humanoid',NULL,NULL,NULL),(178,'Phantom Assassin','Beast',NULL,NULL,NULL),(179,'Phantom Assassin','Undead',NULL,NULL,NULL),(182,'Cursed Samurai','Humanoid',NULL,NULL,NULL),(184,'Cursed Samurai','Undead',NULL,NULL,NULL),(185,'Ghostly Archer','Giant',NULL,NULL,NULL),(186,'Chained Spirit','Construct',NULL,NULL,NULL),(189,'Dire Pegasus','Undead',NULL,NULL,NULL),(190,'Screeching Harpy','Undead',NULL,NULL,NULL),(191,'Enchanted Treant','Elemental',NULL,NULL,NULL),(193,'Undead Pirate','Magical',NULL,NULL,NULL),(195,'Armored Demon','Demon',NULL,NULL,NULL),(198,'Chimera Matriarch','Undead',NULL,NULL,NULL),(200,'Chimera Matriarch','Demon',NULL,NULL,NULL),(202,'Earthquake Worm','Beast',NULL,NULL,NULL),(205,'Spiked Behemoth','Elemental',NULL,NULL,NULL),(208,'Shadow Stalker','Demon',NULL,NULL,NULL),(210,'Fallen Archangel','Humanoid',NULL,NULL,NULL),(213,'Plague Rat','Undead',NULL,NULL,NULL),(214,'Ice Elemental','Elemental',NULL,NULL,NULL),(216,'Shadow Stalker','Construct',NULL,NULL,NULL),(219,'Thunderhawk','Magical',NULL,NULL,NULL),(222,'Armored Centaur','Humanoid',NULL,NULL,NULL),(225,'Forest Spirit','Giant',NULL,NULL,NULL),(228,'Shadow Wraith','Dragon',NULL,NULL,NULL),(229,'Banshee Queen','Humanoid',NULL,NULL,NULL),(231,'Dreaded Chimera','Humanoid',NULL,NULL,NULL),(233,'Fire Imp','Humanoid',NULL,NULL,NULL),(235,'Armored Basilisk','Magical',NULL,NULL,NULL),(236,'Vampiric Bat Swarm','Construct',NULL,NULL,NULL),(238,'Bloodthirsty Mermaid','Undead',NULL,NULL,NULL),(240,'Chained Spirit','Elemental',NULL,NULL,NULL),(242,'Phantom Assassin','Giant',NULL,NULL,NULL),(244,'Cave Spider','Giant',NULL,NULL,NULL),(245,'Vampire Lord','Magical',NULL,NULL,NULL),(247,'Dreaded Chimera','Demon',NULL,NULL,NULL),(249,'Fire Salamander','Undead',NULL,NULL,NULL),(250,'Siren of Despair','Elemental',NULL,NULL,NULL),(252,'Ancient Wyrm','Humanoid',NULL,NULL,NULL),(255,'Spiked Behemoth','Giant',NULL,NULL,NULL),(258,'Dark Sorcerer','Undead',NULL,NULL,NULL),(260,'Plague Rat','Beast',NULL,NULL,NULL),(261,'Sand Elemental','Elemental',NULL,NULL,NULL),(262,'Chimera Matriarch','Dragon',NULL,NULL,NULL),(263,'Spectral Warden','Beast',NULL,NULL,NULL),(266,'Lunar Witch','Elemental',NULL,NULL,NULL),(268,'Venomous Serpent','Elemental',NULL,NULL,NULL),(270,'Poisonous Plant','Dragon',NULL,NULL,NULL),(271,'Time-Weaver','Elemental',NULL,NULL,NULL),(273,'Mud Troll','Beast',NULL,NULL,NULL),(274,'Cursed Samurai','Demon',NULL,NULL,NULL),(277,'Vampiric Bat Swarm','Giant',NULL,NULL,NULL),(279,'Cybernetic Scorpion','Humanoid',NULL,NULL,NULL),(280,'Demonic Kraken','Construct',NULL,NULL,NULL),(282,'Twilight Satyr','Magical',NULL,NULL,NULL),(285,'Undead Pirate','Elemental',NULL,NULL,NULL),(287,'Silverback Gorilla','Elemental',NULL,NULL,NULL),(290,'Illusionary Trickster','Beast',NULL,NULL,NULL),(292,'Crystal Gargoyle','Magical',NULL,NULL,NULL),(294,'Radiant Valkyrie','Humanoid',NULL,NULL,NULL),(295,'Blazing Phoenix','Demon',NULL,NULL,NULL),(296,'Necrotic Lich','Beast',NULL,NULL,NULL),(297,'Undead Pirate','Humanoid',NULL,NULL,NULL),(299,'Alpha Wolf','Construct',NULL,NULL,NULL),(301,'Cursed Mummy','Undead',NULL,NULL,NULL),(303,'Spiked Behemoth','Beast',NULL,NULL,NULL),(305,'Bloodthirsty Mermaid','Giant',NULL,NULL,NULL),(307,'Mystic Djinn','Dragon',NULL,NULL,NULL),(310,'Cybernetic Scorpion','Giant',NULL,NULL,NULL),(313,'Cyclops Brute','Magical',NULL,NULL,NULL),(315,'Glacial Kraken','Swarm',NULL,NULL,NULL),(316,'Griffon King','Giant',NULL,NULL,NULL),(317,'Crystal Dragon','Dragon',NULL,NULL,NULL),(318,'Frostbite Scorpion','Beast',NULL,NULL,NULL),(320,'Crimson Rogue','Humanoid',NULL,NULL,NULL),(321,'Death Reaper','Elemental',NULL,NULL,NULL),(324,'Magma Serpent','Magical',NULL,NULL,NULL),(327,'Abyssal Fiend','Beast',NULL,NULL,NULL),(328,'Crimson Rogue','Construct',NULL,NULL,NULL),(331,'Royal Griffin','Demon',NULL,NULL,NULL),(334,'Venomous Serpent','Undead',NULL,NULL,NULL),(335,'Forest Spirit','Beast',NULL,NULL,NULL),(336,'Ancient Wyrm','Humanoid',NULL,NULL,NULL),(337,'Twisted Dryad','Elemental',NULL,NULL,NULL),(339,'Skeletal Mage','Undead',NULL,NULL,NULL),(342,'Royal Griffin','Undead',NULL,NULL,NULL),(343,'Voracious Goblin','Swarm',NULL,NULL,NULL),(344,'Bloodthirsty Minotaur','Undead',NULL,NULL,NULL),(346,'Cybernetic Scorpion','Magical',NULL,NULL,NULL),(347,'Bloodthirsty Minotaur','Elemental',NULL,NULL,NULL),(348,'Warrior Orc','Undead',NULL,NULL,NULL),(351,'Vampire Lord','Magical',NULL,NULL,NULL),(353,'Armored Basilisk','Humanoid',NULL,NULL,NULL),(356,'Voracious Goblin','Humanoid',NULL,NULL,NULL),(357,'Thunderhawk','Dragon',NULL,NULL,NULL),(359,'Ice Elemental','Humanoid',NULL,NULL,NULL),(361,'Flamekeeper Elemental','Construct',NULL,NULL,NULL),(363,'Spiked Behemoth','Elemental',NULL,NULL,NULL),(366,'Bloodthirsty Minotaur','Elemental',NULL,NULL,NULL),(368,'Murderous Wendigo','Magical',NULL,NULL,NULL),(371,'Shadow Stalker','Magical',NULL,NULL,NULL),(372,'Venomous Serpent','Humanoid',NULL,NULL,NULL),(375,'Time-Weaver','Flora',NULL,NULL,NULL),(378,'Shadow Stalker','Humanoid',NULL,NULL,NULL),(381,'Fire Imp','Undead',NULL,NULL,NULL),(384,'Cave Spider','Beast',NULL,NULL,NULL),(385,'Spiked Behemoth','Magical',NULL,NULL,NULL),(387,'Clockwork Guardian','Beast',NULL,NULL,NULL),(388,'Phantom Banshee','Beast',NULL,NULL,NULL);
/*!40000 ALTER TABLE `enemy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `date` date DEFAULT NULL,
  `quest` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `questId` (`quest`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`quest`) REFERENCES `quest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Darkness in Highfell',NULL,NULL,NULL),(4,'Slaying of the Ice Queen',NULL,NULL,NULL),(7,'Battle of the Whispering Woods',NULL,NULL,NULL),(8,'Raven\'s Eclipse',NULL,NULL,NULL),(10,'The Scarlet Eclipse',NULL,NULL,NULL),(13,'Quest for the Eternal Flame',NULL,NULL,NULL),(15,'Dance of the Moonshadow',NULL,NULL,NULL),(16,'Darkness Over Whitestone',NULL,NULL,NULL),(19,'Trials of the Ghost King',NULL,NULL,NULL),(20,'The Cataclysm of Ironspire',NULL,NULL,NULL),(22,'Assault on the Abyss',NULL,NULL,NULL),(25,'Curse of the Phantom Queen',NULL,NULL,NULL),(28,'Cursed Souls\' Nightfall',NULL,NULL,NULL),(29,'Curse of the Phantom Queen',NULL,NULL,NULL),(31,'Darkness Over Whitestone',NULL,NULL,NULL),(32,'Trials of the Ghost King',NULL,NULL,NULL),(34,'Escape from Shadow Hold',NULL,NULL,NULL),(37,'Odyssey of the Stormcaller',NULL,NULL,NULL),(40,'Invasion of the Frost Giants',NULL,NULL,NULL),(43,'Feast of the Harvest Moon',NULL,NULL,NULL),(44,'The Fall of Skyspire',NULL,NULL,NULL),(45,'Assault on the Abyss',NULL,NULL,NULL),(47,'Warsong\'s End',NULL,NULL,NULL),(48,'Crusade of the Sun Chalice',NULL,NULL,NULL),(51,'The Reckoning of Lighthaven',NULL,NULL,NULL),(52,'Feast of the Harvest Moon',NULL,NULL,NULL),(54,'Odyssey of the Stormcaller',NULL,NULL,NULL),(55,'Assault on the Abyss',NULL,NULL,NULL),(56,'Dance of the Moonshadow',NULL,NULL,NULL),(59,'Storm of the Dead',NULL,NULL,NULL),(60,'Chronicle of the Sealed Gods',NULL,NULL,NULL),(61,'The Cataclysm of Ironspire',NULL,NULL,NULL),(63,'Invasion of the Frost Giants',NULL,NULL,NULL),(66,'Festival of Golden Leaves',NULL,NULL,NULL),(68,'Riddle of the Ancient Sphinx',NULL,NULL,NULL),(70,'Riddle of the Ancient Sphinx',NULL,NULL,NULL),(73,'Fireheart\'s Revenge',NULL,NULL,NULL),(75,'Riddle of the Ancient Sphinx',NULL,NULL,NULL),(78,'Blood Moon Rising',NULL,NULL,NULL),(80,'Festival of Golden Leaves',NULL,NULL,NULL),(82,'Riddle of the Ancient Sphinx',NULL,NULL,NULL),(84,'Riddle of the Ancient Sphinx',NULL,NULL,NULL),(85,'The Cataclysm of Ironspire',NULL,NULL,NULL),(86,'Spectral Masquerade',NULL,NULL,NULL),(87,'Timeless Enigma',NULL,NULL,NULL),(89,'Assault on the Abyss',NULL,NULL,NULL),(92,'Serpent\'s Ascension',NULL,NULL,NULL),(94,'Feast of the Harvest Moon',NULL,NULL,NULL),(97,'Spectral Masquerade',NULL,NULL,NULL),(98,'Assault on the Abyss',NULL,NULL,NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild`
--

DROP TABLE IF EXISTS `guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `type` varchar(50) DEFAULT NULL,
  `player` int DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `characterId` (`player`),
  CONSTRAINT `guild_ibfk_1` FOREIGN KEY (`player`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild`
--

LOCK TABLES `guild` WRITE;
/*!40000 ALTER TABLE `guild` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `value` double DEFAULT NULL,
  `rarity` char(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (3,'Quiver of the Wind',NULL,NULL,NULL),(6,'Ring of Arcane Mastery',NULL,NULL,NULL),(7,'Veil of the Tempest',NULL,NULL,NULL),(9,'Stoneforged Mace',NULL,NULL,NULL),(10,'Boots of Celestial Steps',NULL,NULL,NULL),(12,'Gloves of the Sun God',NULL,NULL,NULL),(13,'Amulet of the Fallen King',NULL,NULL,NULL),(14,'Scroll of Forgotten Knowledge',NULL,NULL,NULL),(16,'Thunderstrike Axe',NULL,NULL,NULL),(18,'Robes of the Archmage',NULL,NULL,NULL),(19,'Thunderstrike Axe',NULL,NULL,NULL),(22,'Boots of the Pathfinder',NULL,NULL,NULL),(25,'Serpent\'s Fang Saber',NULL,NULL,NULL),(26,'Enchanted Waterskin',NULL,NULL,NULL),(27,'Bow of the Eternal Forest',NULL,NULL,NULL),(30,'Shield of the Dwarven Lords',NULL,NULL,NULL),(32,'Rod of Wondrous Echoes',NULL,NULL,NULL),(34,'Thunderstrike Axe',NULL,NULL,NULL),(35,'Grimoire of Lost Souls',NULL,NULL,NULL),(38,'Blood-soaked Bracers',NULL,NULL,NULL),(41,'Essence of the Wild',NULL,NULL,NULL),(42,'Helm of Insight',NULL,NULL,NULL),(44,'Lockpick of Fates',NULL,NULL,NULL),(45,'Serpent\'s Fang Saber',NULL,NULL,NULL),(47,'Warrior\'s Battleaxe',NULL,NULL,NULL),(50,'Windfury Longsword',NULL,NULL,NULL),(53,'Goblin-made Flail',NULL,NULL,NULL),(55,'Amulet of the Stars',NULL,NULL,NULL),(56,'Flask of Infinite Courage',NULL,NULL,NULL),(57,'Thunderstrike Javelins',NULL,NULL,NULL),(58,'Amethyst Soul Amulet',NULL,NULL,NULL),(61,'Tome of Elemental Secrets',NULL,NULL,NULL),(62,'Greatsword of Heavenly Wrath',NULL,NULL,NULL),(64,'Axe of the Moon Chieftain',NULL,NULL,NULL),(67,'Dragonbone Greataxe',NULL,NULL,NULL),(70,'Dagger of Betrayal',NULL,NULL,NULL),(72,'Blood-soaked Bracers',NULL,NULL,NULL),(75,'Blood-soaked Bracers',NULL,NULL,NULL),(78,'Dagger of the Trickster',NULL,NULL,NULL),(79,'Bow of the Eternal Forest',NULL,NULL,NULL),(82,'Boots of Celestial Steps',NULL,NULL,NULL),(84,'Wyrm\'s Breath Wand',NULL,NULL,NULL),(85,'Vial of Healing Winds',NULL,NULL,NULL),(87,'Golden Chalice of Eternity',NULL,NULL,NULL),(88,'Amulet of the Fallen Queen',NULL,NULL,NULL),(91,'Veil of the Tempest',NULL,NULL,NULL),(93,'Lunar Tear Bracelet',NULL,NULL,NULL),(94,'Lockpick of Fates',NULL,NULL,NULL),(97,'Armbands of Resilience',NULL,NULL,NULL),(100,'Blade of the Archmage',NULL,NULL,NULL),(102,'Tome of Elemental Secrets',NULL,NULL,NULL),(105,'Heartstone Amulet',NULL,NULL,NULL),(107,'Chronomancer\'s Sandglass',NULL,NULL,NULL),(109,'Thunderstrike Javelins',NULL,NULL,NULL),(110,'Frostfire Staff',NULL,NULL,NULL),(112,'Blade of Eternal Night',NULL,NULL,NULL),(113,'Chronomancer\'s Sandglass',NULL,NULL,NULL),(114,'Serpent\'s Fang Saber',NULL,NULL,NULL),(115,'Cloak of Shadows',NULL,NULL,NULL),(116,'Cloak of Elvenkind',NULL,NULL,NULL),(118,'Gauntlets of the Titan',NULL,NULL,NULL),(119,'Runic Vestments',NULL,NULL,NULL),(121,'Bracelet of Divine Fates',NULL,NULL,NULL),(123,'Golden Chalice of Eternity',NULL,NULL,NULL),(125,'Spectral Chainmail',NULL,NULL,NULL),(128,'Scroll of Forgotten Knowledge',NULL,NULL,NULL),(131,'Wand of Time',NULL,NULL,NULL),(133,'Quicksilver Bullets',NULL,NULL,NULL),(134,'Emerald Heart Ring',NULL,NULL,NULL),(135,'Harvest Moon Scepter',NULL,NULL,NULL),(137,'Serpent\'s Fang Saber',NULL,NULL,NULL),(140,'Cursed Bone Necklace',NULL,NULL,NULL),(141,'Scroll of the Phoenix',NULL,NULL,NULL),(144,'Vial of Healing Winds',NULL,NULL,NULL),(145,'Flask of Infinite Courage',NULL,NULL,NULL),(147,'Bread of the Wise',NULL,NULL,NULL),(148,'Gloves of the Sun God',NULL,NULL,NULL),(149,'Venomtouch Whip',NULL,NULL,NULL),(151,'Ring of the Moon',NULL,NULL,NULL),(153,'Sacred Feather Talisman',NULL,NULL,NULL),(156,'Venomtouch Whip',NULL,NULL,NULL),(157,'Boots of Swiftness',NULL,NULL,NULL),(158,'Warhammer of the Earthshaker',NULL,NULL,NULL),(160,'Essence of the Wild',NULL,NULL,NULL),(162,'Emerald Saber of Souls',NULL,NULL,NULL),(165,'Cloak of Shadows',NULL,NULL,NULL),(168,'Amethyst Soul Amulet',NULL,NULL,NULL),(169,'Ring of the Fallen King',NULL,NULL,NULL),(170,'Staff of Eldritch Power',NULL,NULL,NULL),(172,'Ring of Arcane Mastery',NULL,NULL,NULL),(174,'Veil of the Tempest',NULL,NULL,NULL),(177,'Cloak of Elvenkind',NULL,NULL,NULL),(178,'Crown of the Lost King',NULL,NULL,NULL),(179,'Potion of Dire Strength',NULL,NULL,NULL),(182,'Robes of the Archmage',NULL,NULL,NULL),(184,'Spectral Chainmail',NULL,NULL,NULL),(186,'Harvest Moon Scepter',NULL,NULL,NULL),(189,'Ring of the Fallen',NULL,NULL,NULL),(191,'Thunderstrike Javelins',NULL,NULL,NULL),(192,'Belt of the Wyrm',NULL,NULL,NULL),(193,'Harvest Moon Scepter',NULL,NULL,NULL),(196,'Staff of Tranquility',NULL,NULL,NULL),(198,'Goblin-made Flail',NULL,NULL,NULL),(199,'Sunfire Cape',NULL,NULL,NULL),(200,'Potion of Dire Strength',NULL,NULL,NULL),(202,'Helm of Insight',NULL,NULL,NULL),(203,'Tome of the Elders',NULL,NULL,NULL),(204,'Crystal of the Ancients',NULL,NULL,NULL),(207,'Belt of the Wyrm',NULL,NULL,NULL),(210,'Cloak of Elvenkind',NULL,NULL,NULL),(212,'Gloves of the Sun God',NULL,NULL,NULL),(214,'Boots of the Pathfinder',NULL,NULL,NULL),(216,'Belt of the Wyrm',NULL,NULL,NULL),(217,'Grimoire of Lost Souls',NULL,NULL,NULL),(218,'Potion of Mana Regeneration',NULL,NULL,NULL),(220,'Dragon\'s Breath Bow',NULL,NULL,NULL),(221,'Amethyst Soul Amulet',NULL,NULL,NULL),(222,'Blade of the Fallen',NULL,NULL,NULL),(225,'Guardian\'s Shield',NULL,NULL,NULL),(226,'Ring of the Fallen King',NULL,NULL,NULL),(228,'Rune-etched Crossbow',NULL,NULL,NULL),(229,'Mystic Lightshield',NULL,NULL,NULL),(231,'Bracelet of Divine Fates',NULL,NULL,NULL),(233,'Maul of the Frost Giant',NULL,NULL,NULL),(236,'Orb of Chaos',NULL,NULL,NULL),(238,'Gloves of the Sun God',NULL,NULL,NULL),(241,'Flask of Infinite Courage',NULL,NULL,NULL),(243,'Essence of the Wild',NULL,NULL,NULL),(245,'Gauntlets of the Berserker',NULL,NULL,NULL),(248,'Rod of Wondrous Echoes',NULL,NULL,NULL),(250,'Warhammer of the Earthshaker',NULL,NULL,NULL),(252,'Cloak of Elvenkind',NULL,NULL,NULL),(253,'Guardian\'s Shield',NULL,NULL,NULL),(256,'Mystic Lightshield',NULL,NULL,NULL),(259,'Crown of the Lost King',NULL,NULL,NULL),(261,'Runic Vestments',NULL,NULL,NULL),(262,'Mystic Lightshield',NULL,NULL,NULL),(263,'Aegis of the Sun',NULL,NULL,NULL),(264,'Windfury Longsword',NULL,NULL,NULL),(266,'Gauntlets of the Berserker',NULL,NULL,NULL),(267,'Gauntlets of the Titan',NULL,NULL,NULL),(268,'Ring of Arcane Mastery',NULL,NULL,NULL),(269,'Flask of Infinite Courage',NULL,NULL,NULL),(270,'Armbands of Resilience',NULL,NULL,NULL),(271,'Sword of the Paladin',NULL,NULL,NULL),(272,'Greaves of the Vanguard',NULL,NULL,NULL),(275,'Belt of the Wyrm',NULL,NULL,NULL),(277,'Serpent\'s Fang Saber',NULL,NULL,NULL),(278,'Gauntlets of the Titan',NULL,NULL,NULL),(281,'Thunderstrike Javelins',NULL,NULL,NULL),(283,'Cloak of Shadows',NULL,NULL,NULL),(284,'Stormbringer Blade',NULL,NULL,NULL),(287,'Potion of Dire Strength',NULL,NULL,NULL),(288,'Amulet of the Fallen Queen',NULL,NULL,NULL),(291,'Mystic Lightshield',NULL,NULL,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kingdom`
--

DROP TABLE IF EXISTS `kingdom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kingdom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `map` int DEFAULT NULL,
  `npc` int DEFAULT NULL,
  `law` int unsigned DEFAULT NULL,
  `quest` int DEFAULT NULL,
  `enemy` int DEFAULT NULL,
  `item` int DEFAULT NULL,
  `economy` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `map` (`map`),
  KEY `npc` (`npc`),
  KEY `law` (`law`),
  KEY `enemy` (`enemy`),
  KEY `item` (`item`),
  KEY `kingdom_ibfk_6` (`quest`),
  KEY `kingdom_ibfk_7` (`economy`),
  CONSTRAINT `kingdom_ibfk_1` FOREIGN KEY (`map`) REFERENCES `map` (`id`),
  CONSTRAINT `kingdom_ibfk_2` FOREIGN KEY (`npc`) REFERENCES `npc` (`id`),
  CONSTRAINT `kingdom_ibfk_3` FOREIGN KEY (`law`) REFERENCES `law` (`id`),
  CONSTRAINT `kingdom_ibfk_4` FOREIGN KEY (`enemy`) REFERENCES `enemy` (`id`),
  CONSTRAINT `kingdom_ibfk_5` FOREIGN KEY (`item`) REFERENCES `item` (`id`),
  CONSTRAINT `kingdom_ibfk_6` FOREIGN KEY (`quest`) REFERENCES `quest` (`id`),
  CONSTRAINT `kingdom_ibfk_7` FOREIGN KEY (`economy`) REFERENCES `economy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kingdom`
--

LOCK TABLES `kingdom` WRITE;
/*!40000 ALTER TABLE `kingdom` DISABLE KEYS */;
/*!40000 ALTER TABLE `kingdom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `law`
--

DROP TABLE IF EXISTS `law`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `law` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `law`
--

LOCK TABLES `law` WRITE;
/*!40000 ALTER TABLE `law` DISABLE KEYS */;
/*!40000 ALTER TABLE `law` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone`
--

DROP TABLE IF EXISTS `milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestone` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone`
--

LOCK TABLES `milestone` WRITE;
/*!40000 ALTER TABLE `milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc`
--

DROP TABLE IF EXISTS `npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `race` int DEFAULT NULL,
  `dialogue` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `npc_ibfk_1` (`race`),
  KEY `npc_ibfk_2` (`dialogue`),
  CONSTRAINT `npc_ibfk_1` FOREIGN KEY (`race`) REFERENCES `race` (`id`),
  CONSTRAINT `npc_ibfk_2` FOREIGN KEY (`dialogue`) REFERENCES `dialogue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npc`
--

LOCK TABLES `npc` WRITE;
/*!40000 ALTER TABLE `npc` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `character` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CharacterID` (`character`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`character`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest`
--

DROP TABLE IF EXISTS `quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `description` text,
  `reward` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `type` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reward` (`reward`),
  CONSTRAINT `quest_ibfk_1` FOREIGN KEY (`reward`) REFERENCES `reward` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest`
--

LOCK TABLES `quest` WRITE;
/*!40000 ALTER TABLE `quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `properties` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward`
--

DROP TABLE IF EXISTS `reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` char(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward`
--

LOCK TABLES `reward` WRITE;
/*!40000 ALTER TABLE `reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `property` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_dashboard`
--

DROP TABLE IF EXISTS `skill_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_dashboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `skill` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `skill` (`skill`),
  CONSTRAINT `skill_dashboard_ibfk_1` FOREIGN KEY (`skill`) REFERENCES `skill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_dashboard`
--

LOCK TABLES `skill_dashboard` WRITE;
/*!40000 ALTER TABLE `skill_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `number_of_players` int DEFAULT NULL,
  `team_roles` char(50) DEFAULT NULL,
  `bonus_reward` varchar(255) DEFAULT NULL,
  `player` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `playerId` (`player`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`player`) REFERENCES `player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Thunderbolts',670,NULL,NULL,NULL),(2,'ElementalFury',373,NULL,NULL,NULL),(4,'Frost_Wolves',492,NULL,NULL,NULL),(7,'CelestialKnights',814,NULL,NULL,NULL),(10,'Ruby_Wizards',278,NULL,NULL,NULL),(12,'Unseen_Rogues',633,NULL,NULL,NULL),(15,'Sky_Kings',72,NULL,NULL,NULL),(18,'DuskRaiders',453,NULL,NULL,NULL),(20,'WarriorAngels',7,NULL,NULL,NULL),(21,'Star_Wanderers',549,NULL,NULL,NULL),(24,'Cobalt_Crusaders',7,NULL,NULL,NULL),(25,'Venom_Serpents',453,NULL,NULL,NULL),(26,'Stone_Giants',881,NULL,NULL,NULL),(27,'Venom_Serpents',433,NULL,NULL,NULL),(30,'Spirit_Seekers',636,NULL,NULL,NULL),(32,'Venom_Serpents',677,NULL,NULL,NULL),(34,'FrostGuardians',265,NULL,NULL,NULL),(37,'Rune_Masters',648,NULL,NULL,NULL),(40,'Rogue_Wraiths',318,NULL,NULL,NULL),(41,'Amber_Wizards',797,NULL,NULL,NULL),(44,'Shadow_Assassins',681,NULL,NULL,NULL),(45,'DuskRaiders',537,NULL,NULL,NULL),(48,'BladeMasters',922,NULL,NULL,NULL),(50,'Jade_Tigers',506,NULL,NULL,NULL),(52,'Lunar_Army',429,NULL,NULL,NULL),(55,'Topaz_Templars',49,NULL,NULL,NULL),(57,'Chaos_Bringers',691,NULL,NULL,NULL),(59,'Astral_Crusaders',875,NULL,NULL,NULL),(61,'Void_Walkers',425,NULL,NULL,NULL),(64,'Sapphire_Sorcerers',120,NULL,NULL,NULL),(66,'Indigo_Invaders',98,NULL,NULL,NULL),(69,'Cobalt_Crusaders',899,NULL,NULL,NULL),(70,'Silver_Falcons',138,NULL,NULL,NULL),(73,'Solar_Sentinels',781,NULL,NULL,NULL),(75,'Dusk_Rebels',989,NULL,NULL,NULL),(78,'Cosmic_Paladins',650,NULL,NULL,NULL),(79,'Stone_Giants',200,NULL,NULL,NULL),(81,'Holy_Shamans',342,NULL,NULL,NULL),(83,'Dark_Crusaders',521,NULL,NULL,NULL),(85,'ThunderClan',454,NULL,NULL,NULL),(88,'Abyss_Watchers',20,NULL,NULL,NULL),(91,'Dream_Weavers',406,NULL,NULL,NULL),(93,'Ruby_Wizards',510,NULL,NULL,NULL),(95,'Frost_Wolves',626,NULL,NULL,NULL),(98,'Radiant_Healers',365,NULL,NULL,NULL),(100,'Solar_Sentinels',496,NULL,NULL,NULL),(103,'AstralWanderers',935,NULL,NULL,NULL),(104,'FrostGuardians',159,NULL,NULL,NULL),(105,'PhoenixRising',477,NULL,NULL,NULL),(107,'Scarlet_Scouts',4,NULL,NULL,NULL),(110,'VampireSlayers',566,NULL,NULL,NULL),(111,'Warden_of_Will',615,NULL,NULL,NULL),(112,'Blade_Riders',73,NULL,NULL,NULL),(115,'Warden_of_Will',992,NULL,NULL,NULL),(118,'Phoenix_Squad',545,NULL,NULL,NULL),(121,'Sapphire_Sorcerers',601,NULL,NULL,NULL),(122,'Ethereal_Sages',163,NULL,NULL,NULL),(125,'Demon_Hunters',205,NULL,NULL,NULL),(127,'Elemental_Force',918,NULL,NULL,NULL),(130,'RavenWings',337,NULL,NULL,NULL),(133,'CosmicVoyagers',183,NULL,NULL,NULL),(136,'Blade_Riders',696,NULL,NULL,NULL),(138,'Crystal_Clerics',480,NULL,NULL,NULL),(140,'Time_Travelers',435,NULL,NULL,NULL),(142,'LunarEclipsers',799,NULL,NULL,NULL),(145,'Holy_Shamans',812,NULL,NULL,NULL),(147,'Dragon_Tamers',195,NULL,NULL,NULL),(148,'Grim_Reapers',628,NULL,NULL,NULL),(150,'RavenWings',977,NULL,NULL,NULL),(151,'NebulaSeekers',489,NULL,NULL,NULL),(154,'Soul_Reapers',69,NULL,NULL,NULL),(156,'Rune_Masters',984,NULL,NULL,NULL),(157,'CosmicVoyagers',151,NULL,NULL,NULL),(158,'Solar_Sentinels',785,NULL,NULL,NULL),(160,'Eclipse_Archers',244,NULL,NULL,NULL),(162,'SoulHarvesters',216,NULL,NULL,NULL),(165,'Jade_Judges',263,NULL,NULL,NULL),(167,'SoulHarvesters',412,NULL,NULL,NULL),(168,'Celestial_Warriors',930,NULL,NULL,NULL),(170,'Sapphire_Sorcerers',709,NULL,NULL,NULL),(172,'Shadow_Assassins',85,NULL,NULL,NULL),(174,'Demon_Hunters',980,NULL,NULL,NULL),(177,'WarriorAngels',493,NULL,NULL,NULL),(179,'Night_Owls',981,NULL,NULL,NULL),(180,'Azure_Avatars',791,NULL,NULL,NULL),(183,'Holy_Shamans',427,NULL,NULL,NULL),(184,'Spirit_Seekers',39,NULL,NULL,NULL),(185,'Warden_of_Will',267,NULL,NULL,NULL),(188,'Scarlet_Scouts',48,NULL,NULL,NULL),(190,'Blade_Riders',891,NULL,NULL,NULL),(193,'Rune_Masters',489,NULL,NULL,NULL),(195,'Thunderbolts',166,NULL,NULL,NULL),(196,'ValkyrieStorm',743,NULL,NULL,NULL),(198,'Cosmic_Paladins',44,NULL,NULL,NULL),(201,'Cobalt_Crusaders',808,NULL,NULL,NULL),(204,'Time_Travelers',313,NULL,NULL,NULL),(207,'Radiant_Healers',941,NULL,NULL,NULL),(210,'Grim_Reapers',159,NULL,NULL,NULL),(211,'Dream_Weavers',240,NULL,NULL,NULL),(214,'Indigo_Invaders',671,NULL,NULL,NULL),(216,'Oblivion_Dwellers',661,NULL,NULL,NULL),(219,'Azure_Avatars',169,NULL,NULL,NULL),(222,'Dragon_Tamers',832,NULL,NULL,NULL),(224,'Jade_Tigers',655,NULL,NULL,NULL),(226,'Crimson_Brigade',191,NULL,NULL,NULL),(229,'Eclipse_Archers',281,NULL,NULL,NULL),(232,'Violet_Viceroys',334,NULL,NULL,NULL),(234,'WarriorAngels',35,NULL,NULL,NULL),(235,'Templar_Order',882,NULL,NULL,NULL),(237,'Solar_Sentinels',84,NULL,NULL,NULL),(240,'Jade_Judges',679,NULL,NULL,NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-27 16:22:09
