-- Adminer 3.7.0 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = '+02:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`slug`) REFERENCES `slugs` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`slug`) REFERENCES `slugs` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `slugs`;
CREATE TABLE `slugs` (
  `slug` varchar(100) NOT NULL,
  `type` enum('user','event','group') DEFAULT NULL,
  `userId` int(10) unsigned DEFAULT NULL,
  `eventId` int(10) unsigned DEFAULT NULL,
  `groupId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`slug`),
  KEY `userId` (`userId`),
  KEY `eventId` (`eventId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `slugs_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `slugs_ibfk_2` FOREIGN KEY (`eventId`) REFERENCES `events` (`id`),
  CONSTRAINT `slugs_ibfk_3` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`slug`) REFERENCES `slugs` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 2013-06-29 11:59:01
