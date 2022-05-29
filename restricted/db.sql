-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 25 Lip 2011, 13:19
-- Wersja serwera: 5.1.37
-- Wersja PHP: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Baza danych: `dbko`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `premDays` int(11) NOT NULL DEFAULT '0',
  `premEnd` int(11) NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `blocked` tinyint(4) NOT NULL DEFAULT '0',
  `rlname` varchar(45) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `location` varchar(45) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `recovery_key` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `hidemail` tinyint(1) NOT NULL DEFAULT '0',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `lastday` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `page_lastday` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  KEY `accno` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `accounts`
--

INSERT INTO `accounts` (`id`, `password`, `premDays`, `premEnd`, `email`, `blocked`, `rlname`, `location`, `recovery_key`, `hide`, `hidemail`, `page_access`, `lastday`, `created`, `page_lastday`, `premium_points`) VALUES
(8548596, 'lolek14', 0, 1311592424, 'sdasad@o2.pl', 0, '', '', '', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `addons`
--

CREATE TABLE IF NOT EXISTS `addons` (
  `player` int(20) NOT NULL DEFAULT '0',
  `outfit` int(10) NOT NULL DEFAULT '0',
  `addon` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `addons`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'this field defines if its ip, account, player, or any else ban',
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '4294967295',
  `player` int(10) unsigned NOT NULL DEFAULT '0',
  `account` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(25) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `bans`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `blessings`
--

CREATE TABLE IF NOT EXISTS `blessings` (
  `player` int(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `blessings`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `deathlist`
--

CREATE TABLE IF NOT EXISTS `deathlist` (
  `player` int(21) NOT NULL DEFAULT '0',
  `killer` varchar(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `level` int(21) NOT NULL DEFAULT '0',
  `date` int(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `deathlist`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'group name',
  `flags` bigint(20) unsigned NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `ranga` int(11) NOT NULL DEFAULT '0',
  `maxdepotitems` int(11) NOT NULL DEFAULT '0',
  `maxviplist` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `groups`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `guilds`
--

CREATE TABLE IF NOT EXISTS `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'guild name - nothing else needed here',
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `invited_to` int(11) NOT NULL,
  `invited_by` int(11) NOT NULL,
  `in_war_with` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `show` smallint(1) NOT NULL,
  `war_time` int(11) NOT NULL,
  `kills_all` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `guilds`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `guild_ranks`
--

CREATE TABLE IF NOT EXISTS `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `guild_ranks`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=69 ;

--
-- Zrzut danych tabeli `houses`
--

INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`) VALUES
(1, 0, 0, '0'),
(2, 0, 0, '0'),
(3, 0, 0, '0'),
(4, 0, 0, '0'),
(5, 0, 0, '0'),
(6, 0, 0, '0'),
(7, 0, 0, '0'),
(8, 0, 0, '0'),
(9, 0, 0, '0'),
(10, 0, 0, '0'),
(11, 0, 0, '0'),
(12, 0, 0, '0'),
(13, 0, 0, '0'),
(14, 0, 0, '0'),
(15, 0, 0, '0'),
(16, 0, 0, '0'),
(17, 0, 0, '0'),
(18, 0, 0, '0'),
(19, 0, 0, '0'),
(20, 0, 0, '0'),
(21, 0, 0, '0'),
(22, 0, 0, '0'),
(23, 0, 0, '0'),
(24, 0, 0, '0'),
(25, 0, 0, '0'),
(26, 0, 0, '0'),
(27, 0, 0, '0'),
(28, 0, 0, '0'),
(29, 0, 0, '0'),
(30, 0, 0, '0'),
(31, 0, 0, '0'),
(32, 0, 0, '0'),
(33, 0, 0, '0'),
(34, 0, 0, '0'),
(35, 0, 0, '0'),
(36, 0, 0, '0'),
(37, 0, 0, '0'),
(38, 0, 0, '0'),
(39, 0, 0, '0'),
(40, 0, 0, '0'),
(41, 0, 0, '0'),
(42, 0, 0, '0'),
(43, 0, 0, '0'),
(44, 0, 0, '0'),
(45, 0, 0, '0'),
(46, 0, 0, '0'),
(47, 0, 0, '0'),
(48, 0, 0, '0'),
(49, 0, 0, '0'),
(50, 0, 0, '0'),
(51, 0, 0, '0'),
(52, 0, 0, '0'),
(53, 0, 0, '0'),
(54, 0, 0, '0'),
(55, 0, 0, '0'),
(56, 0, 0, '0'),
(57, 0, 0, '0'),
(58, 0, 0, '0'),
(59, 0, 0, '0'),
(60, 0, 0, '0'),
(61, 0, 0, '0'),
(62, 0, 0, '0'),
(63, 0, 0, '0'),
(64, 0, 0, '0'),
(65, 0, 0, '0'),
(66, 0, 0, '0'),
(67, 0, 0, '0'),
(68, 0, 0, '0');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `house_lists`
--

CREATE TABLE IF NOT EXISTS `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text COLLATE latin1_general_ci NOT NULL,
  KEY `house_id` (`house_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `house_lists`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `nicaw_accounts`
--

CREATE TABLE IF NOT EXISTS `nicaw_accounts` (
  `account_id` int(10) unsigned NOT NULL,
  `rlname` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `comment` tinytext,
  `recovery_key` char(32) DEFAULT NULL,
  UNIQUE KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `nicaw_accounts`
--

INSERT INTO `nicaw_accounts` (`account_id`, `rlname`, `location`, `comment`, `recovery_key`) VALUES
(8548596, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `nicaw_account_logs`
--

CREATE TABLE IF NOT EXISTS `nicaw_account_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `nicaw_account_logs`
--

INSERT INTO `nicaw_account_logs` (`id`, `account_id`, `ip`, `date`, `action`) VALUES
(1, 8548596, 2130706433, 1309701004, 'Created'),
(2, 8548596, 2130706433, 1309701022, 'Created character: Lutzenek');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `nicaw_guild_info`
--

CREATE TABLE IF NOT EXISTS `nicaw_guild_info` (
  `id` int(10) unsigned NOT NULL COMMENT 'guild id',
  `description` tinytext,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `nicaw_guild_info`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `nicaw_guild_invites`
--

CREATE TABLE IF NOT EXISTS `nicaw_guild_invites` (
  `gid` int(10) unsigned NOT NULL COMMENT 'guild id',
  `pid` int(10) unsigned NOT NULL COMMENT 'player id',
  `rank` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `nicaw_guild_invites`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `nicaw_news`
--

CREATE TABLE IF NOT EXISTS `nicaw_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `creator` varchar(25) NOT NULL,
  `date` int(11) NOT NULL,
  `text` text NOT NULL,
  `html` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `nicaw_news`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `nicaw_polls`
--

CREATE TABLE IF NOT EXISTS `nicaw_polls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `startdate` int(10) unsigned NOT NULL,
  `enddate` int(10) unsigned NOT NULL,
  `minlevel` int(10) unsigned NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `nicaw_polls`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `nicaw_poll_options`
--

CREATE TABLE IF NOT EXISTS `nicaw_poll_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL,
  `option` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `nicaw_poll_options`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `nicaw_poll_votes`
--

CREATE TABLE IF NOT EXISTS `nicaw_poll_votes` (
  `option_id` int(10) unsigned NOT NULL,
  `account_id` int(11) NOT NULL,
  `ip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `nicaw_poll_votes`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `account_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL COMMENT 'users group',
  `access` int(10) NOT NULL DEFAULT '0',
  `sex` int(10) unsigned NOT NULL DEFAULT '0',
  `vocation` int(10) unsigned NOT NULL DEFAULT '0',
  `experience` int(10) unsigned NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '1',
  `maglevel` int(10) unsigned NOT NULL DEFAULT '0',
  `health` int(10) unsigned NOT NULL DEFAULT '100',
  `healthmax` int(10) unsigned NOT NULL DEFAULT '100',
  `mana` int(10) unsigned NOT NULL DEFAULT '100',
  `manamax` int(10) unsigned NOT NULL DEFAULT '100',
  `manaspent` int(10) unsigned NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `direction` int(10) unsigned NOT NULL DEFAULT '0',
  `lookbody` int(10) unsigned NOT NULL DEFAULT '136',
  `lookfeet` int(10) unsigned NOT NULL DEFAULT '10',
  `lookhead` int(10) unsigned NOT NULL DEFAULT '10',
  `looklegs` int(10) unsigned NOT NULL DEFAULT '10',
  `looktype` int(10) unsigned NOT NULL DEFAULT '10',
  `lookaddons` int(10) unsigned NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `cap` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` blob NOT NULL COMMENT 'drunk, poisoned etc (maybe also food and redskull)',
  `redskulltime` int(10) unsigned NOT NULL DEFAULT '0',
  `redskull` tinyint(1) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'additional nick in guild - mostly for web interfaces i think',
  `rank_id` int(11) NOT NULL COMMENT 'by this field everything with guilds is done - player has a rank which belongs to certain guild',
  `town_id` int(11) NOT NULL COMMENT 'old masterpos, temple spawn point position',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `players`
--

INSERT INTO `players` (`id`, `name`, `account_id`, `group_id`, `access`, `sex`, `vocation`, `experience`, `level`, `maglevel`, `health`, `healthmax`, `mana`, `manamax`, `manaspent`, `soul`, `direction`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `posx`, `posy`, `posz`, `cap`, `lastlogin`, `lastip`, `save`, `conditions`, `redskulltime`, `redskull`, `guildnick`, `rank_id`, `town_id`) VALUES
(1, 'lutzenek', 8548596, 0, 9999, 1, 333, 162000001, 215, 0, 7740, 7740, 14160, 14160, 0, 100, 0, 136, 10, 10, 10, 334, 0, 99, 187, 7, 0, 1311590679, 16777343, 1, 0x010001000002000000000398921b0010d7000000110b00000012d007000013adc20200fe, 0, 0, '', 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `player_depotitems`
--

CREATE TABLE IF NOT EXISTS `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `depotid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  KEY `player_id` (`player_id`,`depotid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `player_depotitems`
--

INSERT INTO `player_depotitems` (`player_id`, `depotid`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(1, 0, 102, 101, 2594, 1, ''),
(1, 0, 101, 1, 2589, 1, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `player_items`
--

CREATE TABLE IF NOT EXISTS `player_items` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob COMMENT 'replaces unique_id, action_id, text, special_desc',
  KEY `player_id` (`player_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `player_items`
--

INSERT INTO `player_items` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(1, 129, 102, 2549, 1, ''),
(1, 128, 102, 2549, 1, ''),
(1, 127, 102, 2549, 1, ''),
(1, 126, 102, 2450, 1, ''),
(1, 125, 102, 2450, 1, ''),
(1, 124, 102, 2450, 1, ''),
(1, 123, 102, 2450, 1, ''),
(1, 122, 102, 2450, 1, ''),
(1, 121, 102, 4852, 1, ''),
(1, 120, 102, 4852, 1, ''),
(1, 119, 101, 2296, 1, 0x0c01),
(1, 118, 101, 2316, 1, 0x0c01),
(1, 117, 101, 2310, 1, 0x0c01),
(1, 116, 101, 2266, 1, 0x0c01),
(1, 113, 101, 2314, 1, 0x0c01),
(1, 114, 101, 2267, 1, 0x0c01),
(1, 115, 101, 2308, 1, 0x0c01),
(1, 112, 101, 2309, 1, 0x0c01),
(1, 111, 101, 2269, 1, 0x0c01),
(1, 110, 101, 2312, 1, 0x0c01),
(1, 109, 101, 2287, 1, 0x0c01),
(1, 108, 101, 2315, 1, 0x0c01),
(1, 107, 10, 2450, 1, ''),
(1, 106, 8, 2640, 1, ''),
(1, 105, 7, 2521, 1, ''),
(1, 104, 6, 2450, 1, ''),
(1, 103, 5, 3956, 98, ''),
(1, 102, 3, 1996, 1, ''),
(1, 101, 2, 2003, 1, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `player_skills`
--

CREATE TABLE IF NOT EXISTS `player_skills` (
  `player_id` int(11) NOT NULL,
  `skillid` int(10) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(1, 0, 1, 0),
(1, 1, 1, 0),
(1, 2, 1, 0),
(1, 3, 1, 0),
(1, 4, 1, 0),
(1, 5, 1, 0),
(1, 6, 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `player_spells`
--

CREATE TABLE IF NOT EXISTS `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  KEY `player_id` (`player_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `player_spells`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `player_storage`
--

CREATE TABLE IF NOT EXISTS `player_storage` (
  `player_id` int(11) NOT NULL,
  `key` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  KEY `player_id` (`player_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(1, 20010, 3),
(1, 6628, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `player_viplist`
--

CREATE TABLE IF NOT EXISTS `player_viplist` (
  `player_id` int(11) NOT NULL COMMENT 'id of player whose viplist entry it is',
  `vip_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  KEY `player_id` (`player_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `player_viplist`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `tiles`
--

CREATE TABLE IF NOT EXISTS `tiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2669 ;

--
-- Zrzut danych tabeli `tiles`
--

INSERT INTO `tiles` (`id`, `x`, `y`, `z`) VALUES
(16, 70, 182, 7),
(137, 76, 182, 7),
(286, 78, 174, 7),
(420, 54, 196, 6),
(437, 60, 196, 6),
(450, 54, 198, 6),
(467, 60, 198, 6),
(477, 124, 441, 15),
(490, 55, 196, 5),
(507, 61, 196, 5),
(513, 131, 436, 15),
(523, 55, 198, 5),
(530, 124, 436, 15),
(540, 61, 198, 5),
(557, 57, 178, 6),
(570, 72, 104, 7),
(582, 96, 422, 15),
(596, 64, 179, 6),
(613, 88, 113, 7),
(624, 115, 115, 7),
(639, 115, 95, 7),
(682, 93, 164, 7),
(705, 93, 160, 7),
(723, 93, 156, 7),
(740, 93, 152, 7),
(744, 96, 152, 7),
(776, 93, 164, 6),
(791, 93, 160, 6),
(806, 93, 156, 6),
(821, 93, 152, 6),
(823, 101, 158, 6),
(840, 101, 163, 6),
(870, 93, 164, 5),
(885, 93, 160, 5),
(900, 93, 156, 5),
(915, 93, 152, 5),
(917, 101, 163, 5),
(939, 101, 158, 5),
(969, 93, 164, 4),
(984, 93, 160, 4),
(999, 93, 156, 4),
(1014, 93, 152, 4),
(1016, 101, 163, 4),
(1037, 101, 158, 4),
(1062, 438, 629, 6),
(1088, 442, 629, 6),
(1093, 117, 416, 15),
(1098, 439, 642, 6),
(1115, 444, 642, 6),
(1184, 47, 114, 4),
(1188, 47, 119, 4),
(1273, 55, 119, 4),
(1343, 44, 114, 5),
(1344, 44, 116, 5),
(1452, 55, 113, 5),
(1454, 55, 118, 5),
(1524, 44, 114, 6),
(1525, 44, 116, 6),
(1594, 51, 114, 6),
(1595, 51, 116, 6),
(1696, 43, 114, 7),
(1698, 43, 116, 7),
(1824, 55, 113, 7),
(1830, 55, 119, 7),
(1870, 59, 115, 7),
(1889, 484, 626, 6),
(1905, 335, 905, 7),
(1916, 333, 912, 7),
(1961, 347, 908, 7),
(1977, 351, 905, 7),
(2002, 361, 903, 7),
(2009, 357, 893, 7),
(2028, 347, 893, 7),
(2041, 369, 925, 7),
(2063, 369, 933, 7),
(2103, 381, 928, 7),
(2132, 381, 935, 7),
(2169, 357, 945, 7),
(2203, 78, 169, 7),
(2239, 115, 183, 7),
(2281, 86, 134, 5),
(2283, 86, 136, 5),
(2315, 90, 134, 5),
(2343, 93, 138, 5),
(2347, 94, 134, 5),
(2381, 86, 135, 6),
(2445, 95, 135, 6),
(2468, 87, 135, 7),
(2489, 91, 135, 7),
(2494, 91, 140, 7),
(2510, 95, 135, 7),
(2529, 72, 179, 6),
(2560, 78, 174, 6),
(2581, 78, 169, 6),
(2592, 80, 163, 6),
(2620, 86, 163, 6),
(2634, 54, 187, 6),
(2668, 51, 183, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `tile_items`
--

CREATE TABLE IF NOT EXISTS `tile_items` (
  `tile_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  KEY `tile_id` (`tile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Zrzut danych tabeli `tile_items`
--

INSERT INTO `tile_items` (`tile_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(16, 1, 0, 1252, 1, ''),
(137, 1, 0, 1252, 1, ''),
(286, 1, 0, 1250, 1, ''),
(420, 1, 0, 1252, 1, ''),
(437, 1, 0, 1252, 1, ''),
(450, 1, 0, 1252, 1, ''),
(467, 1, 0, 1252, 1, ''),
(477, 1, 0, 1252, 1, ''),
(490, 1, 0, 1252, 1, ''),
(507, 1, 0, 1252, 1, ''),
(513, 1, 0, 1252, 1, ''),
(523, 1, 0, 1252, 1, ''),
(530, 1, 0, 1252, 1, ''),
(540, 1, 0, 1252, 1, ''),
(557, 1, 0, 1250, 1, ''),
(570, 1, 0, 1252, 1, ''),
(582, 1, 0, 1250, 1, ''),
(596, 1, 0, 1252, 1, ''),
(613, 1, 0, 1252, 1, ''),
(624, 1, 0, 1253, 1, ''),
(639, 1, 0, 1253, 1, ''),
(682, 1, 0, 1250, 1, ''),
(705, 1, 0, 1250, 1, ''),
(723, 1, 0, 1250, 1, ''),
(740, 1, 0, 1250, 1, ''),
(744, 1, 0, 1250, 1, ''),
(776, 1, 0, 1250, 1, ''),
(791, 1, 0, 1250, 1, ''),
(806, 1, 0, 1250, 1, ''),
(821, 1, 0, 1250, 1, ''),
(823, 1, 0, 1250, 1, ''),
(840, 1, 0, 1250, 1, ''),
(870, 1, 0, 1250, 1, ''),
(885, 1, 0, 1250, 1, ''),
(900, 1, 0, 1250, 1, ''),
(915, 1, 0, 1250, 1, ''),
(917, 1, 0, 1250, 1, ''),
(939, 1, 0, 1250, 1, ''),
(969, 1, 0, 1250, 1, ''),
(984, 1, 0, 1250, 1, ''),
(999, 1, 0, 1250, 1, ''),
(1014, 1, 0, 1250, 1, ''),
(1016, 1, 0, 1250, 1, ''),
(1037, 1, 0, 1250, 1, ''),
(1062, 1, 0, 3536, 1, ''),
(1088, 1, 0, 3536, 1, ''),
(1093, 1, 0, 1251, 1, ''),
(1098, 1, 0, 3536, 1, ''),
(1115, 1, 0, 3536, 1, ''),
(1184, 1, 0, 1250, 1, ''),
(1188, 1, 0, 1250, 1, ''),
(1273, 1, 0, 1250, 1, ''),
(1343, 1, 0, 1253, 1, ''),
(1344, 1, 0, 1253, 1, ''),
(1452, 1, 0, 1250, 1, ''),
(1454, 1, 0, 1250, 1, ''),
(1524, 1, 0, 1252, 1, ''),
(1525, 1, 0, 1252, 1, ''),
(1594, 1, 0, 1252, 1, ''),
(1595, 1, 0, 1252, 1, ''),
(1696, 1, 0, 1252, 1, ''),
(1698, 1, 0, 1252, 1, ''),
(1824, 1, 0, 1250, 1, ''),
(1830, 1, 0, 1250, 1, ''),
(1870, 1, 0, 1250, 1, ''),
(1889, 1, 0, 3536, 1, ''),
(1905, 1, 0, 1253, 1, ''),
(1916, 1, 0, 1250, 1, ''),
(1961, 1, 0, 1253, 1, ''),
(1977, 1, 0, 1250, 1, ''),
(2002, 1, 0, 1250, 1, ''),
(2009, 1, 0, 1253, 1, ''),
(2028, 1, 0, 1253, 1, ''),
(2041, 1, 0, 1250, 1, ''),
(2063, 1, 0, 1250, 1, ''),
(2103, 1, 0, 1252, 1, ''),
(2132, 1, 0, 1252, 1, ''),
(2169, 1, 0, 1253, 1, ''),
(2203, 1, 0, 1250, 1, ''),
(2239, 1, 0, 1250, 1, ''),
(2281, 1, 0, 1252, 1, ''),
(2283, 1, 0, 1252, 1, ''),
(2315, 1, 0, 1252, 1, ''),
(2343, 1, 0, 1250, 1, ''),
(2347, 1, 0, 1252, 1, ''),
(2381, 1, 0, 1252, 1, ''),
(2445, 1, 0, 1252, 1, ''),
(2468, 1, 0, 1252, 1, ''),
(2489, 1, 0, 1252, 1, ''),
(2494, 1, 0, 1252, 1, ''),
(2510, 1, 0, 1252, 1, ''),
(2529, 1, 0, 1253, 1, ''),
(2560, 1, 0, 1249, 1, ''),
(2581, 1, 0, 1249, 1, ''),
(2592, 1, 0, 1253, 1, ''),
(2620, 1, 0, 1253, 1, ''),
(2634, 1, 0, 1252, 1, ''),
(2668, 1, 0, 1250, 1, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `z_ots_comunication`
--

CREATE TABLE IF NOT EXISTS `z_ots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `z_ots_comunication`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `z_shop_history_item`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `z_shop_history_item`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `z_shop_history_pacc`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_pacc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `z_shop_history_pacc`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `z_shop_offer`
--

CREATE TABLE IF NOT EXISTS `z_shop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `z_shop_offer`
--

