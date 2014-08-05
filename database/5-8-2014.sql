-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for magazaki
CREATE DATABASE IF NOT EXISTS `magazaki` /*!40100 DEFAULT CHARACTER SET greek */;
USE `magazaki`;


-- Dumping structure for table magazaki.content
CREATE TABLE IF NOT EXISTS `content` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `content` longtext,
  `notes` text,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_content_lookup` (`type`),
  CONSTRAINT `FK_content_lookup` FOREIGN KEY (`type`) REFERENCES `lookup` (`idc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=greek;

-- Dumping data for table magazaki.content: ~3 rows (approximately)
DELETE FROM `content`;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` (`idc`, `type`, `slug`, `sku`, `title`, `subtitle`, `price`, `content`, `notes`, `createdBy`, `updatedBy`, `createdOn`, `updatedOn`) VALUES
	(1, 18, 'home', NULL, 'Home Title', 'Home SubTitle', NULL, 'The Home page content', NULL, 1, 1, '2014-08-04 12:45:27', '2014-08-04 12:45:27'),
	(2, 18, 'contact', NULL, 'Contact Title', 'Contact SubTitle', NULL, 'The Contact page content', NULL, 1, 1, '2014-08-04 12:46:14', '2014-08-04 12:46:14'),
	(3, 19, 'terms', NULL, 'Terms title', 'Terms subtitle', NULL, 'The Terms page content', NULL, 1, 1, '2014-08-04 15:36:09', '2014-08-04 15:36:09');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;


-- Dumping structure for table magazaki.grouprights
CREATE TABLE IF NOT EXISTS `grouprights` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(50) NOT NULL DEFAULT '0',
  `group` varchar(50) NOT NULL DEFAULT '0',
  `create` tinyint(1) NOT NULL DEFAULT '0',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `update` tinyint(1) NOT NULL DEFAULT '0',
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idc`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=greek;

-- Dumping data for table magazaki.grouprights: ~1 rows (approximately)
DELETE FROM `grouprights`;
/*!40000 ALTER TABLE `grouprights` DISABLE KEYS */;
INSERT INTO `grouprights` (`idc`, `entity`, `group`, `create`, `read`, `update`, `delete`) VALUES
	(2, 'admin', 'is_super_admin', 1, 1, 1, 1),
	(3, 'admin', 'is_admin', 1, 1, 1, 1),
	(4, 'admin', 'is_editor', 1, 1, 1, 1),
	(5, 'admin', 'is_author', 1, 1, 1, 1),
	(6, 'admin', 'is_customer', 1, 1, 1, 1),
	(7, 'user', 'is_super_admin', 1, 1, 1, 1),
	(8, 'user', 'is_admin', 1, 1, 1, 1),
	(9, 'user', 'is_editor', 1, 1, 1, 1);
/*!40000 ALTER TABLE `grouprights` ENABLE KEYS */;


-- Dumping structure for table magazaki.lookup
CREATE TABLE IF NOT EXISTS `lookup` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  `selectable` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `notes` text,
  `amount` float DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_lookup_lookup` (`parent`),
  KEY `FK_lookup_user` (`createdBy`),
  KEY `FK_lookup_user_2` (`updatedBy`),
  CONSTRAINT `FK_lookup_lookup` FOREIGN KEY (`parent`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_lookup_user` FOREIGN KEY (`createdBy`) REFERENCES `user` (`idc`),
  CONSTRAINT `FK_lookup_user_2` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`idc`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=greek;

