-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.13-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admission_schedule`
--

DROP TABLE IF EXISTS `admission_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admission_schedule` (
  `admission_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `admission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`admission_id`),
  KEY `fk_Patient_admission` (`patient_id`),
  CONSTRAINT `fk_Patient_admission` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission_schedule`
--

LOCK TABLES `admission_schedule` WRITE;
/*!40000 ALTER TABLE `admission_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `admission_schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_addmission_stats
AFTER UPDATE ON admission_schedule
FOR EACH ROW

BEGIN
	
	insert ignore into discharge_schedule(patient_id,admit_id)
    select patient_id,admission_id from admission_schedule
    where status = 2; 
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `admitting_diagnosis`
--

DROP TABLE IF EXISTS `admitting_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admitting_diagnosis` (
  `diagnosis_id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosis_name` varchar(255) NOT NULL,
  `diagnosis_desc` varchar(255) NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`diagnosis_id`),
  KEY `fk_Patient` (`patient_id`),
  CONSTRAINT `fk_Patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admitting_diagnosis`
--

LOCK TABLES `admitting_diagnosis` WRITE;
/*!40000 ALTER TABLE `admitting_diagnosis` DISABLE KEYS */;
/*!40000 ALTER TABLE `admitting_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admitting_resident`
--

DROP TABLE IF EXISTS `admitting_resident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admitting_resident` (
  `resident_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL DEFAULT '0',
  `patient_id` varchar(30) DEFAULT NULL,
  `user_id_fk` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resident_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_Patient_admitting` (`patient_id`),
  KEY `fk_userid_1` (`user_id_fk`),
  CONSTRAINT `fk_Patient_admitting` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `fk_userid_1` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admitting_resident`
--

LOCK TABLES `admitting_resident` WRITE;
/*!40000 ALTER TABLE `admitting_resident` DISABLE KEYS */;
/*!40000 ALTER TABLE `admitting_resident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attending_physician`
--

DROP TABLE IF EXISTS `attending_physician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attending_physician` (
  `attending_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL DEFAULT '0',
  `patient_id` varchar(30) DEFAULT NULL,
  `user_id_fk` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attending_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_Patient_attending` (`patient_id`),
  KEY `fk_userid_2` (`user_id_fk`),
  CONSTRAINT `fk_Patient_attending` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `fk_userid_2` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attending_physician`
--

LOCK TABLES `attending_physician` WRITE;
/*!40000 ALTER TABLE `attending_physician` DISABLE KEYS */;
/*!40000 ALTER TABLE `attending_physician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beds`
--

DROP TABLE IF EXISTS `beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beds` (
  `bed_id` int(11) NOT NULL AUTO_INCREMENT,
  `bed_roomid` int(11) NOT NULL,
  `bed_maintenance` tinyint(4) NOT NULL DEFAULT '0',
  `bed_patient` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`bed_id`),
  KEY `fk_bed_pat` (`bed_patient`),
  KEY `fk_room_id` (`bed_roomid`),
  CONSTRAINT `fk_bed_pat` FOREIGN KEY (`bed_patient`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `fk_room_id` FOREIGN KEY (`bed_roomid`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beds`
--

LOCK TABLES `beds` WRITE;
/*!40000 ALTER TABLE `beds` DISABLE KEYS */;
/*!40000 ALTER TABLE `beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csr_inventory`
--

DROP TABLE IF EXISTS `csr_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csr_inventory` (
  `csr_id` varchar(30) NOT NULL DEFAULT '0',
  `item_name` varchar(255) NOT NULL,
  `item_desc` varchar(255) NOT NULL,
  `item_stock` int(11) NOT NULL,
  PRIMARY KEY (`csr_id`),
  UNIQUE KEY `item_name` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csr_inventory`
--

LOCK TABLES `csr_inventory` WRITE;
/*!40000 ALTER TABLE `csr_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `csr_inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_csr
BEFORE INSERT ON csr_inventory
FOR EACH ROW 
BEGIN
  INSERT INTO csr_sequence VALUES (NULL);
  SET NEW.csr_id = CONCAT('CSR-', LPAD(LAST_INSERT_ID(), 5, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `csr_request`
--

DROP TABLE IF EXISTS `csr_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csr_request` (
  `csr_req_id` varchar(30) NOT NULL,
  `nurse_id` varchar(30) NOT NULL DEFAULT '0',
  `csr_item_id` varchar(30) NOT NULL,
  `item_quant` int(11) NOT NULL,
  `csr_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`csr_req_id`),
  KEY `fk_nurse_csr` (`nurse_id`),
  KEY `fk_csr_item` (`csr_item_id`),
  CONSTRAINT `fk_csr_item` FOREIGN KEY (`csr_item_id`) REFERENCES `csr_inventory` (`csr_id`),
  CONSTRAINT `fk_nurse_csr` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csr_request`
--

LOCK TABLES `csr_request` WRITE;
/*!40000 ALTER TABLE `csr_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `csr_request` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_csrreq
BEFORE INSERT ON csr_request
FOR EACH ROW 
BEGIN
  INSERT INTO nurse_req_sequence VALUES (NULL);
  SET NEW.csr_req_id = CONCAT('CSR-REQ-', LPAD(LAST_INSERT_ID(), 5, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `csr_sequence`
--

DROP TABLE IF EXISTS `csr_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csr_sequence` (
  `csr_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`csr_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csr_sequence`
--

LOCK TABLES `csr_sequence` WRITE;
/*!40000 ALTER TABLE `csr_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `csr_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_sequence`
--

DROP TABLE IF EXISTS `department_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_sequence` (
  `dept_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`dept_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_sequence`
--

LOCK TABLES `department_sequence` WRITE;
/*!40000 ALTER TABLE `department_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `department_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `dept_id` varchar(30) NOT NULL DEFAULT '0',
  `dept_name` varchar(255) NOT NULL,
  `dept_desc` varchar(255) NOT NULL,
  `dept_head` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_departments
BEFORE INSERT ON departments
FOR EACH ROW 
BEGIN
  INSERT INTO department_sequence VALUES (NULL);
  SET NEW.dept_id = CONCAT('DEPT-', LPAD(LAST_INSERT_ID(), 4, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `discharge_schedule`
--

DROP TABLE IF EXISTS `discharge_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discharge_schedule` (
  `discharge_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) DEFAULT NULL,
  `discharge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`discharge_id`),
  UNIQUE KEY `patient_id` (`patient_id`),
  KEY `fk_Patient_discharge` (`patient_id`),
  CONSTRAINT `fk_Patient_discharge` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discharge_schedule`
--

LOCK TABLES `discharge_schedule` WRITE;
/*!40000 ALTER TABLE `discharge_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `discharge_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disposition_status`
--

DROP TABLE IF EXISTS `disposition_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposition_status` (
  `disposition_stat_id` int(11) NOT NULL AUTO_INCREMENT,
  `disposition_id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL,
  `status_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`disposition_stat_id`),
  KEY `disposition_id` (`disposition_id`),
  CONSTRAINT `disposition_status_ibfk_1` FOREIGN KEY (`disposition_id`) REFERENCES `final_disposition` (`disposition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disposition_status`
--

LOCK TABLES `disposition_status` WRITE;
/*!40000 ALTER TABLE `disposition_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `disposition_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_information`
--

DROP TABLE IF EXISTS `doctor_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_information` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL DEFAULT '0',
  `room_assignment` varchar(255) NOT NULL,
  `spec_id` int(11) DEFAULT NULL,
  `user_id_fk` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`doctor_id`),
  KEY `user_id` (`user_id`),
  KEY `spec_id` (`spec_id`),
  KEY `fk_userid_5` (`user_id_fk`),
  CONSTRAINT `doctor_information_ibfk_2` FOREIGN KEY (`spec_id`) REFERENCES `doctor_specializations` (`spec_id`),
  CONSTRAINT `fk_userid_5` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_information`
--

LOCK TABLES `doctor_information` WRITE;
/*!40000 ALTER TABLE `doctor_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_specializations`
--

DROP TABLE IF EXISTS `doctor_specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_specializations` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(255) NOT NULL,
  `spec_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_specializations`
--

LOCK TABLES `doctor_specializations` WRITE;
/*!40000 ALTER TABLE `doctor_specializations` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination_category`
--

DROP TABLE IF EXISTS `examination_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination_category` (
  `exam_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_cat_name` varchar(255) NOT NULL,
  `exam_cat_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`exam_cat_id`),
  UNIQUE KEY `exam_cat_name` (`exam_cat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination_category`
--

LOCK TABLES `examination_category` WRITE;
/*!40000 ALTER TABLE `examination_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `examination_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fasting_cat`
--

DROP TABLE IF EXISTS `fasting_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fasting_cat` (
  `fast_id` int(11) NOT NULL AUTO_INCREMENT,
  `fast_name` varchar(255) NOT NULL,
  PRIMARY KEY (`fast_id`),
  UNIQUE KEY `fast_name` (`fast_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fasting_cat`
--

LOCK TABLES `fasting_cat` WRITE;
/*!40000 ALTER TABLE `fasting_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `fasting_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_disposition`
--

DROP TABLE IF EXISTS `final_disposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_disposition` (
  `disposition_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`disposition_id`),
  KEY `fk_Patient_id` (`patient_id`),
  CONSTRAINT `fk_Patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_disposition`
--

LOCK TABLES `final_disposition` WRITE;
/*!40000 ALTER TABLE `final_disposition` DISABLE KEYS */;
/*!40000 ALTER TABLE `final_disposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icd_code10`
--

DROP TABLE IF EXISTS `icd_code10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icd_code10` (
  `icd_code` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosis_id` int(11) NOT NULL,
  `icd_name` varchar(255) NOT NULL,
  `icd_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`icd_code`),
  KEY `diagnosis_id` (`diagnosis_id`),
  CONSTRAINT `icd_code10_ibfk_1` FOREIGN KEY (`diagnosis_id`) REFERENCES `admitting_diagnosis` (`diagnosis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icd_code10`
--

LOCK TABLES `icd_code10` WRITE;
/*!40000 ALTER TABLE `icd_code10` DISABLE KEYS */;
/*!40000 ALTER TABLE `icd_code10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immidiate_contact`
--

DROP TABLE IF EXISTS `immidiate_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `immidiate_contact` (
  `im_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`im_id`),
  KEY `fk_Patient_immidiate` (`patient_id`),
  CONSTRAINT `fk_Patient_immidiate` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immidiate_contact`
--

LOCK TABLES `immidiate_contact` WRITE;
/*!40000 ALTER TABLE `immidiate_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `immidiate_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_request_remarks`
--

DROP TABLE IF EXISTS `lab_request_remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_request_remarks` (
  `remarks_id` int(11) NOT NULL AUTO_INCREMENT,
  `remark` varchar(255) NOT NULL,
  `rem_user` varchar(30) NOT NULL DEFAULT '0',
  `rem_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lab_id_fk` int(11) NOT NULL,
  `user_id_fk` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`remarks_id`),
  KEY `fk_lab_id` (`lab_id_fk`),
  KEY `fk_user_rem` (`rem_user`),
  KEY `fk_userid_7` (`user_id_fk`),
  CONSTRAINT `fk_lab_id` FOREIGN KEY (`lab_id_fk`) REFERENCES `laboratory_request` (`lab_id`),
  CONSTRAINT `fk_userid_7` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_request_remarks`
--

LOCK TABLES `lab_request_remarks` WRITE;
/*!40000 ALTER TABLE `lab_request_remarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_request_remarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_specimen_request`
--

DROP TABLE IF EXISTS `lab_specimen_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_specimen_request` (
  `trans_spec_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_req_id` int(11) NOT NULL,
  `specimen_id` int(11) NOT NULL,
  PRIMARY KEY (`trans_spec_id`),
  KEY `fk_lab_reqid` (`lab_req_id`),
  KEY `fk_lab_specid` (`specimen_id`),
  CONSTRAINT `fk_lab_reqid` FOREIGN KEY (`lab_req_id`) REFERENCES `laboratory_request` (`lab_id`),
  CONSTRAINT `fk_lab_specid` FOREIGN KEY (`specimen_id`) REFERENCES `laboratory_specimens` (`specimen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_specimen_request`
--

LOCK TABLES `lab_specimen_request` WRITE;
/*!40000 ALTER TABLE `lab_specimen_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_specimen_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory_examination_type`
--

DROP TABLE IF EXISTS `laboratory_examination_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratory_examination_type` (
  `lab_exam_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_exam_type_name` varchar(255) NOT NULL,
  `lab_exam_type_category_id` int(11) NOT NULL,
  `lab_exam_type_description` varchar(255) NOT NULL,
  PRIMARY KEY (`lab_exam_type_id`),
  UNIQUE KEY `lab_exam_type_name` (`lab_exam_type_name`),
  KEY `fk_cat_id` (`lab_exam_type_category_id`),
  CONSTRAINT `fk_cat_id` FOREIGN KEY (`lab_exam_type_category_id`) REFERENCES `examination_category` (`exam_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory_examination_type`
--

LOCK TABLES `laboratory_examination_type` WRITE;
/*!40000 ALTER TABLE `laboratory_examination_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratory_examination_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory_request`
--

DROP TABLE IF EXISTS `laboratory_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratory_request` (
  `lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_user` varchar(30) NOT NULL DEFAULT '0',
  `lab_patient` varchar(30) DEFAULT NULL,
  `lab_date_req` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lab_status` tinyint(4) NOT NULL DEFAULT '1',
  `lab_patient_checkin` date DEFAULT NULL,
  `user_id_fk` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lab_id`),
  KEY `fk_lab_patient_2` (`lab_patient`),
  KEY `fk_user_req2` (`lab_user`),
  KEY `fk_userid_6` (`user_id_fk`),
  CONSTRAINT `fk_lab_patient_2` FOREIGN KEY (`lab_patient`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `fk_userid_6` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory_request`
--

LOCK TABLES `laboratory_request` WRITE;
/*!40000 ALTER TABLE `laboratory_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratory_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory_specimens`
--

DROP TABLE IF EXISTS `laboratory_specimens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratory_specimens` (
  `specimen_id` int(11) NOT NULL AUTO_INCREMENT,
  `specimen_name` varchar(255) NOT NULL,
  `specimen_description` varchar(255) NOT NULL,
  PRIMARY KEY (`specimen_id`),
  UNIQUE KEY `specimen_name` (`specimen_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory_specimens`
--

LOCK TABLES `laboratory_specimens` WRITE;
/*!40000 ALTER TABLE `laboratory_specimens` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratory_specimens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance` (
  `maintenance_status_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `maintenance_status_name` varchar(255) NOT NULL,
  `maintenance_status_description` varchar(255) NOT NULL,
  PRIMARY KEY (`maintenance_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_status`
--

DROP TABLE IF EXISTS `maintenance_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type_id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `room_type_id` (`room_type_id`),
  CONSTRAINT `maintenance_status_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_status`
--

LOCK TABLES `maintenance_status` WRITE;
/*!40000 ALTER TABLE `maintenance_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notif_seen`
--

DROP TABLE IF EXISTS `notif_seen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notif_seen` (
  `notif_seen_id` varchar(30) NOT NULL,
  `notif_ids` varchar(30) NOT NULL DEFAULT '0',
  `notif_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notif_seen_stat` tinyint(4) NOT NULL,
  PRIMARY KEY (`notif_seen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notif_seen`
--

LOCK TABLES `notif_seen` WRITE;
/*!40000 ALTER TABLE `notif_seen` DISABLE KEYS */;
/*!40000 ALTER TABLE `notif_seen` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_notif_seen
BEFORE INSERT ON notif_seen
FOR EACH ROW 
BEGIN
  INSERT INTO notif_seen_sequence VALUES (NULL);
  SET NEW.notif_seen_id = CONCAT('NOTIF-SEEN', LPAD(LAST_INSERT_ID(), 6, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notif_seen_sequence`
--

DROP TABLE IF EXISTS `notif_seen_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notif_seen_sequence` (
  `notif_seen_idd` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`notif_seen_idd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notif_seen_sequence`
--

LOCK TABLES `notif_seen_sequence` WRITE;
/*!40000 ALTER TABLE `notif_seen_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `notif_seen_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notif_sequence`
--

DROP TABLE IF EXISTS `notif_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notif_sequence` (
  `notif_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`notif_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notif_sequence`
--

LOCK TABLES `notif_sequence` WRITE;
/*!40000 ALTER TABLE `notif_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `notif_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notif_id` varchar(30) NOT NULL,
  `notif_type` int(11) NOT NULL,
  `notif_desc` varchar(255) NOT NULL,
  `notif_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`notif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_notifs
BEFORE INSERT ON notifications
FOR EACH ROW 
BEGIN
  INSERT INTO notif_sequence VALUES (NULL);
  SET NEW.notif_id = CONCAT('NOTIF', LPAD(LAST_INSERT_ID(), 6, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nurse_req_sequence`
--

DROP TABLE IF EXISTS `nurse_req_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse_req_sequence` (
  `csr_reqseq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`csr_reqseq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_req_sequence`
--

LOCK TABLES `nurse_req_sequence` WRITE;
/*!40000 ALTER TABLE `nurse_req_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `nurse_req_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse_sequence`
--

DROP TABLE IF EXISTS `nurse_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse_sequence` (
  `nurse_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nurse_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_sequence`
--

LOCK TABLES `nurse_sequence` WRITE;
/*!40000 ALTER TABLE `nurse_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `nurse_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse_type`
--

DROP TABLE IF EXISTS `nurse_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse_type` (
  `nurse_type_id` tinyint(4) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`nurse_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_type`
--

LOCK TABLES `nurse_type` WRITE;
/*!40000 ALTER TABLE `nurse_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `nurse_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurses` (
  `nurse_id` varchar(30) NOT NULL DEFAULT '0',
  `user_nurse_fk` varchar(30) NOT NULL DEFAULT '0',
  `nurse_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`nurse_id`),
  KEY `fk_nurse_type` (`nurse_type`),
  KEY `fk_user_nurse` (`user_nurse_fk`),
  CONSTRAINT `fk_nurse_type` FOREIGN KEY (`nurse_type`) REFERENCES `nurse_type` (`nurse_type_id`),
  CONSTRAINT `fk_user_nurse` FOREIGN KEY (`user_nurse_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_nurses
BEFORE INSERT ON nurses
FOR EACH ROW 
BEGIN
  INSERT INTO nurse_sequence VALUES (NULL);
  SET NEW.nurse_id = CONCAT('NURSE-', LPAD(LAST_INSERT_ID(), 5, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `occupancy`
--

DROP TABLE IF EXISTS `occupancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occupancy` (
  `occupancy_status_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `occupancy_status_name` varchar(255) NOT NULL,
  `occupancy_status_description` varchar(255) NOT NULL,
  PRIMARY KEY (`occupancy_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupancy`
--

LOCK TABLES `occupancy` WRITE;
/*!40000 ALTER TABLE `occupancy` DISABLE KEYS */;
/*!40000 ALTER TABLE `occupancy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupancy_status`
--

DROP TABLE IF EXISTS `occupancy_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occupancy_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type_id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `room_type_id` (`room_type_id`),
  CONSTRAINT `occupancy_status_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupancy_status`
--

LOCK TABLES `occupancy_status` WRITE;
/*!40000 ALTER TABLE `occupancy_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `occupancy_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` text NOT NULL,
  `birthdate` date NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `present_address` varchar(255) NOT NULL,
  `telephone_number` int(10) NOT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `patient_status` varchar(255) NOT NULL,
  `patient_id` varchar(30) NOT NULL DEFAULT '0',
  `date_registered` date NOT NULL,
  `date_checkin` date NOT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `fk_bedRooms` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_patient_insert`
BEFORE INSERT ON `patient` 
FOR EACH ROW
 BEGIN
  INSERT INTO patient_sequence VALUES (NULL);
  SET NEW.patient_id = CONCAT('PTNT-', LPAD(LAST_INSERT_ID(), 6, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patient_category`
--

DROP TABLE IF EXISTS `patient_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_category` (
  `category_id` int(2) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_desc` varchar(255) NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `fk_Patient_patient` (`patient_id`),
  CONSTRAINT `fk_Patient_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_category`
--

LOCK TABLES `patient_category` WRITE;
/*!40000 ALTER TABLE `patient_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_sequence`
--

DROP TABLE IF EXISTS `patient_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_sequence` (
  `pat_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_sequence`
--

LOCK TABLES `patient_sequence` WRITE;
/*!40000 ALTER TABLE `patient_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_audit`
--

DROP TABLE IF EXISTS `pharmacy_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_audit` (
  `phar_item` int(11) NOT NULL AUTO_INCREMENT,
  `phar_user_id` varchar(30) NOT NULL DEFAULT '0',
  `phar_patient` varchar(30) DEFAULT NULL,
  `quant_requested` int(11) NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `date_req` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id_fk` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`phar_item`,`phar_user_id`),
  KEY `phar_user_id` (`phar_user_id`),
  KEY `fk_Pat_pharm` (`phar_patient`),
  KEY `fk_userid_8` (`user_id_fk`),
  CONSTRAINT `fk_Pat_pharm` FOREIGN KEY (`phar_patient`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `fk_item_id` FOREIGN KEY (`phar_item`) REFERENCES `pharmacy_inventory` (`item_id`),
  CONSTRAINT `fk_userid_8` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_audit`
--

LOCK TABLES `pharmacy_audit` WRITE;
/*!40000 ALTER TABLE `pharmacy_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_inventory`
--

DROP TABLE IF EXISTS `pharmacy_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_inventory` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  `item_description` varchar(255) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_price` float(10,2) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_inventory`
--

LOCK TABLES `pharmacy_inventory` WRITE;
/*!40000 ALTER TABLE `pharmacy_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_request`
--

DROP TABLE IF EXISTS `pharmacy_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_request` (
  `phar_req_id` int(11) NOT NULL AUTO_INCREMENT,
  `phar_req_quan` int(11) NOT NULL,
  `phar_item_id` int(11) NOT NULL,
  `phar_user_id` varchar(30) NOT NULL DEFAULT '0',
  `phar_req_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phar_patient` varchar(30) DEFAULT NULL,
  `user_id_fk` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`phar_req_id`),
  KEY `fk_patpharm_id2` (`phar_patient`),
  KEY `fk_user_id2` (`phar_user_id`),
  KEY `fk_userid_9` (`user_id_fk`),
  CONSTRAINT `fk_patpharm_id2` FOREIGN KEY (`phar_patient`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `fk_userid_9` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_request`
--

LOCK TABLES `pharmacy_request` WRITE;
/*!40000 ALTER TABLE `pharmacy_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radiology_exam`
--

DROP TABLE IF EXISTS `radiology_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radiology_exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(255) NOT NULL,
  `exam_description` varchar(255) NOT NULL,
  `exam_price` float(10,2) NOT NULL,
  PRIMARY KEY (`exam_id`),
  UNIQUE KEY `exam_name` (`exam_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radiology_exam`
--

LOCK TABLES `radiology_exam` WRITE;
/*!40000 ALTER TABLE `radiology_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `radiology_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radiology_request`
--

DROP TABLE IF EXISTS `radiology_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radiology_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) DEFAULT NULL,
  `user_request` varchar(30) NOT NULL DEFAULT '0',
  `exam_id` int(11) NOT NULL,
  `request_date` date NOT NULL,
  `request_status` int(11) NOT NULL,
  `user_id_fk` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`request_id`),
  KEY `fk_exam_id` (`exam_id`),
  KEY `fk_user_req` (`user_request`),
  KEY `fk_patient_id2` (`patient_id`),
  KEY `fk_userid_10` (`user_id_fk`),
  CONSTRAINT `fk_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `radiology_exam` (`exam_id`),
  CONSTRAINT `fk_patient_id2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `fk_userid_10` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radiology_request`
--

LOCK TABLES `radiology_request` WRITE;
/*!40000 ALTER TABLE `radiology_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `radiology_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_physician`
--

DROP TABLE IF EXISTS `referral_physician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referral_physician` (
  `referral_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL DEFAULT '0',
  `patient_id` varchar(30) DEFAULT NULL,
  `user_id_fk` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`referral_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_Patient_referral` (`patient_id`),
  KEY `fk_userid_3` (`user_id_fk`),
  CONSTRAINT `fk_Patient_referral` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `fk_userid_3` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_physician`
--

LOCK TABLES `referral_physician` WRITE;
/*!40000 ALTER TABLE `referral_physician` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_physician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_type` (
  `room_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) NOT NULL,
  `room_description` varchar(255) NOT NULL,
  `room_price` float NOT NULL,
  PRIMARY KEY (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type` int(11) NOT NULL,
  `room_location` varchar(255) NOT NULL,
  `occupancy_status` tinyint(11) NOT NULL,
  `maintenance_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `room_type` (`room_type`),
  KEY `fk_room_maintenance` (`maintenance_status`),
  KEY `fk_room_occupancy` (`occupancy_status`),
  CONSTRAINT `fk_room_maintenance` FOREIGN KEY (`maintenance_status`) REFERENCES `maintenance` (`maintenance_status_id`),
  CONSTRAINT `fk_room_occupancy` FOREIGN KEY (`occupancy_status`) REFERENCES `maintenance` (`maintenance_status_id`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`room_type`) REFERENCES `room_type` (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_det_lab`
--

DROP TABLE IF EXISTS `sample_det_lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_det_lab` (
  `sample_det_id` int(11) NOT NULL AUTO_INCREMENT,
  `urg_cat_fk` int(11) NOT NULL,
  `fast_id_fk` int(11) NOT NULL,
  `lab_samples` varchar(255) NOT NULL,
  PRIMARY KEY (`sample_det_id`),
  KEY `fk_urg_id` (`urg_cat_fk`),
  KEY `fk_fast_id` (`fast_id_fk`),
  CONSTRAINT `fk_fast_id` FOREIGN KEY (`fast_id_fk`) REFERENCES `fasting_cat` (`fast_id`),
  CONSTRAINT `fk_urg_id` FOREIGN KEY (`urg_cat_fk`) REFERENCES `urgency_cat` (`urg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_det_lab`
--

LOCK TABLES `sample_det_lab` WRITE;
/*!40000 ALTER TABLE `sample_det_lab` DISABLE KEYS */;
/*!40000 ALTER TABLE `sample_det_lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_categories`
--

DROP TABLE IF EXISTS `service_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_categories` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) NOT NULL,
  `service_desc` varchar(255) NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `service_name` (`service_name`),
  KEY `fk_Patient_service` (`patient_id`),
  CONSTRAINT `fk_Patient_service` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_categories`
--

LOCK TABLES `service_categories` WRITE;
/*!40000 ALTER TABLE `service_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_difference`
--

DROP TABLE IF EXISTS `time_difference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_difference` (
  `time_id` int(11) NOT NULL AUTO_INCREMENT,
  `disposition_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`time_id`),
  KEY `disposition_id` (`disposition_id`),
  CONSTRAINT `time_difference_ibfk_1` FOREIGN KEY (`disposition_id`) REFERENCES `final_disposition` (`disposition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_difference`
--

LOCK TABLES `time_difference` WRITE;
/*!40000 ALTER TABLE `time_difference` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_difference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urgency_cat`
--

DROP TABLE IF EXISTS `urgency_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urgency_cat` (
  `urg_id` int(11) NOT NULL AUTO_INCREMENT,
  `urg_name` varchar(255) NOT NULL,
  PRIMARY KEY (`urg_id`),
  UNIQUE KEY `urg_name` (`urg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urgency_cat`
--

LOCK TABLES `urgency_cat` WRITE;
/*!40000 ALTER TABLE `urgency_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `urgency_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_schedules`
--

DROP TABLE IF EXISTS `user_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_schedules` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_id_fk` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_userid_4` (`user_id_fk`),
  CONSTRAINT `fk_userid_4` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_schedules`
--

LOCK TABLES `user_schedules` WRITE;
/*!40000 ALTER TABLE `user_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sequence`
--

DROP TABLE IF EXISTS `user_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_sequence` (
  `user_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sequence`
--

LOCK TABLES `user_sequence` WRITE;
/*!40000 ALTER TABLE `user_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(30) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `contact_number` varchar(11) NOT NULL,
  `gender` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `employment_date` date NOT NULL,
  `dept` varchar(30) NOT NULL,
  `ward_assigned` varchar(30) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `type_id` (`type_id`),
  KEY `fk_dept_id2` (`dept`),
  KEY `fk_ward_ass` (`ward_assigned`),
  CONSTRAINT `fk_dept_id2` FOREIGN KEY (`dept`) REFERENCES `departments` (`dept_id`),
  CONSTRAINT `fk_ward_ass` FOREIGN KEY (`ward_assigned`) REFERENCES `wards` (`ward_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `user_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_users
BEFORE INSERT ON users
FOR EACH ROW 
BEGIN
  INSERT INTO user_sequence VALUES (NULL);
  SET NEW.user_id = CONCAT('USER-', LPAD(LAST_INSERT_ID(), 5, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vital_sequence`
--

DROP TABLE IF EXISTS `vital_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vital_sequence` (
  `vital_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`vital_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vital_sequence`
--

LOCK TABLES `vital_sequence` WRITE;
/*!40000 ALTER TABLE `vital_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `vital_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitals`
--

DROP TABLE IF EXISTS `vitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vitals` (
  `vital_id` varchar(30) NOT NULL DEFAULT '0',
  `heart_rate` varchar(255) NOT NULL DEFAULT 'n/a',
  `resp_rate` varchar(255) NOT NULL DEFAULT 'n/a',
  `blood_pres` varchar(255) NOT NULL DEFAULT 'n/a',
  `body_temp` varchar(255) NOT NULL DEFAULT 'n/a',
  `patient_id` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vital_id`),
  KEY `fk_pat_vitals` (`patient_id`),
  CONSTRAINT `fk_pat_vitals` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitals`
--

LOCK TABLES `vitals` WRITE;
/*!40000 ALTER TABLE `vitals` DISABLE KEYS */;
/*!40000 ALTER TABLE `vitals` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_vitals
BEFORE INSERT ON vitals
FOR EACH ROW 
BEGIN
  INSERT INTO vital_sequence VALUES (NULL);
  SET NEW.vital_id = CONCAT('VITAL-', LPAD(LAST_INSERT_ID(), 3, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wards` (
  `ward_id` varchar(30) NOT NULL DEFAULT '0',
  `ward_name` varchar(255) NOT NULL,
  `ward_desc` varchar(255) NOT NULL,
  `ward_head` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ward_id`),
  KEY `fk_dept_head` (`ward_head`),
  CONSTRAINT `fk_dept_head` FOREIGN KEY (`ward_head`) REFERENCES `nurses` (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_wards
BEFORE INSERT ON wards
FOR EACH ROW 
BEGIN
  INSERT INTO wards_sequence VALUES (NULL);
  SET NEW.ward_id = CONCAT('WARD-', LPAD(LAST_INSERT_ID(), 3, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wards_sequence`
--

DROP TABLE IF EXISTS `wards_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wards_sequence` (
  `wards_seq_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`wards_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards_sequence`
--

LOCK TABLES `wards_sequence` WRITE;
/*!40000 ALTER TABLE `wards_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `wards_sequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-04 23:08:27
