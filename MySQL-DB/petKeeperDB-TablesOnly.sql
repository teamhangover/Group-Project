-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: ra1.anystream.eu    Database: DoggyWalker
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` decimal(9,6) NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  `country` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `street_name` varchar(45) NOT NULL,
  `street_number` varchar(45) NOT NULL,
  `postal_code` varchar(45) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `my_user_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `my_user_id` (`my_user_id`),
  CONSTRAINT `FK_ADDRESSES_MY_USERS` FOREIGN KEY (`my_user_id`) REFERENCES `my_users` (`my_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,23.734066,37.988938,'Greece','Athina','Zaimi','23','106 82',10.00,5),(2,23.733751,37.987224,'Greece','Athina','Zaimi','2','106 83',13.00,11),(3,23.734015,37.986875,'Greece','Athina','Stournari','15','106 83',9.00,12),(4,23.734266,37.987156,'Greece','Athina','Navarchou Notara','2','106 83',8.00,13),(5,23.738693,37.984609,'Greece','Athina','Eresou','12','106 80',10.00,14),(6,23.734237,37.987983,'Greece','Athina','Tositsa','12','106 83',12.00,15),(7,23.733204,37.991316,'Greece','Athina','Leof. Alexandras','12','106 82',10.00,19),(8,23.734286,37.987153,'Greece','Athina','Navarchou Notara','2','106 83',17.00,20),(9,23.735094,37.989116,'Greece','Athina','Spirou Trikoupi','45','106 83',10.00,21),(10,23.735015,37.988068,'Greece','Athina','Tositsa','13','106 83',11.00,22),(11,23.735362,37.986840,'Greece','Athina','Stournari','2','106 83',14.00,24),(12,23.734766,37.982239,'Greece','Athina','Ippokratous','12','106 79',12.00,18),(13,23.731341,37.984498,'Greece','Athina','Themistokleous','18','106 78',12.00,23),(14,23.734766,37.982239,'Greece','Athina','Ippokratous','12','106 79',12.00,25),(15,23.758031,37.988592,'Ελλάδα','Αθήνα','Πανόρμου','13','115 22',13.00,27),(16,27.304331,36.884022,'Greece','Kos','Koon Olympionikon','20','853 00',16.00,28),(17,23.728739,37.967075,'Greece','Athina','Falirou','2','117 42',15.00,29),(18,23.723888,37.959966,'Greece','Athina','Tharipou','2','117 45',21.00,30),(19,23.727182,37.963132,'Greece','Athina','Kalkon','3','117 43',11.00,31),(20,23.733492,37.964490,'Greece','Athina','Trivonianou','2','116 36',9.00,32),(21,23.714369,37.980955,'Greece','Athina','Artemisiou','20','104 35',7.00,33),(22,23.723262,37.982737,'Greece','Athina','Agisilaou','12','104 37',13.00,34),(23,23.738204,38.001390,'Greece','Athina','Sikinou','2','113 61',12.00,35),(24,23.714811,37.985552,'Greece','Athina','Siatistis','4','104 41',15.00,36),(25,23.710310,37.977527,'Greece','Athina','Gargittion','9','118 54',16.00,37);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keepers_availability`
--

DROP TABLE IF EXISTS `keepers_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keepers_availability` (
  `AV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEEPER_ID` int(11) NOT NULL,
  `UNAVAILABLE_DATE` date NOT NULL,
  PRIMARY KEY (`AV_ID`),
  UNIQUE KEY `KEEPER_ID` (`KEEPER_ID`,`UNAVAILABLE_DATE`),
  KEY `keeperId_Indx` (`KEEPER_ID`),
  CONSTRAINT `FK_MY_USERS_KEEPER_ID` FOREIGN KEY (`KEEPER_ID`) REFERENCES `my_users` (`my_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keepers_availability`
--

LOCK TABLES `keepers_availability` WRITE;
/*!40000 ALTER TABLE `keepers_availability` DISABLE KEYS */;
INSERT INTO `keepers_availability` VALUES (282,5,'2020-09-12'),(283,5,'2020-09-13'),(284,5,'2020-09-14'),(285,5,'2020-09-15'),(291,5,'2020-09-16'),(292,5,'2020-09-17'),(293,5,'2020-09-18'),(346,5,'2020-09-20'),(354,5,'2020-09-22'),(353,5,'2020-09-23'),(349,5,'2020-09-25'),(348,5,'2020-09-27'),(324,11,'2020-09-21'),(325,11,'2020-09-22'),(306,11,'2020-09-27'),(307,11,'2020-09-28'),(308,11,'2020-09-29'),(50,12,'2020-09-09'),(305,12,'2020-09-13'),(51,12,'2020-09-19'),(52,12,'2020-09-23'),(53,12,'2020-09-29'),(355,12,'2020-10-11'),(356,12,'2020-10-12'),(357,12,'2020-10-13'),(309,13,'2020-09-20'),(310,13,'2020-09-21'),(313,15,'2020-09-13'),(330,21,'2020-10-12'),(331,21,'2020-10-13'),(311,22,'2020-09-28'),(312,22,'2020-09-29'),(332,23,'2020-10-22'),(333,23,'2020-10-23'),(327,24,'2020-09-23'),(328,24,'2020-09-24'),(329,24,'2020-09-25'),(322,27,'2020-09-13'),(314,27,'2020-09-16'),(323,27,'2020-09-26'),(361,29,'2020-09-20'),(358,29,'2020-09-23'),(359,29,'2020-09-24'),(360,29,'2020-09-27');
/*!40000 ALTER TABLE `keepers_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_user_details`
--

DROP TABLE IF EXISTS `my_user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_user_details` (
  `details_id` int(11) NOT NULL AUTO_INCREMENT,
  `my_user_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `u_description` varchar(300) DEFAULT NULL,
  `u_photo_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`details_id`),
  UNIQUE KEY `my_user_id` (`my_user_id`),
  UNIQUE KEY `tel` (`tel`),
  CONSTRAINT `FK_DETAILS_MY_USERS` FOREIGN KEY (`my_user_id`) REFERENCES `my_users` (`my_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_user_details`
--

LOCK TABLES `my_user_details` WRITE;
/*!40000 ALTER TABLE `my_user_details` DISABLE KEYS */;
INSERT INTO `my_user_details` VALUES (1,5,'Argiris','Glamp',30,'6901234567','Best Pet keeper','keeper-Photo.jpg'),(2,6,'Owner','Owner',35,'6901234568','sdfdgsdfsdfsdf','owner-Photo.jpg'),(3,11,'Argiris','kati',25,'6991922356','Eimai Gamatos!','keeper2-Photo.jpg'),(4,12,'Nikos','Makis',29,'6951525562','The best!','keeper3-Photo.jpg'),(5,13,'Dimitris','Pachos',33,'6947788555','Cool guy','keeper4-Photo.jpg'),(6,14,'Kostas','Keeper',23,'6932322312','sdds','keeper5-Photo.jpeg'),(7,15,'Manos','Katakis',27,'6933215442','Δε περιγραφομαι','keeper6-Photo.jpg'),(8,19,'Alexandra','Grigoriou',33,'6971583141','dfdf','keeper8-Photo.jpg'),(9,20,'Kostantina','Tsiou',45,'6971585478','lala','keeper9-Photo.jpg'),(10,21,'Ilias','rixto',24,'6971578745','koko','keeper10-Photo.jpg'),(11,9,'Θανος','Σαμ',28,'6971573145','ολα καλα dfdf','thanos-Photo.jpg'),(12,22,'Maria','Pentagiotissa',32,'6976666456',NULL,'keeper11-Photo.jpg'),(13,24,'Pelagia','Roubini',29,'6932313453',NULL,'keeper13-Photo.jpeg'),(14,18,'Μανος','Panagiotou',38,'6939955664','Αγαπω τα ζωα!','keeper7-Photo.jpg'),(15,23,'Petros','Petrou',51,'6956456567','Animal lover','keeper12-Photo.jpg'),(16,25,'Δημητριος','Βεργουλας',19,'6901234967','φακ αεκ','mitsos-Photo.jpg'),(17,26,'Αργύρης','Γλάμπ',30,'6932020202','Όλα γοόδ μπρο!','owner2-Photo.jpg'),(18,27,'Νίκος','Καράπας',32,'6948789456','Αγαπάω τα ζώα. ','no-profile-pic-icon-12.png'),(19,28,'Κώστας','Κωστάκης',25,'6987878838','Καλησπέρα friends!','keeper15-Photo.jpg'),(20,29,'Κώστας','Μαρινάκης',37,'6985566442','Dog lover!','no-profile-pic-icon-12.png'),(21,30,'Μάνθος','Φουστάνος',65,'6945566123','Το κατοικίδιο σας είναι η μοναδική μου αγάπη!','keeper20-Photo.jpg'),(22,31,'Έυα','Μυρτάκη',22,'6901221593','Αγαπώ τα ζώα. ','eva-Photo.jpg'),(23,32,'Πάολα','Αντωνίου',24,'6993265145','Το ζωάκι σας είναι στα καλύτερα χέρια!','paola-Photo.jpg'),(24,33,'Ντίνα','Καλογέρου',33,'6981254632','Έχω φροντίσει πολλά κατοικίδια και όλα επέζησαν!','dina-Photo.jpg'),(25,34,'Ελπίδα','Κίτσιου',46,'6951234512','Το ζωάκι σας θα είναι ασφαλή και χαρούμενο στο σπίτι μου!','elpida-Photo.jpg'),(26,35,'Χριστίνα','Αλγέρη',28,'6987456320','Cat lover! Meow!','christina-Photo.jpg'),(27,36,'Χρίστος','Χρίστου',30,'6930564621','Γουφ γουφ!','chris-Photo.jpeg'),(28,37,'Άρης','Αριανός',31,'6954569988','Άρης μόνο!','aris-Photo.jpg');
/*!40000 ALTER TABLE `my_user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_users`
--

DROP TABLE IF EXISTS `my_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_users` (
  `my_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `my_password` varchar(60) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`my_user_id`),
  UNIQUE KEY `username_2` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_users`
--

LOCK TABLES `my_users` WRITE;
/*!40000 ALTER TABLE `my_users` DISABLE KEYS */;
INSERT INTO `my_users` VALUES (1,'Argys','$2a$10$95qLh8K9LbkzuNq6ISRu.e48pnniVm0c2bYS0aBPL6f1dwN46LLTW','dsadasad@asdad.asdasd'),(5,'keeper','$2a$10$SL3sOdhdPWin5s2FGTbKq.ZoYoN0dbs2XTSSG0eGULhijj0f9guka','keeper@keeper.com'),(6,'owner','$2a$10$s0nkeb.Vgh1dEH9qRmH7suvusLKXcxkOCud8iCkJcblb9ER8gO26i','owner@owner.com'),(7,'jisd','$2a$10$d3nWj3Ty84XJ701kNULhBudAE/9eH.HW9kgN3WyzKOawHP6Zjd4sm','ijdsok@asd'),(8,'bergou','$2a$10$g/UwikU9S1lczMXaiorhRuvsHFSXtb9SwlqPBEcvQZHb.fEP9Y7l2','bergou@bergou.com'),(9,'thanos','$2a$10$bs8KXWuEB4jpjC65AWVvxu93VP7Rg9W2K.gDs7K2Gq6gZWZsuxsRO','ths1311@hotmail.com'),(11,'keeper2','$2a$10$ZoVZhEEWd.CCDCf83oW14O33GNQWXj/yV0EtU20l6MdWbxeFuStd6','keeper2@keeper2.com'),(12,'keeper3','$2a$10$Swte0.hzKxFgOihy1MB0Qe/K2ucQESbaptfu5kQubs.JUIEyfmn1a','keeper3@keeper3.com'),(13,'keeper4','$2a$10$q/gGVrij7pMz63QnqCRBmeDbD7hHFBOyLk7.qg6.RE6J1gx/ZZQXG','keeper4@keeper4.com'),(14,'keeper5','$2a$10$YHvmXwI4hqSArLUeBag0/u2JZ2lkHuQc/NOJTEkR87TBBzx8wX3RC','keeper5@keeper5.com'),(15,'keeper6','$2a$10$Z868/ddzp7.4xrukCkytEO891sWc3DkXuyDECWpPPOoI0FWq2zrEK','keeper6@keeper6.com'),(18,'keeper7','$2a$10$/XM6SMxxKT7nx0P6SCXQDOfN7Dz7UqpS5j4gePGvmZJPmRgGkEvGK','keeper7@keeper7.com'),(19,'keeper8','$2a$10$mxbjlMlx4AKflvsV3ZnqA./N3LPieJzOc5uYJC.0Ft12Ozm8nJxTO','keeper8@keeper8.com'),(20,'keeper9','$2a$10$ZOZEZHBgvu1KmxUvl09ftOunoaKI/WHvgphNklrNyMp9JPubgCzFK','keeper9@keeper9.com'),(21,'keeper10','$2a$10$QswDfXcrqh.oBFbFJ0f6teSPT7tkdIlfAlJ97BonEpZjtJlfF/RaW','keeper10@keeper10.com'),(22,'keeper11','$2a$10$TF/m86Cs4f2Pri3u/FqNZe99HYY2liY7eAC/IwHOfzdM0z0WeoBoe','keeper11@keeper11.gr'),(23,'keeper12','$2a$10$op4rS3BI34I24m/PM1WdjuSe9oH6E3vnieMs5nhpVg4aLotKSgybW','keeper12@keeper12.gr'),(24,'keeper13','$2a$10$XFjPmliwKcHR7vS/GJgjzuK77dstcE8TTWloC9V0zrqkTv3.CaR0m','keeper13@keeper13.gr'),(25,'mitsos','$2a$10$oQlWe5Ge0o2YbTgfLiNrY.cSgjpuQAeDekRvO0t7T6kGbkE9e0uay','mitsos@mitsos.com'),(26,'owner2','$2a$10$bAGRCajTHIQQeLNHydXHHuAiOp/mTa5Opy7JHzAwgOyl0B/hS7Kdi','owner2@owner2.com'),(27,'nikos','$2a$10$CzMiq3EusJGqHZT7zor8YeUmFzdALQ4DFLHt8.eNY.pplVpAd57uG','nikos@nikos.com'),(28,'keeper15','$2a$10$JjYJcyeZieCMGa9C59uCtufjnUcoOCDvvX0H5sBihuXIXUvGsg9vq','keeper15@keeper15.com'),(29,'keeper100','$2a$10$wpsGxutU6ReSChk.zaQIBOGwkbR0.SrFH1uXyAwT8t8cFTT/MREm2','keeper100@keeper100.com'),(30,'keeper20','$2a$10$3EZB1En1q3KV1wlkonYOFeLzzG/hpxvpZr10LgFB0LXsxFeNySu62','keeper20@keeper20.com'),(31,'eva','$2a$10$.02DIRqC06LbiWcr3I.0t.BqXWpe2SlOsVUTP7WHU5QopIUMgr8KO','eva@eva.com'),(32,'paola','$2a$10$Zt6cC66/dMhpjtpLmSiyKewZKUgCde3d3XUT6tWPDijML71XtHPU6','paola@paola.com'),(33,'dina','$2a$10$IGNKDeHGGAn//oa41b382..oxhNeTITvEmhXfC8hJ9/1k./ZKyyv2','dina@dina.com'),(34,'elpida','$2a$10$fT1mIhNES64gNpngKrxu/.cc.Lo92EDJc0n2JRZNai3.w0xvoX1d.','elpida@elpida.com'),(35,'christina','$2a$10$BxKpbFXc7./XcQX2vkZL9eaW.8oYcLjUsUoOajozMzi9omHeDmFh6','christina@christina.com'),(36,'chris','$2a$10$V/fVp7HrlhPPv7lo6tuic.76vgHmAP723Pr/CvSYDDOQYKvYYxfrq','chris@chris.com'),(37,'aris','$2a$10$AXQe01odttI4teVAm05vaez6pcrRYnrChLrYkvWqRuy1WE4rgIqgu','aris@aris.com');
/*!40000 ALTER TABLE `my_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_users_roles`
--

DROP TABLE IF EXISTS `my_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_users_roles` (
  `my_user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`my_user_id`,`role_id`),
  KEY `FK_ROLES_ROLE_ID` (`role_id`),
  CONSTRAINT `FK_MY_USERS_ROLES_MY_USERS` FOREIGN KEY (`my_user_id`) REFERENCES `my_users` (`my_user_id`),
  CONSTRAINT `FK_ROLES_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_users_roles`
--

LOCK TABLES `my_users_roles` WRITE;
/*!40000 ALTER TABLE `my_users_roles` DISABLE KEYS */;
INSERT INTO `my_users_roles` VALUES (6,1),(7,1),(8,1),(9,1),(26,1),(5,2),(11,2),(12,2),(13,2),(14,2),(15,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2);
/*!40000 ALTER TABLE `my_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `pet_id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_name` varchar(45) NOT NULL,
  `pet_type` varchar(45) NOT NULL,
  `pet_description` varchar(300) NOT NULL,
  `my_user_id` int(11) NOT NULL,
  PRIMARY KEY (`pet_id`),
  KEY `FK_PETS_USERS` (`my_user_id`),
  CONSTRAINT `FK_PETS_USERS` FOREIGN KEY (`my_user_id`) REFERENCES `my_users` (`my_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'Μητσος','Σκύλος','NAI POIOS EINAI?',6),(2,'nikosKoukos','Γάτα','τρωει πολυ',9),(3,'Ρέξ','Γάτα','Νιαουρίζει πολύ!',26);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `RSV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_ID` int(11) NOT NULL,
  `KEEPER_ID` int(11) NOT NULL,
  `DATE_FROM` date NOT NULL,
  `DATE_TO` date NOT NULL,
  `TOTAL_PRICE` decimal(5,2) NOT NULL,
  PRIMARY KEY (`RSV_ID`),
  UNIQUE KEY `OWNER_ID` (`OWNER_ID`,`KEEPER_ID`,`DATE_FROM`,`DATE_TO`),
  KEY `FK_MY_USERS_MY_USER_ID_KEEPER` (`KEEPER_ID`),
  CONSTRAINT `FK_MY_USERS_MY_USER_ID_KEEPER` FOREIGN KEY (`KEEPER_ID`) REFERENCES `my_users` (`my_user_id`),
  CONSTRAINT `FK_MY_USERS_MY_USER_ID_OWNER` FOREIGN KEY (`OWNER_ID`) REFERENCES `my_users` (`my_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (2,6,5,'2020-09-12','2020-09-16',40.00),(3,26,5,'2020-09-16','2020-09-19',30.00),(4,9,12,'2020-09-13','2020-09-14',9.00),(5,6,11,'2020-09-27','2020-09-30',39.00),(6,26,13,'2020-09-20','2020-09-22',16.00),(7,6,22,'2020-09-28','2020-09-30',22.00),(8,6,15,'2020-09-13','2020-09-14',12.00),(9,6,11,'2020-09-21','2020-09-23',26.00),(10,9,24,'2020-09-23','2020-09-26',42.00),(11,9,21,'2020-10-12','2020-10-14',20.00),(12,9,23,'2020-10-22','2020-10-24',24.00),(13,6,12,'2020-10-11','2020-10-14',27.00);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_OWNER'),(2,'ROLE_KEEPER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-15 22:01:37