-- Dumping data for table magazaki.lookup: ~24 rows (approximately)
DELETE FROM `lookup`;
/*!40000 ALTER TABLE `lookup` DISABLE KEYS */;
INSERT INTO `lookup` (`idc`, `parent`, `editable`, `selectable`, `description`, `notes`, `amount`, `createdBy`, `updatedBy`, `createdOn`, `updatedOn`) VALUES
	(1, 1, 0, 0, 'ROOT', NULL, NULL, 1, 1, '2014-08-01 13:02:07', '2014-08-01 13:02:07'),
	(2, 1, 1, 1, 'USER_GROUPS', NULL, NULL, 1, 1, '2014-08-01 13:09:03', '2014-08-01 13:09:03'),
	(3, 1, 1, 1, 'CITIES', NULL, NULL, 1, 1, '2014-08-01 13:09:27', '2014-08-01 13:09:27'),
	(4, 1, 1, 1, 'COUNTRIES', NULL, NULL, 1, 1, '2014-08-01 13:09:36', '2014-08-01 13:09:36'),
	(5, 1, 1, 1, 'STATES', NULL, NULL, 1, 1, '2014-08-01 13:09:41', '2014-08-01 13:09:41'),
	(6, 1, 1, 1, 'TELEPHONE_TYPES', NULL, NULL, 1, 1, '2014-08-01 13:09:51', '2014-08-01 13:09:51'),
	(7, 1, 1, 1, 'WEBPROFILE_TYPES', NULL, NULL, 1, 1, '2014-08-01 13:09:57', '2014-08-01 13:09:57'),
	(8, 1, 1, 1, 'ADDRESS_TYPES', NULL, NULL, 1, 1, '2014-08-01 13:10:03', '2014-08-01 13:10:03'),
	(9, 1, 1, 1, 'IDENTITY_TYPES', NULL, NULL, 1, 1, '2014-08-01 13:10:10', '2014-08-01 13:10:10'),
	(10, 1, 1, 1, 'ORDER_STATUS', NULL, NULL, 1, 1, '2014-08-01 13:10:41', '2014-08-01 13:10:41'),
	(11, 2, 1, 1, 'SUPER_ADMIN', NULL, NULL, 1, 1, '2014-08-01 13:14:47', '2014-08-01 13:14:47'),
	(12, 2, 1, 1, 'ADMIN', NULL, NULL, 1, 1, '2014-08-01 13:15:03', '2014-08-01 13:15:03'),
	(13, 2, 1, 1, 'EDITOR', NULL, NULL, 1, 1, '2014-08-01 13:15:26', '2014-08-01 13:15:26'),
	(14, 2, 1, 1, 'AUTHOR', NULL, NULL, 1, 1, '2014-08-01 13:15:30', '2014-08-01 13:15:30'),
	(15, 2, 1, 1, 'CUSTOMER', NULL, NULL, 1, 1, '2014-08-01 13:15:35', '2014-08-01 13:15:35'),
	(17, 1, 1, 1, 'CONTENT_TYPES', NULL, NULL, 1, 1, '2014-08-01 13:42:01', '2014-08-01 13:42:01'),
	(18, 17, 1, 1, 'PAGE', NULL, NULL, 1, 1, '2014-08-01 13:42:22', '2014-08-01 13:42:22'),
	(19, 17, 1, 1, 'ARTICLE', NULL, NULL, 1, 1, '2014-08-01 13:42:35', '2014-08-01 13:42:35'),
	(20, 17, 1, 1, 'PRODUCT', NULL, NULL, 1, 1, '2014-08-01 13:42:44', '2014-08-01 13:42:44'),
	(23, 1, 1, 1, 'PRODUCT_CATEGORIES', NULL, NULL, 1, 1, '2014-08-01 14:45:46', '2014-08-01 14:45:46'),
	(24, 1, 1, 1, 'PRODUCT_MANUFACTURERS', NULL, NULL, 1, 1, '2014-08-01 14:45:59', '2014-08-01 14:45:59'),
	(25, 1, 1, 1, 'PRODUCT_CREATORS', NULL, NULL, 1, 1, '2014-08-01 14:46:08', '2014-08-01 14:46:08'),
	(26, 1, 1, 1, 'ORDERED_ITEM_STATUS', NULL, NULL, 1, 1, '2014-08-01 15:04:15', '2014-08-01 15:04:15'),
	(27, 1, 1, 1, 'CURRENCY', NULL, NULL, 1, 1, '2014-08-04 13:47:54', '2014-08-04 13:47:54');
/*!40000 ALTER TABLE `lookup` ENABLE KEYS */;


-- Dumping structure for table magazaki.mz_sessions
CREATE TABLE IF NOT EXISTS `mz_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

-- Dumping data for table magazaki.mz_sessions: ~1 rows (approximately)
DELETE FROM `mz_sessions`;
/*!40000 ALTER TABLE `mz_sessions` DISABLE KEYS */;
INSERT INTO `mz_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
	('dee214cddeed2e5c0aa106c5191aa131', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1407248804, 'a:5:{s:9:"user_data";s:0:"";s:9:"logged_in";b:1;s:7:"user_id";s:1:"1";s:13:"user_fullname";s:17:"Andreas Iosifelis";s:17:"user_access_level";s:2:"11";}');
/*!40000 ALTER TABLE `mz_sessions` ENABLE KEYS */;


-- Dumping structure for table magazaki.order
CREATE TABLE IF NOT EXISTS `order` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `total` float DEFAULT '0',
  `notes` text,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_order_user` (`user`),
  KEY `FK_order_lookup` (`status`),
  KEY `FK_order_user_2` (`createdBy`),
  KEY `FK_order_user_3` (`updatedBy`),
  CONSTRAINT `FK_order_user` FOREIGN KEY (`user`) REFERENCES `user` (`idc`),
  CONSTRAINT `FK_order_lookup` FOREIGN KEY (`status`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_order_user_2` FOREIGN KEY (`createdBy`) REFERENCES `user` (`idc`),
  CONSTRAINT `FK_order_user_3` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`idc`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

-- Dumping data for table magazaki.order: ~0 rows (approximately)
DELETE FROM `order`;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


