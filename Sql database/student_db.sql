CREATE DATABASE  IF NOT EXISTS `student_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `student_db`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: student_db
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (8,'WELCOME','Hello Students. Welcome to the student management system!!','2025-06-16 19:09:44');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `roll_no` varchar(20) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `section` varchar(1) DEFAULT NULL,
  `marks` int DEFAULT NULL,
  `attendance` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (12,'6A002','Diya Sharma','Female',11,'2','6','A',88,95),(13,'6B001','Karthik Rao','Male',11,'01','6','B',81,90),(14,'10B02','Meera Iyer','Female',15,'02','10','B',92,97),(15,'10C01','Nikhil Joseph','Male',15,'01','10','C',89,93),(16,'10C02','Sara Khan','Female',15,'02','10','C',86,90),(17,'9A01','Vivaan Reddy','Male',14,'01','9','A',75,89),(18,'9A02','Ananya Das','Female',14,'02','9','A',84,91),(19,'9B01','Ishaan Roy','Male',14,'01','9','B',78,87),(20,'9B02','Riya Sen','Female',14,'02','9','B',90,96),(21,'9C01','Aryan Singh','Male',14,'01','9','C',80,88),(22,'9C02','Sanya Thomas','Female',14,'02','9','C',85,92),(23,'8A01','Aditya Mehta','Male',13,'01','8','A',87,94),(24,'8A02','Kavya Menon','Female',13,'02','8','A',88,93),(25,'8B01','Rudra Pillai','Male',13,'01','8','B',79,90),(26,'8B02','Naina Lal','Female',13,'02','8','B',83,91),(27,'8C01','Yash Varma','Male',13,'01','8','C',76,85),(28,'8C02','Sneha George','Female',13,'02','8','C',80,89),(29,'7A01','Parth Chawla','Male',12,'01','7','A',77,86),(30,'7A02','Mira Abraham','Female',12,'02','7','A',85,90),(31,'7B01','Dev Patel','Male',12,'01','7','B',79,87),(32,'7B02','Neha Prasad','Female',12,'02','7','B',82,88),(33,'7C01','Rohan Ghosh','Male',12,'01','7','C',74,85),(34,'7C02','Pooja Reddy','Female',12,'02','7','C',83,90),(35,'6A01','Ayaan Paul','Male',11,'01','6','A',70,82),(36,'6A02','Tanya Bhat','Female',11,'02','6','A',78,89),(37,'6B01','Harsh Vora','Male',11,'01','6','B',75,84),(38,'6B02','Isha Pillai','Female',11,'02','6','B',80,88),(39,'6C01','Siddharth Jain','Male',11,'01','6','C',72,83),(40,'6C02','Ritika Bose','Female',11,'02','6','C',76,87),(41,'10A03','Nivin Mathew','Male',15,'03','10','A',85,91),(42,'10A04','Krishna Balan','Male',15,'04','10','A',84,89),(43,'10B03','Anjali Mohan','Female',15,'03','10','B',87,92),(44,'10B04','Kiran Kumar','Male',15,'04','10','B',82,90),(45,'10C03','Lavanya Nair','Female',15,'03','10','C',89,95),(46,'10C04','Rahul Das','Male',15,'04','10','C',88,93),(47,'9A03','Amrita Rao','Female',14,'03','9','A',85,91),(48,'9B03','Arjun Bhatt','Male',14,'03','9','B',79,87),(49,'9C03','Priti Yadav','Female',14,'03','9','C',80,89),(50,'9C04','Rajesh Kapoor','Male',14,'04','9','C',77,85);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-21  1:27:00
