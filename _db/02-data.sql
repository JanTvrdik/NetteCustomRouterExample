-- Adminer 3.7.0 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = '+02:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

INSERT INTO `events` (`id`, `name`, `slug`, `startDate`, `endDate`) VALUES
(2,	'Předprázdninová, Praha!!!, 29. 6. 2013',	'predprazdninova-posobota',	'2013-06-29 15:00:00',	'2013-06-30 05:00:00');

INSERT INTO `groups` (`id`, `name`, `slug`) VALUES
(1,	'Doctrine',	'doctrine'),
(2,	'Lean Mapper',	'lean-mapper'),
(3,	'Nette Database',	'nette-database'),
(4,	'Dibi',	'dibi');

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

INSERT INTO `users` (`id`, `name`, `slug`, `twitter`) VALUES
(1,	'Filip Procházka',	'hosiplan',	'prochazkafilip'),
(2,	'Jan Škrášek',	'hrach',	'hrachcz'),
(3,	'Jan Doleček',	'juzna',	'juznacz'),
(4,	'Jakub Vrána',	'vrana',	'jakubvrana'),
(5,	'David Grudl',	'dg',	'geekovo');

-- 2013-06-29 11:59:01
