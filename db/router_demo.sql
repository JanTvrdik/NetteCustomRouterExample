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

INSERT INTO `events` (`id`, `name`, `slug`, `startDate`, `endDate`) VALUES
(2,	'Předprázdninová, Praha!!!, 29. 6. 2013',	'predprazdninova-posobota',	'2013-06-29 15:00:00',	'2013-06-30 05:00:00');

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`slug`) REFERENCES `slugs` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `groups` (`id`, `name`, `slug`) VALUES
(1,	'Doctrine',	'doctrine'),
(2,	'Lean Mapper',	'lean-mapper'),
(3,	'Nette Database',	'nette-database'),
(4,	'Dibi',	'dibi');

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

INSERT INTO `slugs` (`slug`, `type`, `userId`, `eventId`, `groupId`) VALUES
('dg',	'user',	5,	NULL,	NULL),
('dibi',	'group',	NULL,	NULL,	4),
('doctrine',	'group',	NULL,	NULL,	1),
('hosiplan',	'user',	1,	NULL,	NULL),
('hrach',	'user',	2,	NULL,	NULL),
('juzna',	'user',	3,	NULL,	NULL),
('lean-mapper',	'group',	NULL,	NULL,	2),
('nette-database',	'group',	NULL,	NULL,	3),
('predprazdninova-posobota',	'event',	NULL,	2,	NULL),
('vrana',	'user',	4,	NULL,	NULL);

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

INSERT INTO `users` (`id`, `name`, `slug`, `twitter`) VALUES
(1,	'Filip Procházka',	'hosiplan',	'HosipLan'),
(2,	'Jan Škrášek',	'hrach',	'hrachcz'),
(3,	'Jan Doleček',	'juzna',	'juznacz'),
(4,	'Jakub Vrána',	'vrana',	'jakubvrana'),
(5,	'David Grudl',	'dg',	'geekovo');

-- 2013-06-29 11:59:01
