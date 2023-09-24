-- MySQL dump 10.13  Distrib 8.1.0, for macos13.3 (arm64)
--
-- Host: localhost    Database: MysticQuestDB
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `Achievement`
--

DROP TABLE IF EXISTS `Achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Achievement` (
  `AchievementId` int NOT NULL AUTO_INCREMENT,
  `requirements` varchar(256) DEFAULT NULL,
  `event` int DEFAULT NULL,
  PRIMARY KEY (`AchievementId`),
  KEY `event` (`event`),
  CONSTRAINT `achievement_ibfk_1` FOREIGN KEY (`event`) REFERENCES `Event` (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Achievement`
--

LOCK TABLES `Achievement` WRITE;
/*!40000 ALTER TABLE `Achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Analytics_Dashboard`
--

DROP TABLE IF EXISTS `Analytics_Dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Analytics_Dashboard` (
  `analyticsDashboardId` int NOT NULL AUTO_INCREMENT,
  `character` int DEFAULT NULL,
  `player` int DEFAULT NULL,
  `performance` int DEFAULT NULL,
  `gameTime` time DEFAULT NULL,
  `achievements` int DEFAULT NULL,
  `communityLeaderBoard` text,
  `milestone` int unsigned DEFAULT NULL,
  PRIMARY KEY (`analyticsDashboardId`),
  KEY `character` (`character`),
  KEY `player` (`player`),
  KEY `achievements` (`achievements`),
  KEY `milestone` (`milestone`),
  CONSTRAINT `analytics_dashboard_ibfk_1` FOREIGN KEY (`character`) REFERENCES `Character` (`characterId`),
  CONSTRAINT `analytics_dashboard_ibfk_2` FOREIGN KEY (`player`) REFERENCES `Player` (`PlayerID`),
  CONSTRAINT `analytics_dashboard_ibfk_3` FOREIGN KEY (`achievements`) REFERENCES `Achievement` (`AchievementId`),
  CONSTRAINT `analytics_dashboard_ibfk_4` FOREIGN KEY (`milestone`) REFERENCES `Milestone` (`milestoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Analytics_Dashboard`
--

LOCK TABLES `Analytics_Dashboard` WRITE;
/*!40000 ALTER TABLE `Analytics_Dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `Analytics_Dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Avatar`
--

DROP TABLE IF EXISTS `Avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Avatar` (
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
  KEY `race` (`race`),
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`outfit`) REFERENCES `Items` (`itemId`),
  CONSTRAINT `avatar_ibfk_2` FOREIGN KEY (`cosmetics`) REFERENCES `Items` (`itemId`),
  CONSTRAINT `avatar_ibfk_3` FOREIGN KEY (`weaponSkin`) REFERENCES `Items` (`itemId`),
  CONSTRAINT `avatar_ibfk_4` FOREIGN KEY (`emotes`) REFERENCES `Items` (`itemId`),
  CONSTRAINT `avatar_ibfk_5` FOREIGN KEY (`race`) REFERENCES `Race` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Avatar`
--

LOCK TABLES `Avatar` WRITE;
/*!40000 ALTER TABLE `Avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Character`
--

DROP TABLE IF EXISTS `Character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Character` (
  `characterId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `player` int DEFAULT NULL,
  `startingRegion` int DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `skill_dashboard` int DEFAULT NULL,
  `avatar` int DEFAULT NULL,
  PRIMARY KEY (`characterId`),
  KEY `player` (`player`),
  KEY `startingRegion` (`startingRegion`),
  KEY `class` (`class`),
  KEY `skill_dashboard` (`skill_dashboard`),
  KEY `avatar` (`avatar`),
  CONSTRAINT `character_ibfk_1` FOREIGN KEY (`player`) REFERENCES `Player` (`PlayerID`),
  CONSTRAINT `character_ibfk_2` FOREIGN KEY (`startingRegion`) REFERENCES `Kingdom` (`kingdomId`),
  CONSTRAINT `character_ibfk_3` FOREIGN KEY (`class`) REFERENCES `Class` (`className`),
  CONSTRAINT `character_ibfk_4` FOREIGN KEY (`skill_dashboard`) REFERENCES `Skill_Dashboard` (`boardId`),
  CONSTRAINT `character_ibfk_5` FOREIGN KEY (`avatar`) REFERENCES `Avatar` (`avatarId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Character`
--

LOCK TABLES `Character` WRITE;
/*!40000 ALTER TABLE `Character` DISABLE KEYS */;
/*!40000 ALTER TABLE `Character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class`
--

DROP TABLE IF EXISTS `Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Class` (
  `className` varchar(20) NOT NULL,
  `proberties` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`className`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class`
--

LOCK TABLES `Class` WRITE;
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Combat`
--

DROP TABLE IF EXISTS `Combat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Combat` (
  `combatId` int NOT NULL AUTO_INCREMENT,
  `player` int DEFAULT NULL,
  `moves` varchar(20) DEFAULT NULL,
  `turn` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `enemy` int DEFAULT NULL,
  `time_stemp` date DEFAULT NULL,
  PRIMARY KEY (`combatId`),
  KEY `player` (`player`),
  KEY `enemy` (`enemy`),
  CONSTRAINT `combat_ibfk_1` FOREIGN KEY (`player`) REFERENCES `Player` (`PlayerID`),
  CONSTRAINT `combat_ibfk_2` FOREIGN KEY (`enemy`) REFERENCES `Enemies` (`enemie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Combat`
--

LOCK TABLES `Combat` WRITE;
/*!40000 ALTER TABLE `Combat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Combat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Crafting`
--

DROP TABLE IF EXISTS `Crafting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Crafting` (
  `blueprint` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `item` int unsigned DEFAULT NULL,
  PRIMARY KEY (`blueprint`),
  KEY `item` (`item`),
  CONSTRAINT `crafting_ibfk_1` FOREIGN KEY (`item`) REFERENCES `Items` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Crafting`
--

LOCK TABLES `Crafting` WRITE;
/*!40000 ALTER TABLE `Crafting` DISABLE KEYS */;
/*!40000 ALTER TABLE `Crafting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Economy`
--

DROP TABLE IF EXISTS `Economy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Economy` (
  `economyId` int unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) NOT NULL,
  PRIMARY KEY (`economyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Economy`
--

LOCK TABLES `Economy` WRITE;
/*!40000 ALTER TABLE `Economy` DISABLE KEYS */;
/*!40000 ALTER TABLE `Economy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enemies`
--

DROP TABLE IF EXISTS `Enemies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Enemies` (
  `enemie_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `reward` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`enemie_id`),
  CONSTRAINT `enemies_ibfk_1` FOREIGN KEY (`enemie_id`) REFERENCES `Reward` (`rewardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enemies`
--

LOCK TABLES `Enemies` WRITE;
/*!40000 ALTER TABLE `Enemies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Enemies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event` (
  `eventId` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `date` date DEFAULT NULL,
  `questId` int NOT NULL,
  `description` text,
  PRIMARY KEY (`eventId`),
  KEY `questId` (`questId`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`questId`) REFERENCES `Quest` (`questId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild`
--

DROP TABLE IF EXISTS `guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild` (
  `guildId` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `type` varchar(50) DEFAULT NULL,
  `characterId` int DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `characterId` (`characterId`),
  CONSTRAINT `guild_ibfk_1` FOREIGN KEY (`characterId`) REFERENCES `Character` (`CharacterID`)
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
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items` (
  `itemId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `value` double NOT NULL,
  `rarity` char(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kingdom`
--

DROP TABLE IF EXISTS `Kingdom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kingdom` (
  `kingdomId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `map` int DEFAULT NULL,
  `npc` int DEFAULT NULL,
  `law` int unsigned DEFAULT NULL,
  `quest` int DEFAULT NULL,
  `enemy` int DEFAULT NULL,
  `item` int DEFAULT NULL,
  PRIMARY KEY (`kingdomId`),
  UNIQUE KEY `name` (`name`),
  KEY `map` (`map`),
  KEY `npc` (`npc`),
  KEY `law` (`law`),
  KEY `enemy` (`enemy`),
  KEY `item` (`item`),
  CONSTRAINT `kingdom_ibfk_1` FOREIGN KEY (`map`) REFERENCES `Map` (`mapId`),
  CONSTRAINT `kingdom_ibfk_2` FOREIGN KEY (`npc`) REFERENCES `NPC` (`NPC_id`),
  CONSTRAINT `kingdom_ibfk_3` FOREIGN KEY (`law`) REFERENCES `Law` (`lawId`),
  CONSTRAINT `kingdom_ibfk_4` FOREIGN KEY (`enemy`) REFERENCES `Enemies` (`enemie_id`),
  CONSTRAINT `kingdom_ibfk_5` FOREIGN KEY (`item`) REFERENCES `Item` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kingdom`
--

LOCK TABLES `Kingdom` WRITE;
/*!40000 ALTER TABLE `Kingdom` DISABLE KEYS */;
/*!40000 ALTER TABLE `Kingdom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Law`
--

DROP TABLE IF EXISTS `Law`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Law` (
  `lawId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`lawId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Law`
--

LOCK TABLES `Law` WRITE;
/*!40000 ALTER TABLE `Law` DISABLE KEYS */;
/*!40000 ALTER TABLE `Law` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Map`
--

DROP TABLE IF EXISTS `Map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Map` (
  `mapId` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`mapId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Map`
--

LOCK TABLES `Map` WRITE;
/*!40000 ALTER TABLE `Map` DISABLE KEYS */;
/*!40000 ALTER TABLE `Map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Milestone`
--

DROP TABLE IF EXISTS `Milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Milestone` (
  `milestoneId` int unsigned NOT NULL AUTO_INCREMENT,
  `requirements` varchar(255) NOT NULL,
  PRIMARY KEY (`milestoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Milestone`
--

LOCK TABLES `Milestone` WRITE;
/*!40000 ALTER TABLE `Milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NPC`
--

DROP TABLE IF EXISTS `NPC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NPC` (
  `NPC_id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `level` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NPC_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NPC`
--

LOCK TABLES `NPC` WRITE;
/*!40000 ALTER TABLE `NPC` DISABLE KEYS */;
/*!40000 ALTER TABLE `NPC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Player` (
  `PlayerID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `PasswordHash` varchar(255) DEFAULT NULL,
  `Salt` varchar(64) DEFAULT NULL,
  `CharacterID` int DEFAULT NULL,
  PRIMARY KEY (`PlayerID`),
  KEY `CharacterID` (`CharacterID`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`CharacterID`) REFERENCES `Character` (`CharacterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Quest`
--

DROP TABLE IF EXISTS `Quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Quest` (
  `questId` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `description` text,
  `reward` int NOT NULL,
  `level` int NOT NULL,
  `type` char(50) DEFAULT NULL,
  PRIMARY KEY (`questId`),
  KEY `reward` (`reward`),
  CONSTRAINT `quest_ibfk_1` FOREIGN KEY (`reward`) REFERENCES `Reward` (`rewardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Quest`
--

LOCK TABLES `Quest` WRITE;
/*!40000 ALTER TABLE `Quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `Quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Race`
--

DROP TABLE IF EXISTS `Race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Race` (
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Race`
--

LOCK TABLES `Race` WRITE;
/*!40000 ALTER TABLE `Race` DISABLE KEYS */;
/*!40000 ALTER TABLE `Race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reward`
--

DROP TABLE IF EXISTS `Reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reward` (
  `rewardId` int NOT NULL AUTO_INCREMENT,
  `type` char(50) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`rewardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reward`
--

LOCK TABLES `Reward` WRITE;
/*!40000 ALTER TABLE `Reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Skill`
--

DROP TABLE IF EXISTS `Skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Skill` (
  `skill_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `property` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Skill`
--

LOCK TABLES `Skill` WRITE;
/*!40000 ALTER TABLE `Skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `Skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Skill_Dashboard`
--

DROP TABLE IF EXISTS `Skill_Dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Skill_Dashboard` (
  `boardId` int NOT NULL AUTO_INCREMENT,
  `skill` int unsigned DEFAULT NULL,
  PRIMARY KEY (`boardId`),
  KEY `skill` (`skill`),
  CONSTRAINT `skill_dashboard_ibfk_1` FOREIGN KEY (`skill`) REFERENCES `Skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Skill_Dashboard`
--

LOCK TABLES `Skill_Dashboard` WRITE;
/*!40000 ALTER TABLE `Skill_Dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `Skill_Dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `teamId` int NOT NULL AUTO_INCREMENT,
  `teamroles` char(50) DEFAULT NULL,
  `numberOfPlayers` int DEFAULT NULL,
  `bonusReward` varchar(255) DEFAULT NULL,
  `playerId` int NOT NULL,
  PRIMARY KEY (`teamId`),
  KEY `playerId` (`playerId`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`playerId`) REFERENCES `Player` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
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

-- Dump completed on 2023-09-24 20:15:30