-- Dumping structure for table magazaki.ordered
CREATE TABLE IF NOT EXISTS `ordered` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `notes` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_ordered_content` (`product`),
  KEY `FK_ordered_order` (`order`),
  KEY `FK_ordered_lookup` (`status`),
  KEY `FK_ordered_user` (`createdBy`),
  KEY `FK_ordered_user_2` (`updatedBy`),
  CONSTRAINT `FK_ordered_user` FOREIGN KEY (`createdBy`) REFERENCES `user` (`idc`),
  CONSTRAINT `FK_ordered_user_2` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`idc`),
  CONSTRAINT `FK_ordered_content` FOREIGN KEY (`product`) REFERENCES `content` (`idc`),
  CONSTRAINT `FK_ordered_lookup` FOREIGN KEY (`status`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_ordered_order` FOREIGN KEY (`order`) REFERENCES `order` (`idc`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

-- Dumping data for table magazaki.ordered: ~0 rows (approximately)
DELETE FROM `ordered`;
/*!40000 ALTER TABLE `ordered` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered` ENABLE KEYS */;


-- Dumping structure for table magazaki.product_tags
CREATE TABLE IF NOT EXISTS `product_tags` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL DEFAULT '0',
  `tag` int(11) NOT NULL DEFAULT '0',
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_product_tags_content` (`product`),
  KEY `FK_product_tags_lookup` (`tag`),
  KEY `FK_product_tags_user` (`createdBy`),
  KEY `FK_product_tags_user_2` (`updatedBy`),
  CONSTRAINT `FK_product_tags_user` FOREIGN KEY (`createdBy`) REFERENCES `user` (`idc`),
  CONSTRAINT `FK_product_tags_user_2` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`idc`),
  CONSTRAINT `FK_product_tags_content` FOREIGN KEY (`product`) REFERENCES `content` (`idc`),
  CONSTRAINT `FK_product_tags_lookup` FOREIGN KEY (`tag`) REFERENCES `lookup` (`idc`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;

-- Dumping data for table magazaki.product_tags: ~0 rows (approximately)
DELETE FROM `product_tags`;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;


-- Dumping structure for table magazaki.user
CREATE TABLE IF NOT EXISTS `user` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `group` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` char(128) DEFAULT NULL,
  `salt` char(128) DEFAULT NULL,
  `notes` text,
  `loginCount` int(11) DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `lastLogout` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_user_lookup` (`group`),
  KEY `FK_user_user` (`createdBy`),
  KEY `FK_user_user_2` (`updatedBy`),
  CONSTRAINT `FK_user_user_2` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`idc`),
  CONSTRAINT `FK_user_lookup` FOREIGN KEY (`group`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_user_user` FOREIGN KEY (`createdBy`) REFERENCES `user` (`idc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=greek;

-- Dumping data for table magazaki.user: ~1 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`idc`, `group`, `enabled`, `firstName`, `lastName`, `username`, `password`, `salt`, `notes`, `loginCount`, `lastLogin`, `lastLogout`, `createdBy`, `updatedBy`, `createdOn`, `updatedOn`) VALUES
	(1, 11, 1, 'Andreas', 'Iosifelis', 'drumforhim', '6bcfaf690f857c63a33f8d28cf44ddfc4de9ae61f70ee23c3b55f99338e160ba0246aee1c6f05247ad74945b33471d96d9cd35b720a45b3c55ace1e262d80e2d', '36e5047ae53ac7fcb109c943f5d806a7063dfb573c450156ad20843212cbeb2f7286bf0197e11e296af4e05af4305042a5b6a70fd7b5d381c95bab95c85a7f48', NULL, 0, '2014-08-01 14:59:32', '2014-08-01 14:59:34', 1, 1, '2014-08-01 14:59:41', '2014-08-01 14:59:42');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for procedure magazaki.GET_LOOKUP_TYPES
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_LOOKUP_TYPES`()
BEGIN
select * from lookup where parent = 1 and idc != 1;
END//
DELIMITER ;


-- Dumping structure for procedure magazaki.INSERT_LOOKUP
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_LOOKUP`(IN `PARENT` INT, IN `SELECTABLE` TINYINT, IN `EDITABLE` TINYINT, IN `DESCRIPTION` VARCHAR(255))
BEGIN
insert into lookup 
(parent, editable, selectable, description, createdBy, updatedBy, createdOn, updatedOn)
values
(PARENT, EDITABLE, SELECTABLE, DESCRIPTION, 1, 1, NOW(), NOW());
select * from lookup where parent = PARENT;
END//
DELIMITER ;


-- Dumping structure for procedure magazaki.INSERT_LOOKUP_TYPE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_LOOKUP_TYPE`(IN `SELECTABLE` TINYINT, IN `EDITABLE` TINYINT, IN `DESCRIPTION` VARCHAR(255))
BEGIN
insert into lookup
(parent, editable, selectable, description, createdBy, updatedBy, createdOn, updatedOn)
values
(1, EDITABLE, SELECTABLE, DESCRIPTION, 1, 1, NOW(), NOW());
select * from lookup where parent = 1 and idc !=1;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
