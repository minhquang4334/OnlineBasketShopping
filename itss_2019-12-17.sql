# ************************************************************
# Sequel Pro SQL dump
# Version 5426
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.13)
# Database: itss
# Generation Time: 2019-12-17 16:00:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;

INSERT INTO `admins` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `created_at`, `updated_at`)
VALUES
	(1,'admin@gmail.com','$2a$11$muLgX1oLuYzBSnxDebNVJ.WpOi/Aqk19yPoWJnJjPIsQzflRjl0CW',NULL,NULL,NULL,'2019-12-03 23:12:50','2019-12-03 23:12:50');

/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ar_internal_metadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ar_internal_metadata`;

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`)
VALUES
	('environment','development','2019-12-03 23:06:04','2019-12-03 23:06:04');

/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table colors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `colors`;

CREATE TABLE `colors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;

INSERT INTO `colors` (`id`, `color`, `created_at`, `updated_at`)
VALUES
	(1,'blue','2019-12-03 23:39:54','2019-12-03 23:39:54'),
	(2,'red','2019-12-17 22:15:06','2019-12-17 22:15:06'),
	(3,'yellow','2019-12-17 22:15:11','2019-12-17 22:15:11'),
	(4,'green','2019-12-17 22:15:20','2019-12-17 22:15:20');

/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_model_id` (`model_id`),
  KEY `index_comments_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_03de2dc08c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_6fc075b61c` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table detail_models
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detail_models`;

CREATE TABLE `detail_models` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `size_id` bigint(20) DEFAULT NULL,
  `color_id` bigint(20) DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_detail_models_on_size_id` (`size_id`),
  KEY `index_detail_models_on_color_id` (`color_id`),
  KEY `index_detail_models_on_model_id` (`model_id`),
  CONSTRAINT `fk_rails_31568787b2` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`),
  CONSTRAINT `fk_rails_7c36f0e920` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`),
  CONSTRAINT `fk_rails_dc21261d90` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `detail_models` WRITE;
/*!40000 ALTER TABLE `detail_models` DISABLE KEYS */;

INSERT INTO `detail_models` (`id`, `price`, `quantity`, `size_id`, `color_id`, `model_id`, `created_at`, `updated_at`)
VALUES
	(2,'10000',10,1,1,2,'2019-12-11 14:31:45','2019-12-11 14:31:45'),
	(3,'10000',5,1,1,3,'2019-12-11 23:11:16','2019-12-11 23:11:16');

