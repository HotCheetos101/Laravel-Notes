CREATE DATABASE  IF NOT EXISTS `usjr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `usjr`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: usjr
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colleges` (
  `collid` int NOT NULL,
  `collfullname` varchar(100) NOT NULL,
  `collshortname` varchar(20) NOT NULL,
  PRIMARY KEY (`collid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES (1,'School of Business and Management','SBM'),(2,'School of Arts and Sciences','SAS'),(3,'School of Engineering','SoENG'),(4,'School of Education','SED'),(5,'School of Computer Studies','SCS'),(6,'School of Allied Medical Sciences','SAMS');
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `deptid` int NOT NULL,
  `deptfullname` varchar(100) NOT NULL,
  `deptshortname` varchar(20) DEFAULT NULL,
  `deptcollid` int NOT NULL,
  PRIMARY KEY (`deptid`),
  KEY `fk_department_college_id` (`deptcollid`),
  CONSTRAINT `fk_department_college_id` FOREIGN KEY (`deptcollid`) REFERENCES `colleges` (`collid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1001,'Accountancy and Finance Department',NULL,1),(1002,'Business and Entrepreneurship Department',NULL,1),(1003,'Marketing and Human Resource Management Department',NULL,1),(1004,'Tourism and Hospitality Management Department','THMD',1),(2001,'Department of Communications, Language and Literature','DLL',2),(2002,'Department of Mathematics and Sciences','DMS',2),(2003,'Department of Social Sciences and Philiosophy','DSSP',2),(2004,'Department of Psychology and Library Information Science','DPLIS',2),(3001,'Department of Civil Engineering',NULL,3),(3002,'Department of Computer Engineering',NULL,3),(3003,'Department of Electronics and Communications Engineering',NULL,3),(3004,'Department of Electrical Engineering',NULL,3),(3005,'Department of Industrial Enginering',NULL,3),(3006,'Department of Mechanical Engineering',NULL,3),(4001,'Department of Teacher Education',NULL,4),(4002,'Department of Physical Education',NULL,4),(4003,'Department of Special Education',NULL,4),(5001,'CS/IT Department',NULL,5),(6001,'Department of Nursing',NULL,6);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `progid` int NOT NULL,
  `progfullname` varchar(100) NOT NULL,
  `progshortname` varchar(20) DEFAULT NULL,
  `progcollid` int NOT NULL,
  `progcolldeptid` int NOT NULL,
  PRIMARY KEY (`progid`),
  KEY `fk_program_college_id` (`progcollid`),
  KEY `fk_program_college_department_id` (`progcolldeptid`),
  CONSTRAINT `fk_program_college_department_id` FOREIGN KEY (`progcolldeptid`) REFERENCES `departments` (`deptid`),
  CONSTRAINT `fk_program_college_id` FOREIGN KEY (`progcollid`) REFERENCES `colleges` (`collid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1001,'Bachelor of Science in Accountancy','BSA',1,1001),(1002,'Bachelor of Science in Management Accounting','BSMA',1,1001),(1003,'Bachelor of Science in Business Administration Major in Operation Management','BSBA-OM',1,1003),(1004,'Bachelor of Science in Business Administration Major in Human Resource Development Management','BSBA-HRDM',1,1003),(1005,'Bachelor of Science in Business Administration Major in Marketing Management','BSBA-MM',1,1003),(1006,'Bachelor of Science in Business Administration Major in Finanacial Management','BSBA-FM',1,1001),(1007,'Bachelor of Science in Entrepreneurship','BS-Entrepreneurship',1,1002),(1008,'Bachelor of Science in Hospitality Management','BSHM',1,1004),(1009,'Bachelor of Science in Hospitality Management Major in Food and Beverage','BSHM-FB',1,1004),(1010,'Associate in Hospitality Management','AHM',1,1004),(1011,'Associate in Tourism','ATourism',1,1004),(2001,'Bachelor of Arts in Communication','ABComm',2,2001),(2002,'Bachelor of Arts in English Language Studies','ABELS',2,2001),(2003,'Bachelor of Arts in Journalism','ABJournalism',2,2001),(2004,'Bachelor of Arts in Marketing Communication','ABMarComm',2,2001),(2005,'Bachelor of Science in Biology Major in Medical Biology','BSBio-MB',2,2002),(2006,'Bachelor of Science in Biology Major in Microbiology','BSBio-Microbio',2,2002),(2007,'Bachelor of Arts in Political Science','ABPolSci',2,2003),(2008,'Bachelor of Arts in International Studies','ABIS',2,2003),(2009,'Bachelor of Arts in Philosophy','ABPhilo',2,2003),(2010,'Bachelor of Science in Psychology','BSPsych',2,2004),(3001,'Bachelor of Science in Civil Engineering','BSCE',3,3001),(3002,'Bachelor of Science in Computer Engineering','BSCpE',3,3002),(3003,'Bachelor of Science in Electronics and Communications Engineering','BSECE',3,3003),(3004,'Bachelor of Science in Electrical Engineering','BSEE',3,3004),(3005,'Bachelor of Science in Industrial Engineering','BSIE',3,3005),(3006,'Bachelor of Science in Mechanical Engineering','BSME',3,3006),(4001,'Bachelor of Elementary Education','BEEEd',4,4001),(4002,'Bachelor of Early Childhood Education','BECE',4,4001),(4003,'Bachelor of Physical Education','BPE',4,4002),(4004,'Bachelor of Secondary Education Major in English','BSEd-English',4,4001),(4005,'Bachelor of Secondary Education Major in Filipino','BSEd-Filipino',4,4001),(4006,'Bachelor of Secondary Education Major in Mathematics','BSEd-Mathematics',4,4001),(4007,'Bachelor of Secondary Education Major in Science','BSEd-Science',4,4001),(4008,'Bachelor of Special Needs Education - Generalist','BSNE-General',4,4003),(4009,'Bachelor of Special Needs Education Major in Early Childhood Education','BSNE-ECE',4,4003),(4010,'Bachelor of Special Needs Education Major in Elementary School Teaching','BSNE-EST',4,4003),(5001,'Bachelor of Science in Computer Science','BSCS',5,5001),(5002,'Bachelor of Science in Information Technology','BSIT',5,5001),(5003,'Bachelor of Science in Information Systems','BSIS',5,5001),(5004,'Bachelor of Science in Entertainment and Multimedia Computing','BSEMC',5,5001),(6001,'Bachelof of Science in Nursing','BSN',6,6001);
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studid` int NOT NULL,
  `studfirstname` varchar(50) NOT NULL,
  `studlastname` varchar(50) NOT NULL,
  `studmidname` varchar(50) DEFAULT NULL,
  `studprogid` int NOT NULL,
  `studcollid` int NOT NULL,
  `studyear` int NOT NULL,
  PRIMARY KEY (`studid`),
  KEY `fk_student_college_id` (`studcollid`),
  CONSTRAINT `fk_student_college_id` FOREIGN KEY (`studcollid`) REFERENCES `colleges` (`collid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (21323,'Zhar','Calimpon','G',3004,3,2),(333234,'Roy Adrian','Salares','Mellor',5002,5,2),(5566556,'Jamaica','Dotillos','G',5001,5,1),(33444344,'Khiara Danielle','Rubia','C',5002,5,4),(55656665,'Allen','Deniega','Zapico',1008,1,1);
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

-- Dump completed on 2024-06-18  1:29:32
