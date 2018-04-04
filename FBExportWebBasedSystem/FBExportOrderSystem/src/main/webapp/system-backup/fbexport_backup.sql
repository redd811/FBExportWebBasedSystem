-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: fbexport
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB

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
-- Current Database: `fbexport`
--

/*!40000 DROP DATABASE IF EXISTS `fbexport`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fbexport` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fbexport`;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `FKse269fvw3ft70lc8sf7mp5kpo` (`customer_id`),
  CONSTRAINT `FKse269fvw3ft70lc8sf7mp5kpo` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'ADMIN',0),(2,'CUSTOMER',1),(3,'EMPLOYEE',3);
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `cart_cart_id` bigint(20) NOT NULL,
  `items_item_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_pypafu0nle8455vljl95ae63p` (`items_item_id`),
  KEY `FK9846r70h5gdhsnpd4ljwl3hti` (`cart_cart_id`),
  CONSTRAINT `FK9846r70h5gdhsnpd4ljwl3hti` FOREIGN KEY (`cart_cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `FKg0vcyxnrx30vy32hux1yds9o0` FOREIGN KEY (`items_item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `online` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image_link` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `cart_cart_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh8td8fqfv3u9171e9oqye30fv` (`cart_cart_id`),
  CONSTRAINT `FKh8td8fqfv3u9171e9oqye30fv` FOREIGN KEY (`cart_cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'asd','asd','Australia','1700',18,'93','alfredoborja81194@gmail.com','09996668084','','Admin','FEMALE','Admin','Admin','','$2a$10$xOtAK0nAIPt.GTKMA5FnLeQsLW.8gExpDEgIqHjUuz95KN47usovi','/profile-img-customer/becfb907888c8d48f8328dba7edf6969.jpg','Customer1',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notifications`
--

DROP TABLE IF EXISTS `customer_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_notifications` (
  `customer_id` bigint(20) NOT NULL,
  `notifications_notification_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ql9mx0i1ht5ir1kuntp4lhoja` (`notifications_notification_id`),
  KEY `FKekx2r4gmy2a6dsrjpcit8ofvs` (`customer_id`),
  CONSTRAINT `FKekx2r4gmy2a6dsrjpcit8ofvs` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKmgal9vskl36pm1mesn967tuup` FOREIGN KEY (`notifications_notification_id`) REFERENCES `notification` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notifications`
--

LOCK TABLES `customer_notifications` WRITE;
/*!40000 ALTER TABLE `customer_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_shipping_addresses`
--

DROP TABLE IF EXISTS `customer_shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_shipping_addresses` (
  `customer_id` bigint(20) NOT NULL,
  `shipping_addresses_shipping_address_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_bwqlbuefsx221dfemluuq0h2u` (`shipping_addresses_shipping_address_id`),
  KEY `FKha6q0d4r9rv2uu1xb5vfr5dhk` (`customer_id`),
  CONSTRAINT `FKha6q0d4r9rv2uu1xb5vfr5dhk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKrqtmdfdxbtbdlmsm0m8suiv1f` FOREIGN KEY (`shipping_addresses_shipping_address_id`) REFERENCES `shipping_address` (`shipping_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_shipping_addresses`
--

LOCK TABLES `customer_shipping_addresses` WRITE;
/*!40000 ALTER TABLE `customer_shipping_addresses` DISABLE KEYS */;
INSERT INTO `customer_shipping_addresses` VALUES (1,1);
/*!40000 ALTER TABLE `customer_shipping_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `online` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image_link` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (0,'asd','asd','asd','1700',23,'63','Admin1@gmail.com','09996668084','','asd','MALE','asd','asd','','$2a$10$w921HXavi.mOnflh.yIQNePCcnsgP50S7BwkZr9Zknd6IVzAcKflK',NULL,'Admin1','Admin'),(3,'asd','Employee','Afghanistan','1700',18,'93','Employee1@gmail.com','09996668084','','Em','MALE','asd','asd','\0','$2a$10$y2vOPngGdkN4thOvAyKz/OqkSiHqVGNLLdIGoz1Q8E1WyyEsKJpqa','/resources/admin/img/profile-male.jpg','Employee1','asd');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_system_notification_list`
--

DROP TABLE IF EXISTS `employee_system_notification_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_system_notification_list` (
  `employee_id` bigint(20) NOT NULL,
  `system_notification_list_notification_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ii8tfx0hep1nc5wfh9u7pn1g5` (`system_notification_list_notification_id`),
  KEY `FK3884ke73fgnob9j1jlcckjnx3` (`employee_id`),
  CONSTRAINT `FK3884ke73fgnob9j1jlcckjnx3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FKk9xxpgfs61agh0jgkcxwoic3j` FOREIGN KEY (`system_notification_list_notification_id`) REFERENCES `system_notification` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_system_notification_list`
--

LOCK TABLES `employee_system_notification_list` WRITE;
/*!40000 ALTER TABLE `employee_system_notification_list` DISABLE KEYS */;
INSERT INTO `employee_system_notification_list` VALUES (0,1),(0,2),(0,3),(0,4),(0,5),(0,7),(0,9),(0,11),(0,13),(0,15),(0,17),(0,19),(0,21),(0,23),(0,25),(0,27),(0,29),(0,31),(0,33),(0,35),(0,37),(0,39),(0,41),(0,43),(0,45),(0,47),(0,49),(0,51),(0,53),(0,55),(0,57),(0,59),(0,61),(3,6),(3,8),(3,10),(3,12),(3,14),(3,16),(3,18),(3,20),(3,22),(3,24),(3,26),(3,28),(3,30),(3,32),(3,34),(3,36),(3,38),(3,40),(3,42),(3,44),(3,46),(3,48),(3,50),(3,52),(3,54),(3,56),(3,58),(3,60),(3,62);
/*!40000 ALTER TABLE `employee_system_notification_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) NOT NULL,
  `sequence_next_hi_value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('account',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `weight` double NOT NULL,
  `weight_type` varchar(255) DEFAULT NULL,
  `product_product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK6fok9mmtsmu22sejwqg8cq6u3` (`product_product_id`),
  CONSTRAINT `FK6fok9mmtsmu22sejwqg8cq6u3` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `is_seen` bit(1) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_ordered` date DEFAULT NULL,
  `date_paid` date DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `is_paid` bit(1) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `total_items` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `total_weight` double NOT NULL,
  `cart_cart_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `shipping_shipping_id` bigint(20) DEFAULT NULL,
  `shipping_address_shipping_address_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKtg32cl8e1f2afe83we3bqrw2h` (`cart_cart_id`),
  KEY `FK624gtjin3po807j3vix093tlf` (`customer_id`),
  KEY `FK8o21kg6tvreikslhq6n0o5jxf` (`shipping_shipping_id`),
  KEY `FK89wuak53n6o826m6ltksv9gj9` (`shipping_address_shipping_address_id`),
  CONSTRAINT `FK624gtjin3po807j3vix093tlf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK89wuak53n6o826m6ltksv9gj9` FOREIGN KEY (`shipping_address_shipping_address_id`) REFERENCES `shipping_address` (`shipping_address_id`),
  CONSTRAINT `FK8o21kg6tvreikslhq6n0o5jxf` FOREIGN KEY (`shipping_shipping_id`) REFERENCES `shipping` (`shipping_id`),
  CONSTRAINT `FKtg32cl8e1f2afe83we3bqrw2h` FOREIGN KEY (`cart_cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_of_delivery` date DEFAULT NULL,
  `date_posted` date DEFAULT NULL,
  `date_registered` date DEFAULT NULL,
  `description` longtext,
  `is_posted` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `product_image_link` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `supplier_contact_number` varchar(255) DEFAULT NULL,
  `weight` double NOT NULL,
  `rating_rating_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKg0klkuq150g13y1o1porbpxrj` (`rating_rating_id`),
  CONSTRAINT `FKg0klkuq150g13y1o1porbpxrj` FOREIGN KEY (`rating_rating_id`) REFERENCES `rating` (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_preview_image_links`
--

DROP TABLE IF EXISTS `product_preview_image_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_preview_image_links` (
  `product_product_id` bigint(20) NOT NULL,
  `preview_image_links` varchar(255) DEFAULT NULL,
  KEY `FKdd7qp30sc55wvg24rv6vj3lpm` (`product_product_id`),
  CONSTRAINT `FKdd7qp30sc55wvg24rv6vj3lpm` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_preview_image_links`
--

LOCK TABLES `product_preview_image_links` WRITE;
/*!40000 ALTER TABLE `product_preview_image_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_preview_image_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product_stocks`
--

DROP TABLE IF EXISTS `product_product_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_product_stocks` (
  `product_product_id` bigint(20) NOT NULL,
  `product_stocks_product_stock_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_3fawfyqkmwapjx0yk1n6ty2fq` (`product_stocks_product_stock_id`),
  KEY `FKp08vhgf807mfbfnxdo63qwyb0` (`product_product_id`),
  CONSTRAINT `FKp08vhgf807mfbfnxdo63qwyb0` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKs43xvxaockusequ4njcbdw5ap` FOREIGN KEY (`product_stocks_product_stock_id`) REFERENCES `product_stock` (`product_stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product_stocks`
--

LOCK TABLES `product_product_stocks` WRITE;
/*!40000 ALTER TABLE `product_product_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_product_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stock`
--

DROP TABLE IF EXISTS `product_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_stock` (
  `product_stock_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `weight` double NOT NULL,
  `weight_type` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`product_stock_id`),
  KEY `FKlpu1phje1bb3y9ww8k9fut4gh` (`product_id`),
  CONSTRAINT `FKlpu1phje1bb3y9ww8k9fut4gh` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stock`
--

LOCK TABLES `product_stock` WRITE;
/*!40000 ALTER TABLE `product_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_reviews`
--

DROP TABLE IF EXISTS `rating_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_reviews` (
  `rating_rating_id` bigint(20) NOT NULL,
  `reviews_review_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_3hrujf10stro0omcr6phogocb` (`reviews_review_id`),
  KEY `FKt68wy7lknb9tjf291c5xypqkc` (`rating_rating_id`),
  CONSTRAINT `FKlofrye5pgcbvjp52s6ob1dxop` FOREIGN KEY (`reviews_review_id`) REFERENCES `review` (`review_id`),
  CONSTRAINT `FKt68wy7lknb9tjf291c5xypqkc` FOREIGN KEY (`rating_rating_id`) REFERENCES `rating` (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_reviews`
--

LOCK TABLES `rating_reviews` WRITE;
/*!40000 ALTER TABLE `rating_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rate` double NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping` (
  `shipping_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `arrival_date` date DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `shipment_status` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `imo_number` varchar(255) DEFAULT NULL,
  `mmsi_number` varchar(255) DEFAULT NULL,
  `vessel_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shipping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_address` (
  `shipping_address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `default_shipping_address` bit(1) NOT NULL,
  `receiver_full_name` varchar(255) DEFAULT NULL,
  `shipping_instructions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shipping_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
INSERT INTO `shipping_address` VALUES (1,'asd','asd','Australia','1700','User Account','93','alfredoborja81194@gmail.com','09996668084','','Admin Admin Admin','specify your shipping instructions by editing the card');
/*!40000 ALTER TABLE `shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_log`
--

DROP TABLE IF EXISTS `shipping_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_log` (
  `shipping_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` longtext,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `is_complete` bit(1) NOT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`shipping_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_log`
--

LOCK TABLES `shipping_log` WRITE;
/*!40000 ALTER TABLE `shipping_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_shipping_log`
--

DROP TABLE IF EXISTS `shipping_shipping_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_shipping_log` (
  `shipping_shipping_id` bigint(20) NOT NULL,
  `shipping_log_shipping_log_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_763o5kp8bux2vdy6u4vrir65s` (`shipping_log_shipping_log_id`),
  KEY `FK7mf21i418hg2qn6kgrmjqpnkh` (`shipping_shipping_id`),
  CONSTRAINT `FK7mf21i418hg2qn6kgrmjqpnkh` FOREIGN KEY (`shipping_shipping_id`) REFERENCES `shipping` (`shipping_id`),
  CONSTRAINT `FKq6s1ssjgtx0cpqylwbcgadwdv` FOREIGN KEY (`shipping_log_shipping_log_id`) REFERENCES `shipping_log` (`shipping_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_shipping_log`
--

LOCK TABLES `shipping_shipping_log` WRITE;
/*!40000 ALTER TABLE `shipping_shipping_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_shipping_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `system_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(255) DEFAULT NULL,
  `date_occured` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time_occured` datetime DEFAULT NULL,
  PRIMARY KEY (`system_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (1,'SYSTEM','2018-04-03','System Start','2018-04-03 16:28:36'),(2,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:29:26'),(3,'SYSTEM','2018-04-03','System Start','2018-04-03 16:29:42'),(4,'SETTINGS','2018-04-03','asd asd backup the system','2018-04-03 16:32:39'),(5,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-03 16:32:46'),(6,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:38:51'),(7,'SYSTEM','2018-04-03','System Start','2018-04-03 16:39:17'),(8,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-03 16:43:56'),(9,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-03 16:45:49'),(10,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:46:14'),(11,'SYSTEM','2018-04-03','System Start','2018-04-03 16:46:34'),(12,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-03 16:48:00'),(13,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:49:02'),(14,'SYSTEM','2018-04-03','System Start','2018-04-03 16:49:24'),(15,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:51:24'),(16,'SYSTEM','2018-04-03','System Start','2018-04-03 16:51:44'),(17,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-03 16:53:02'),(18,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:54:13'),(19,'SYSTEM','2018-04-03','System Start','2018-04-03 16:54:29'),(20,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-03 16:55:29'),(21,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 3 minutes','2018-04-03 16:55:38'),(22,'SYSTEM','2018-04-03','Auto logout called on asd asd','2018-04-03 17:00:00'),(23,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-03 17:00:29'),(24,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 3 minutes','2018-04-03 17:00:36'),(25,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-03 17:00:44'),(26,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 3 minutes','2018-04-03 17:00:56'),(27,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:09:43'),(28,'SYSTEM','2018-04-03','System Start','2018-04-03 17:10:06'),(29,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 3 minutes','2018-04-03 17:11:23'),(30,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:12:41'),(31,'SYSTEM','2018-04-03','System Start','2018-04-03 17:13:26'),(32,'SYSTEM','2018-04-03','Auto logout called on asd asd','2018-04-03 17:14:30'),(33,'SETTINGS','2018-04-03','asd asd change the system backup time to 12:00 AM and logout time to 5 minutes','2018-04-03 17:15:26'),(34,'SETTINGS','2018-04-03','asd asd change the system backup time to 05:20 PM and logout time to 3 minutes','2018-04-03 17:16:01'),(35,'SYSTEM','2018-04-03','Auto logout called on asd asd','2018-04-03 17:19:04'),(36,'SETTINGS','2018-04-03','asd asd change the system backup time to 05:23 PM and logout time to 30 minutes','2018-04-03 17:22:00'),(37,'SETTINGS','2018-04-03','asd asd backup the system','2018-04-03 17:24:16'),(38,'SETTINGS','2018-04-03','asd asd change the system backup time to 05:25 PM and logout time to 30 minutes','2018-04-03 17:24:31'),(39,'SETTINGS','2018-04-03','asd asd backup the system','2018-04-03 17:29:20'),(40,'SETTINGS','2018-04-03','asd asd backup the system','2018-04-03 17:29:57'),(41,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:32:36'),(42,'SYSTEM','2018-04-03','System Start','2018-04-03 17:32:57'),(43,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:35:11'),(44,'SYSTEM','2018-04-03','System Start','2018-04-03 17:35:28'),(45,'SETTINGS','2018-04-03','asd asd change the system backup time to 05:40 PM and logout time to 30 minutes','2018-04-03 17:37:25'),(46,'SYSTEM','2018-04-03','Automatic System Backup','2018-04-03 17:40:40'),(47,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:46:40'),(48,'SYSTEM','2018-04-03','System Start','2018-04-03 17:47:01'),(49,'SETTINGS','2018-04-03','asd asd change the system backup time to 05:49 PM and logout time to 30 minutes','2018-04-03 17:47:54'),(50,'SYSTEM','2018-04-03','Automatic System Backup','2018-04-03 17:49:14'),(51,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:52:32'),(52,'SYSTEM','2018-04-03','System Start','2018-04-03 18:03:27'),(53,'SETTINGS','2018-04-03','asd asd change the system backup time to 05:49 PM and logout time to 30 minutes','2018-04-03 18:05:24'),(54,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 18:06:06'),(55,'SYSTEM','2018-04-03','System Start','2018-04-03 18:06:29'),(56,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 18:07:21'),(57,'SYSTEM','2018-04-03','System Start','2018-04-03 18:07:38'),(58,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 18:14:33'),(59,'SYSTEM','2018-04-03','System Start','2018-04-03 18:14:56'),(60,'SETTINGS','2018-04-03','asd asd change the system backup time to 05:49 PM and logout time to 30 minutes','2018-04-03 18:19:50'),(61,'SETTINGS','2018-04-03','asd asd backup the system','2018-04-03 18:20:44'),(62,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 18:21:47'),(63,'SYSTEM','2018-04-03','System Start','2018-04-03 18:22:07'),(64,'SETTINGS','2018-04-03','asd asd restored the backup','2018-04-03 18:25:48'),(65,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 18:26:13'),(66,'SYSTEM','2018-04-03','System Start','2018-04-03 19:40:36'),(67,'SETTINGS','2018-04-03','asd asd restored the backup','2018-04-03 19:51:27'),(68,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 19:59:10'),(69,'SYSTEM','2018-04-03','System Start','2018-04-03 19:59:48'),(70,'SETTINGS','2018-04-03','asd asd restored the backup','2018-04-03 20:07:33'),(71,'SETTINGS','2018-04-03','asd asd change the system backup time to 05:49 PM and logout time to 30 minutes','2018-04-03 20:07:42'),(72,'SETTINGS','2018-04-03','asd asd change the system backup time to 05:49 PM and logout time to 30 minutes','2018-04-03 20:31:10'),(73,'SETTINGS','2018-04-03','asd asd restored the backup','2018-04-03 20:33:07'),(74,'SETTINGS','2018-04-03','asd asd backup the system','2018-04-03 20:34:48'),(75,'SETTINGS','2018-04-03','asd asd change the system backup time to 05:49 PM and logout time to 30 minutes','2018-04-03 20:34:50'),(76,'SETTINGS','2018-04-03','asd asd change the system backup time to 08:50 PM and logout time to 30 minutes','2018-04-03 20:44:26'),(77,'SETTINGS','2018-04-03','asd asd change the system backup time to 09:00 PM and logout time to 30 minutes','2018-04-03 20:58:22'),(78,'SETTINGS','2018-04-03','asd asd backup the system','2018-04-03 21:00:42'),(79,'SETTINGS','2018-04-03','asd asd change the system backup time to 09:02 PM and logout time to 30 minutes','2018-04-03 21:01:30'),(80,'SETTINGS','2018-04-03','asd asd change the system backup time to 09:10 PM and logout time to 30 minutes','2018-04-03 21:07:23'),(81,'SETTINGS','2018-04-03','asd asd backup the system','2018-04-03 21:19:53'),(82,'SETTINGS','2018-04-03','asd asd change the system backup time to 09:22 PM and logout time to 30 minutes','2018-04-03 21:20:30'),(83,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 21:46:51'),(84,'SYSTEM','2018-04-03','System Start','2018-04-03 21:48:10'),(85,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 21:48:22'),(86,'SYSTEM','2018-04-03','System Start','2018-04-03 21:58:44'),(87,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 21:58:53'),(88,'SYSTEM','2018-04-03','System Start','2018-04-03 22:00:54'),(89,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 22:01:00'),(90,'SYSTEM','2018-04-03','System Start','2018-04-03 22:03:09'),(91,'SETTINGS','2018-04-03','asd asd change the system backup time to 10:09 PM and logout time to 30 minutes','2018-04-03 22:06:48'),(92,'SETTINGS','2018-04-03','asd asd restored the backup','2018-04-03 22:14:15'),(93,'SETTINGS','2018-04-03','asd asd change the system backup time to 10:09 PM and logout time to 3 minutes','2018-04-03 22:14:34'),(94,'SYSTEM','2018-04-03','Auto logout called on asd asd','2018-04-03 22:17:38'),(95,'SETTINGS','2018-04-03','asd asd change the system backup time to 10:22 PM and logout time to 3 minutes','2018-04-03 22:20:56'),(96,'SETTINGS','2018-04-03','asd asd change the system backup time to 10:22 PM and logout time to 30 minutes','2018-04-03 22:21:07'),(97,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 22:25:09'),(98,'SYSTEM','2018-04-03','System Start','2018-04-03 22:26:14'),(99,'SETTINGS','2018-04-03','asd asd change the system backup time to 10:29 PM and logout time to 30 minutes','2018-04-03 22:27:01'),(100,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 22:30:34'),(101,'SYSTEM','2018-04-03','System Start','2018-04-03 22:31:03'),(102,'SETTINGS','2018-04-03','asd asd change the system backup time to 10:33 PM and logout time to 30 minutes','2018-04-03 22:31:59'),(103,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 22:35:05'),(104,'SYSTEM','2018-04-03','System Start','2018-04-03 22:36:05'),(105,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 22:37:01'),(106,'SYSTEM','2018-04-03','System Start','2018-04-03 22:41:34'),(107,'SETTINGS','2018-04-03','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-03 22:42:53'),(108,'SETTINGS','2018-04-04','asd asd restored the backup','2018-04-04 07:05:38'),(109,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:10:07'),(110,'SYSTEM','2018-04-04','System Start','2018-04-04 07:10:37'),(111,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:13:45'),(112,'SYSTEM','2018-04-04','System Start','2018-04-04 07:14:10'),(113,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:17:33'),(114,'SYSTEM','2018-04-04','System Start','2018-04-04 07:17:50'),(115,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 07:18:41'),(116,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:19:30'),(117,'SYSTEM','2018-04-04','System Start','2018-04-04 07:19:46'),(118,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 07:20:31'),(119,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:21:38'),(120,'SYSTEM','2018-04-04','System Start','2018-04-04 07:21:59'),(121,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 07:22:31'),(122,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:22:46'),(123,'SYSTEM','2018-04-04','System Start','2018-04-04 07:23:17'),(124,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 07:24:31'),(125,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:25:23'),(126,'SYSTEM','2018-04-04','System Start','2018-04-04 07:25:46'),(127,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 07:27:07'),(128,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:28:58'),(129,'SYSTEM','2018-04-04','System Start','2018-04-04 07:29:15'),(130,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 07:30:23'),(131,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:30:46'),(132,'SYSTEM','2018-04-04','System Start','2018-04-04 07:31:04'),(133,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 07:31:55'),(134,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:32:40'),(135,'SYSTEM','2018-04-04','System Start','2018-04-04 07:32:59'),(136,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:34:05'),(137,'SYSTEM','2018-04-04','System Start','2018-04-04 07:34:23'),(138,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 07:35:38'),(139,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:45:03'),(140,'SYSTEM','2018-04-04','System Start','2018-04-04 07:45:27'),(141,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:47:09'),(142,'SYSTEM','2018-04-04','System Start','2018-04-04 07:47:31'),(143,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:49:35'),(144,'SYSTEM','2018-04-04','System Start','2018-04-04 07:50:06'),(145,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 07:52:47'),(146,'SYSTEM','2018-04-04','System Start','2018-04-04 07:53:12'),(147,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 08:01:15'),(148,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 08:12:05'),(149,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 08:13:17'),(150,'SYSTEM','2018-04-04','System Start','2018-04-04 08:13:35'),(151,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 08:14:06'),(152,'SETTINGS','2018-04-04','asd asd change the system backup time to 10:44 PM and logout time to 30 minutes','2018-04-04 08:15:10'),(153,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 08:29:20'),(154,'SYSTEM','2018-04-04','System Start','2018-04-04 08:29:41'),(155,'SETTINGS','2018-04-04','asd asd export database','2018-04-04 08:33:24');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notification`
--

DROP TABLE IF EXISTS `system_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_notification` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `is_seen` bit(1) NOT NULL,
  `system_notification_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
INSERT INTO `system_notification` VALUES (1,'2018-04-03 20:07:33','System restore success','System Restore','','SYSTEM_BACKUP'),(2,'2018-04-03 20:07:41','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(3,'2018-04-03 20:31:10','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(4,'2018-04-03 20:33:06','System restore success','System Restore','','SYSTEM_BACKUP'),(5,'2018-04-03 20:34:47','System backup success','System Backup','','SYSTEM_BACKUP'),(6,'2018-04-03 20:34:47','System backup success','System Backup','','SYSTEM_BACKUP'),(7,'2018-04-03 20:34:50','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(8,'2018-04-03 20:34:50','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(9,'2018-04-03 20:44:26','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(10,'2018-04-03 20:44:26','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(11,'2018-04-03 20:58:22','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(12,'2018-04-03 20:58:22','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(13,'2018-04-03 21:00:40','System backup success','System Backup','','SYSTEM_BACKUP'),(14,'2018-04-03 21:00:40','System backup success','System Backup','\0','SYSTEM_BACKUP'),(15,'2018-04-03 21:01:29','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(16,'2018-04-03 21:01:29','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(17,'2018-04-03 21:07:22','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(18,'2018-04-03 21:07:22','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(19,'2018-04-03 21:19:51','System backup success','System Backup','','SYSTEM_BACKUP'),(20,'2018-04-03 21:19:51','System backup success','System Backup','\0','SYSTEM_BACKUP'),(21,'2018-04-03 21:20:30','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(22,'2018-04-03 21:20:30','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(23,'2018-04-03 22:06:47','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(24,'2018-04-03 22:06:47','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(25,'2018-04-03 22:14:15','System restore success','System Restore','','SYSTEM_BACKUP'),(26,'2018-04-03 22:14:15','System restore success','System Restore','\0','SYSTEM_BACKUP'),(27,'2018-04-03 22:14:34','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(28,'2018-04-03 22:14:34','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(29,'2018-04-03 22:20:55','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(30,'2018-04-03 22:20:55','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(31,'2018-04-03 22:21:07','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(32,'2018-04-03 22:21:07','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(33,'2018-04-03 22:27:00','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(34,'2018-04-03 22:27:00','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(35,'2018-04-03 22:31:58','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(36,'2018-04-03 22:31:58','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(37,'2018-04-03 22:42:51','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(38,'2018-04-03 22:42:51','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(39,'2018-04-04 07:18:40','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(40,'2018-04-04 07:18:40','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(41,'2018-04-04 07:20:30','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(42,'2018-04-04 07:20:30','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(43,'2018-04-04 07:22:30','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(44,'2018-04-04 07:22:30','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(45,'2018-04-04 07:24:30','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(46,'2018-04-04 07:24:30','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(47,'2018-04-04 07:27:07','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(48,'2018-04-04 07:27:07','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(49,'2018-04-04 07:30:22','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(50,'2018-04-04 07:30:22','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(51,'2018-04-04 07:31:54','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(52,'2018-04-04 07:31:54','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(53,'2018-04-04 07:35:37','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(54,'2018-04-04 07:35:37','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(55,'2018-04-04 08:01:14','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(56,'2018-04-04 08:01:14','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(57,'2018-04-04 08:12:04','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(58,'2018-04-04 08:12:04','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(59,'2018-04-04 08:14:05','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(60,'2018-04-04 08:14:05','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(61,'2018-04-04 08:15:10','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(62,'2018-04-04 08:15:10','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP');
/*!40000 ALTER TABLE `system_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `system_settings_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `logout_time` time DEFAULT '00:03:00',
  `system_backup_time` time DEFAULT '00:00:00',
  PRIMARY KEY (`system_settings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (1,'00:30:00','22:44:00');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access_log`
--

DROP TABLE IF EXISTS `user_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_access_log` (
  `user_access_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_occured` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `time_occured` time DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_access_log_id`),
  KEY `FK4jo8eq6diu8mwg6a3fekhm47y` (`employee_id`),
  CONSTRAINT `FK4jo8eq6diu8mwg6a3fekhm47y` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_log`
--

LOCK TABLES `user_access_log` WRITE;
/*!40000 ALTER TABLE `user_access_log` DISABLE KEYS */;
INSERT INTO `user_access_log` VALUES (1,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','16:32:04',0),(2,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','17:00:17',0),(3,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','17:14:57',0),(4,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','17:21:35',0),(5,'2018-04-03','asd asd has logged out','0:0:0:0:0:0:0:1','18:26:04',0),(6,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','19:44:06',0),(7,'2018-04-03','asd asd has logged out','0:0:0:0:0:0:0:1','20:08:35',0),(8,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','20:30:23',0),(9,'2018-04-03','asd asd has logged out','0:0:0:0:0:0:0:1','20:33:11',0),(10,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','20:33:48',0),(11,'2018-04-03','asd asd has logged out','0:0:0:0:0:0:0:1','20:34:55',0),(12,'2018-04-03','Em asd has logged in','0:0:0:0:0:0:0:1','20:35:51',3),(13,'2018-04-03','Em asd has logged out','0:0:0:0:0:0:0:1','20:36:03',3),(14,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','20:42:44',0),(15,'2018-04-03','asd asd has logged out','0:0:0:0:0:0:0:1','20:42:51',0),(16,'2018-04-03','Em asd has logged in','0:0:0:0:0:0:0:1','20:43:00',3),(17,'2018-04-03','Em asd has logged out','0:0:0:0:0:0:0:1','20:43:23',3),(18,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','20:43:31',0),(19,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','22:06:22',0),(20,'2018-04-03','asd asd has logged in','0:0:0:0:0:0:0:1','22:17:52',0),(21,'2018-04-04','asd asd has logged out','0:0:0:0:0:0:0:1','07:05:59',0),(22,'2018-04-04','asd asd has logged in','0:0:0:0:0:0:0:1','07:06:06',0);
/*!40000 ALTER TABLE `user_access_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-04  8:34:16