/*!40000 ALTER TABLE `detail_models` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table models
# ------------------------------------------------------------

DROP TABLE IF EXISTS `models`;

CREATE TABLE `models` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;

INSERT INTO `models` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`, `price`)
VALUES
	(2,'Model 123','asdasd','Screenshot_from_2019-12-06_10-13-21.png','2019-12-11 13:58:13','2019-12-11 13:59:30',1234),
	(3,'model 2','ádasd','1565271561560.jpg--il_food_delivery_cercala_crescita_con_le_fusioni.jpg','2019-12-11 22:08:41','2019-12-11 22:08:41',20000);

/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `detail_model_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_details_on_order_id` (`order_id`),
  KEY `index_order_details_on_detail_model_id` (`detail_model_id`),
  CONSTRAINT `fk_rails_45cd0fd8d3` FOREIGN KEY (`detail_model_id`) REFERENCES `detail_models` (`id`),
  CONSTRAINT `fk_rails_e5976611fd` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;

INSERT INTO `order_details` (`id`, `quantity`, `order_id`, `detail_model_id`, `created_at`, `updated_at`)
VALUES
	(11,3,78,2,'2019-12-11 22:10:04','2019-12-11 22:10:04'),
	(12,2,79,2,'2019-12-11 22:10:24','2019-12-11 22:10:24'),
	(13,2,80,2,'2019-12-10 22:13:42','2019-12-10 22:13:42'),
	(14,2,81,2,'2019-12-10 22:13:43','2019-12-10 22:13:43'),
	(15,2,82,2,'2019-12-09 22:13:44','2019-12-09 22:13:44'),
	(16,2,83,3,'2019-12-11 23:11:38','2019-12-11 23:11:38'),
	(17,2,84,3,'2019-12-11 23:11:40','2019-12-11 23:11:40'),
	(18,3,86,3,'2019-12-17 22:47:05','2019-12-17 22:47:05'),
	(19,2,86,2,'2019-12-17 22:47:05','2019-12-17 22:47:05'),
	(20,3,87,3,'2019-12-17 22:54:23','2019-12-17 22:54:23'),
	(21,2,87,2,'2019-12-17 22:54:23','2019-12-17 22:54:23'),
	(22,3,88,3,'2019-12-17 22:55:27','2019-12-17 22:55:27'),
	(23,2,88,2,'2019-12-17 22:55:27','2019-12-17 22:55:27');

/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `receive_name` varchar(255) DEFAULT NULL,
  `payment_type_id` bigint(20) DEFAULT NULL,
  `shipping_type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_payment_type_id` (`payment_type_id`),
  KEY `index_orders_on_shipping_type_id` (`shipping_type_id`),
  KEY `index_orders_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_1bd2d26de1` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`),
  CONSTRAINT `fk_rails_5e18236ea2` FOREIGN KEY (`shipping_type_id`) REFERENCES `shipping_types` (`id`),
  CONSTRAINT `fk_rails_f868b47f6a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `status`, `address`, `phone_number`, `payment_id`, `receive_name`, `payment_type_id`, `shipping_type_id`, `user_id`, `created_at`, `updated_at`, `price`)
VALUES
	(78,0,'ha noi',384031786,123235,'duy',1,1,1,'2019-12-11 22:10:04','2019-12-11 22:10:04',100000),
	(79,0,'ha noi',384031786,123235,'duy',1,1,1,'2019-12-11 22:10:24','2019-12-11 22:10:24',100000),
	(80,0,'ha noi',384031786,123235,'duy',1,1,1,'2019-12-10 22:13:42','2019-12-10 22:13:42',100000),
	(81,0,'ha noi',384031786,123235,'duy',1,1,1,'2019-12-10 22:13:43','2019-12-10 22:13:43',100000),
	(82,0,'ha noi',384031786,123235,'duy',1,1,1,'2019-12-09 22:13:44','2019-12-09 22:13:44',100000),
	(83,0,'ha noi',384031786,123235,'duy',1,1,1,'2019-12-11 23:11:38','2019-12-11 23:11:38',100000),
	(84,0,'ha noi',384031786,123235,'duy',1,1,1,'2019-12-11 23:11:40','2019-12-11 23:11:40',100000),
	(85,1,'',NULL,105228,' ',1,1,23,'2019-12-17 22:42:05','2019-12-17 22:42:05',83702),
	(86,1,'abcandsads',23244242,142121,'quang hoang',1,1,18,'2019-12-17 22:47:05','2019-12-17 22:47:05',62468),
	(87,1,'Nguyen hanh Van Tu',223234,127600,'quang asdsadas',1,1,49,'2019-12-17 22:54:23','2019-12-17 22:54:23',62468),
	(88,1,'sadasdsa',23232,135298,'quang XZX',1,1,31,'2019-12-17 22:55:27','2019-12-17 22:55:27',62468);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payment_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_types`;

CREATE TABLE `payment_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;

INSERT INTO `payment_types` (`id`, `payment_type`)
VALUES
	(1,'internet banking');

/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_questions_on_user_id` (`user_id`),
  KEY `index_questions_on_admin_id` (`admin_id`),
  CONSTRAINT `fk_rails_047ab75908` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20191022159999'),
	('20191022160000'),
	('20191022161438'),
	('20191022161552'),
	('20191022161629'),
	('20191022161656'),
	('20191022161806'),
	('20191022161958'),
	('20191022161960'),
	('20191023033611'),
	('20191023033706'),
	('20191023034717'),
	('20191023043709'),
	('20191125063711'),
	('20191125064536'),
	('20191203153750'),
	('20191203160912'),
	('20191211064552'),
	('20191211095638');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shipping_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shipping_types`;

CREATE TABLE `shipping_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shipping_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `shipping_types` WRITE;
/*!40000 ALTER TABLE `shipping_types` DISABLE KEYS */;

INSERT INTO `shipping_types` (`id`, `shipping_type`, `created_at`, `updated_at`)
VALUES
	(1,'grab','2019-12-04 11:16:34','2019-12-04 11:16:34');

/*!40000 ALTER TABLE `shipping_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sizes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sizes`;

CREATE TABLE `sizes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `size` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;

INSERT INTO `sizes` (`id`, `size`, `created_at`, `updated_at`)
VALUES
	(1,'x','2019-12-03 23:39:51','2019-12-03 23:39:51'),
	(6,'XL','2019-12-17 22:16:04','2019-12-17 22:16:04'),
	(7,'XXL','2019-12-17 22:16:06','2019-12-17 22:16:06'),
	(8,'M','2019-12-17 22:16:09','2019-12-17 22:16:09'),
	(9,'L','2019-12-17 22:16:11','2019-12-17 22:16:11'),
	(10,'S','2019-12-17 22:16:12','2019-12-17 22:16:12');

/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `address`, `picture`, `phone`, `gender`, `birthday`, `password_digest`, `created_at`, `updated_at`)
VALUES
	(1,'Anivia','example-1@gmail.com',NULL,'2280 Kuhlman Mountains, Runtefurt, AZ 43494','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+51 1-787-316-5613 x1438',0,'1996-04-02','$2a$12$O2ZUonzhDfdEoHG2mezM.eSrCctr2Lmb4ISfYQClGK870VAhFO3hO','2019-12-03 23:12:50','2019-12-03 23:12:50'),
	(2,'Kalista','example-2@gmail.com',NULL,'18833 Koepp Junctions, West Teisha, HI 18462-6560','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+228 1-491-030-8544',0,'1989-02-09','$2a$12$Um7QIH6SP0QtIQFEPh8.CuB9RCC9kKWbYn0mAT3IEjTsgfT8oDg5C','2019-12-03 23:12:50','2019-12-03 23:12:50'),
	(3,'Lee Sin','example-3@gmail.com',NULL,'744 Marks Valleys, Jereshire, GA 66838','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+683 1-505-123-9169',0,'2001-02-26','$2a$12$Cr9/xhnGMIbASGeuBt01SO1h84NwpsgZeN53baZK1pE4Z4v77jCm2','2019-12-03 23:12:51','2019-12-03 23:12:51'),
	(4,'Rumble','example-4@gmail.com',NULL,'4877 Lakin Way, New Janyce, OK 97810-0451','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+420 809-054-9098 x1932',0,'1972-10-31','$2a$12$fYKPqf1ANQsf9qubAmy3CeHO0xkJ88g3ip.IcBmp4.GHMTf4BExHa','2019-12-03 23:12:51','2019-12-03 23:12:51'),
	(5,'Jhin','example-5@gmail.com',NULL,'Apt. 700 566 Ondricka Estates, East Shanelleborough, UT 03288-1575','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+263 1-331-397-8612 x9853',0,'1996-09-09','$2a$12$B3EQ2M5EEQNnBQEIYf7o6uR79CBf9wdslnwKXqZEEOjJ5kOfYiMDS','2019-12-03 23:12:51','2019-12-03 23:12:51'),
	(6,'Diana','example-6@gmail.com',NULL,'Suite 447 813 Spinka Vista, Jameyview, ND 14573','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+374 (308) 003-5612 x73041',0,'1985-10-07','$2a$12$o5d.XIRlYBCv/6BhMNRHceliWwE3j0.EGmEy7uzeChluerbHTuDDe','2019-12-03 23:12:51','2019-12-03 23:12:51'),
	(7,'Zilean','example-7@gmail.com',NULL,'205 Bobette Tunnel, West Imogene, NM 04076-1531','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+598 (799) 351-4160 x24742',0,'1968-06-29','$2a$12$g3dKuo63.8Mj4WCBkpM1Be/RUvlIIS9KMaydJIAfyDkQIX/KAHRP.','2019-12-03 23:12:51','2019-12-03 23:12:51'),
	(8,'Ashe','example-8@gmail.com',NULL,'Apt. 764 62651 Cortez Plain, Lake Daysi, IN 30656-4364','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+7 598.620.3276 x288',0,'1984-12-08','$2a$12$lp3c21oLnEqeIWYpUOiRMe522oH0Kw5gDmHndp1V5rRJps2wHzLJ6','2019-12-03 23:12:52','2019-12-03 23:12:52'),
	(9,'Lee Sin','example-9@gmail.com',NULL,'72202 Will Pike, Kunzefurt, NE 22956','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+222 533.012.2252 x927',0,'1977-03-24','$2a$12$QOX7Xt059LsoLuh7tLL2OOjpV7PumWhHvEa4/dx7L4VL2GqZLijSa','2019-12-03 23:12:52','2019-12-03 23:12:52'),
	(10,'Kha\'Zix','example-10@gmail.com',NULL,'928 Frieda Via, Weberhaven, NV 38263','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+225 471-106-7454',0,'1989-12-29','$2a$12$9a/Cz7pEej1Z4QdkpIC.Xu0rqONc6jArHMCo/yGCA20Brpo66hnn6','2019-12-03 23:12:52','2019-12-03 23:12:52'),
	(11,'Cassiopeia','example-11@gmail.com',NULL,'533 Sammie Lodge, Lake Henryshire, UT 44147','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+372 1-574-310-2544 x66949',0,'1960-04-27','$2a$12$NMIlB2QSr.lxPwUWo90UQue2XcW.WsxCZbJops7SWYbYlzJcgzIey','2019-12-03 23:12:52','2019-12-03 23:12:52'),
	(12,'Zoe','example-12@gmail.com',NULL,'Suite 396 56385 Leonardo Rapid, South Elinland, WA 46805','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+1 675-818-5703',0,'1987-12-11','$2a$12$HseUcRBieHnaHPggQE7VGO5dko9StgDpmWjfrC6Z0f4vGX4M1OeAO','2019-12-03 23:12:53','2019-12-03 23:12:53'),
	(13,'Sivir','example-13@gmail.com',NULL,'50446 Goyette Mission, Emersonland, SC 24701-5058','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+1-939 479.172.2582 x451',0,'1963-03-04','$2a$12$lGObIi/rsaifKKbq7QHLse.Ce98FrjDBXfrea4bIIUUn4rtCx0A/2','2019-12-03 23:12:53','2019-12-03 23:12:53'),
	(14,'Warwick','example-14@gmail.com',NULL,'Apt. 635 28634 Emelina Spring, Kristofertown, KY 90670-9861','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+353 639-719-4760',0,'1999-11-09','$2a$12$EOv20cPzqRJtaFRMpYjCie.GPwn1dTsORp2FneCZn3TY8khoXEuti','2019-12-03 23:12:53','2019-12-03 23:12:53'),
	(15,'Ashe','example-15@gmail.com',NULL,'3171 Schumm Avenue, Port Gregorio, MD 57303','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+500 (346) 499-0072',0,'1981-04-22','$2a$12$ur/TB7AZXzzsl.VEPOlon.OYteQ5HlfKWt1rzX/fjFejXiRd0OAES','2019-12-03 23:12:53','2019-12-03 23:12:53'),
	(16,'Ashe','example-16@gmail.com',NULL,'Apt. 802 5676 Inge Rapid, New Bernardine, NV 62071-0741','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+381 1-929-822-6943 x2035',0,'1956-08-07','$2a$12$pV366VyZGOYeLB7PKqcAD.JOpWlaXTV3cO3zkKF9Scj3pUhdlax..','2019-12-03 23:12:53','2019-12-03 23:12:53'),
	(17,'Jhin','example-17@gmail.com',NULL,'268 Wilburn Key, North Armando, RI 57792-6176','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+236 487-615-1160 x46355',0,'1985-02-18','$2a$12$NGozHDU0cy0rZBTjPTMJi.1BOQmDnKasNXk3/gace7.wjlSGr1BV.','2019-12-03 23:12:54','2019-12-03 23:12:54'),
	(18,'Ekko','example-18@gmail.com',NULL,'Apt. 340 570 Weimann Village, Randalton, DE 66217','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+691 125-114-3387 x20174',0,'1997-01-29','$2a$12$cLDlpkybhOjHiIREHorjy.bPXYPdtkK8T4aJXef6y5AgutDVortt2','2019-12-03 23:12:54','2019-12-03 23:12:54'),
	(19,'Ryze','example-19@gmail.com',NULL,'30272 Hegmann Shoal, North Cherside, NH 36714-4649','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+971 1-491-053-7313 x089',0,'1993-07-24','$2a$12$Xl7xDXQ/1vwIZI/nZW0J5eTbYXc32W1pRJpRdw.qC0UdkT8oBuwWm','2019-12-03 23:12:54','2019-12-03 23:12:54'),
	(20,'Kalista','example-20@gmail.com',NULL,'Suite 211 68821 Graham Place, North Nanniefort, NY 70592-5882','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+973 1-629-512-7692',0,'1985-09-09','$2a$12$0EWJ.RTF5TdepC8Mz8dcHO3ezuepUt/nKk3gQlUPVpG6M3VdGimVS','2019-12-03 23:12:54','2019-12-03 23:12:54'),
	(21,'Braum','example-21@gmail.com',NULL,'662 Turcotte Route, West Edgarmouth, AZ 89342','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+504 850-026-8008',0,'1975-01-31','$2a$12$0Nc8j7Mi7xHL7EXf7db1DeOB8qG0.0X6YyMw3Bb6oJwsKcLwzXH2.','2019-12-03 23:12:55','2019-12-03 23:12:55'),
	(22,'Irelia','example-22@gmail.com',NULL,'544 Kelley Passage, Port Sarahside, VA 29455','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+54 350.605.3464 x454',0,'1971-12-07','$2a$12$i5iyelRJ0szVfkl/71s6YOGqam6qJPOZ1JsD4xYCqdCVhPv0qX4SW','2019-12-03 23:12:55','2019-12-03 23:12:55'),
	(23,'Rakan','example-23@gmail.com',NULL,'5143 Neal Village, Pacochaburgh, MS 86359','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+686 1-890-599-9610',0,'1967-08-13','$2a$12$oNoWOTmAvVJXk//4.wA/bOfIVVv95uSM4.B0WLkSk8BIEe8P0ecYe','2019-12-03 23:12:55','2019-12-03 23:12:55'),
	(24,'Leona','example-24@gmail.com',NULL,'Suite 218 755 Lenita Ville, North Mylesborough, KS 89953-0562','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+93 (470) 666-5584 x48065',0,'1969-04-15','$2a$12$q2zwUQ6bDtFmAllIsrW9bO7fT/mU7uaVT10AWB2l3gKLd/dYp0PnC','2019-12-03 23:12:55','2019-12-03 23:12:55'),
	(25,'Yuumi','example-25@gmail.com',NULL,'Suite 544 20358 Waters Alley, Ziemannmouth, WA 33287-7410','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+32 1-462-821-1021 x5798',0,'1999-03-28','$2a$12$5pQfze9XjR3tjTI8qOC38eCUEv8m2iX4emGePOaVQFkbmZGDbrieu','2019-12-03 23:12:56','2019-12-03 23:12:56'),
	(26,'Corki','example-26@gmail.com',NULL,'Apt. 135 67035 Cyril Streets, Muellerville, WV 86506','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+299 582.830.1159 x26291',0,'1955-03-16','$2a$12$KIBFSKONennxrtxTZvDAl.aMDqUcgQsfGTEzofC3KlRjOWHxcK0mi','2019-12-03 23:12:56','2019-12-03 23:12:56'),
	(27,'Shyvanna','example-27@gmail.com',NULL,'Suite 279 8643 Reena Ports, South Charliemouth, WY 67359','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+966 342-989-8582 x9520',0,'1988-07-25','$2a$12$EmMhireMgRZlGzZrFR.XDuO9mmocM0LUS3TRxQouSVunodKi5Mh8G','2019-12-03 23:12:56','2019-12-03 23:12:56'),
	(28,'Udyr','example-28@gmail.com',NULL,'Suite 139 6409 Twanda Way, Lake Rafaela, OK 11621','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+500 (519) 839-3379',0,'1997-01-29','$2a$12$XtsNHgps7d3byUjQrdFvLecG85r/8ePcglBB32MZusZPIcfeW8ABe','2019-12-03 23:12:56','2019-12-03 23:12:56'),
	(29,'Shyvanna','example-29@gmail.com',NULL,'187 Stanford Inlet, West Lewisstad, SD 38273-6719','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+243 (483) 056-1973 x822',0,'2000-10-30','$2a$12$HiRSTM/JnFE3MP2yiEGEeetAA3XIXOEpt4MpjIdiwgOWh/2Jz2zCK','2019-12-03 23:12:56','2019-12-03 23:12:56'),
	(30,'Pantheon','example-30@gmail.com',NULL,'197 Jolyn Plains, Lake Sonfurt, TX 55779-7725','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+381 (613) 252-7861 x4096',0,'1984-05-17','$2a$12$SP6VudbOnlVi4ZcdJdH.peAEjc.IKmN628CtBmc9qq36.LK7AbRLi','2019-12-03 23:12:57','2019-12-03 23:12:57'),
	(31,'Kalista','example-31@gmail.com',NULL,'813 Schultz Wells, West Franciscofurt, IN 45325','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+1 633-992-5453 x021',0,'1977-06-09','$2a$12$2nGnwrAKXJhnY6M94RLZmurfQ3ezkoRHCrjNnNM5.14Bj.jr9um6a','2019-12-03 23:12:57','2019-12-03 23:12:57'),
	(32,'Yuumi','example-32@gmail.com',NULL,'905 Jon Valley, Port Brandenland, WV 13134-3870','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+673 1-866-156-7141 x6000',0,'1996-05-10','$2a$12$LtR1BCoFOEZaE6XDEjO4uOMlaqGlYSJ4fBYAnVAjioUNdZpdrZm3u','2019-12-03 23:12:57','2019-12-03 23:12:57'),
	(33,'Zyra','example-33@gmail.com',NULL,'Suite 971 875 Victor Via, Lake Gil, CA 47450','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+82 686-443-1799 x454',0,'1963-09-25','$2a$12$XUYbPahwsxSL56NZPECnsOA/9ATdR8r4fXG7DrVgSEdaVf6Q3oKeW','2019-12-03 23:12:57','2019-12-03 23:12:57'),
	(34,'Kled','example-34@gmail.com',NULL,'7636 Olson Mills, Port Adeliatown, RI 95208-5790','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+49 305-675-2378',0,'1998-12-08','$2a$12$eX1CBTPQc8Gb0kuT3syVpehrkM8bhxn80Z3PJkEgyWcsDbSV7Wm6m','2019-12-03 23:12:58','2019-12-03 23:12:58'),
	(35,'Cassiopeia','example-35@gmail.com',NULL,'Suite 738 1174 Doyle Knolls, Denverbury, LA 23409-2834','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+1-649 403-216-9119 x23012',0,'1969-10-20','$2a$12$LDM.48qfFSshRT9V2F9xYOG.DRJ5oyGQ8z4Ky0ouhD14PdEHujgBa','2019-12-03 23:12:58','2019-12-03 23:12:58'),
	(36,'Ziggs','example-36@gmail.com',NULL,'Apt. 226 9649 Sheena River, Robertsmouth, MT 73780','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+236 628-722-1393',0,'1975-03-01','$2a$12$.MKAHYyoZBYnwrSrCRH0zeWGEyqzCawfpjYj/rSPwP0JGTk2J2G/y','2019-12-03 23:12:58','2019-12-03 23:12:58'),
	(37,'Nami','example-37@gmail.com',NULL,'1355 Cruickshank Forge, North Cristinville, MO 53940','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+297 626-863-8639 x88094',0,'1963-01-13','$2a$12$gNaNhopb8LL6.oxbKdWuA.dSjvR//e1kWOcIqFWOCWNOOzsHORdbW','2019-12-03 23:12:58','2019-12-03 23:12:58'),
	(38,'Nocturne','example-38@gmail.com',NULL,'Apt. 717 15048 Wyman Street, Dextershire, NY 06822','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+98 693.165.8894 x4462',0,'1993-09-03','$2a$12$QDtFqQgpPcFbvM9vIgA09eD6rGENGPehaB/BNJPkmb8xOxeE09vYG','2019-12-03 23:12:58','2019-12-03 23:12:58'),
	(39,'Rengar','example-39@gmail.com',NULL,'207 Odette Station, New Dorseyland, PA 95322','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+1-939 (988) 924-1699 x07525',0,'1998-03-16','$2a$12$Z1zHchy6c6wA/7Y03J3OeeSiLEVDi/8Gyrc6jI1gNCyspR0mLYpta','2019-12-03 23:12:59','2019-12-03 23:12:59'),
	(40,'Karthus','example-40@gmail.com',NULL,'Apt. 114 53088 Luis Station, Marksbury, MO 96302-4854','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+389 916-846-4009',0,'1999-04-27','$2a$12$NzYQ0Sp.ffsT2q5wpkTfsuFIMSEXgYRlM1YYT/sutqPhM8fW3.zt6','2019-12-03 23:12:59','2019-12-03 23:12:59'),
	(41,'Kalista','example-41@gmail.com',NULL,'Apt. 817 883 Swaniawski Island, Lisetteshire, SD 77602-8556','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+36 281-002-5258',0,'1974-05-26','$2a$12$.vV8fxLgiHnWaQ6q5smSmuHNwXo0lWj5SmGs4mb1humfw2uKD8w9.','2019-12-03 23:12:59','2019-12-03 23:12:59'),
	(42,'Quinn','example-42@gmail.com',NULL,'79206 Skiles Parks, Lockmanmouth, SD 58853','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+238 1-582-652-0366 x95392',0,'1963-11-30','$2a$12$T0nxY1jSBU250uhs0YF.IeKL1xFl5AQO9us5z7RemC0pNkG16RvTa','2019-12-03 23:12:59','2019-12-03 23:12:59'),
	(43,'Karthus','example-43@gmail.com',NULL,'37224 Arlyne Trafficway, Rikkiburgh, WI 83329','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+36 403.782.0727',0,'1972-05-29','$2a$12$YcBHi1rSBn3xvvGdnQuhWOMuWtNAz6ePKgTxgOQ4.AQZUNh4ad.O.','2019-12-03 23:13:00','2019-12-03 23:13:00'),
	(44,'Kai\'Sa','example-44@gmail.com',NULL,'Apt. 789 8783 Mante Alley, Rickyport, AL 83677','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+691 134-304-9812 x86406',0,'1986-03-22','$2a$12$YjywnaVVJvKtGjcJ1cGctuyUwXDXgfWReamoeSUuY6f8UkoYy.OfK','2019-12-03 23:13:00','2019-12-03 23:13:00'),
	(45,'Veigar','example-45@gmail.com',NULL,'879 Lynch Trail, North Hobertton, NV 16731-7025','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+62 886-905-7169 x4063',0,'1985-03-11','$2a$12$s4AWQ6bVxEUKYGP/FtTyD.PlGZ5cekHiYrmt1x1m8SNE6tR42h6mK','2019-12-03 23:13:00','2019-12-03 23:13:00'),
	(46,'Rakan','example-46@gmail.com',NULL,'Suite 973 50222 Zboncak Mission, New Jennine, WY 13065-2302','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+81 213.503.4454 x09968',0,'1969-09-02','$2a$12$p6O7hSG3Qh8SUVBTXrX8TOWnxMz1ORcrlJzdk6NZhqLiOPY9C2/uq','2019-12-03 23:13:00','2019-12-03 23:13:00'),
	(47,'Teemo','example-47@gmail.com',NULL,'22703 Leo Knolls, Port Dongstad, IN 64004-8943','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+269 (109) 302-7628',0,'1995-03-17','$2a$12$v9bGXSrKDEkR8/4JHcbD6Om3l7fuG7wFP7rSgNG.b43KXbfATzgUW','2019-12-03 23:13:00','2019-12-03 23:13:00'),
	(48,'Warwick','example-48@gmail.com',NULL,'8009 Alysia Parkways, West Maxwell, VA 16454','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+599 1-486-064-2547',0,'1981-01-03','$2a$12$yMXFzDhUQ/bf7Izp1Sf3/eQdt/9s4gzrz.Xske4LtAWrt574iey6.','2019-12-03 23:13:01','2019-12-03 23:13:01'),
	(49,'Irelia','example-49@gmail.com',NULL,'Suite 170 66497 Davis Roads, Townefort, GA 64839-6658','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+971 (275) 570-1354',0,'1968-03-25','$2a$12$72Vg3gC.wZbLwsPQC7PtVelso9yVMcggRmyKHXD.1EAA4JKrkK1TG','2019-12-03 23:13:01','2019-12-03 23:13:01'),
	(50,'Rengar','example-50@gmail.com',NULL,'78767 Rocky Row, Lakinshire, FL 65006-6538','https://robohash.org/my-own-slug.jpg?size=50x50&set=set1','+591 1-515-503-2657',0,'1994-01-26','$2a$12$BW1ZxWX5mYhKLe97MMqU2.cR1j0AduHu.m7/N65a0gt3YFUeo2IqS','2019-12-03 23:13:01','2019-12-03 23:13:01');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
