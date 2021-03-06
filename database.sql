CREATE TABLE `nicaw_accounts` (
  `account_id` int(10) unsigned NOT NULL,
  `rlname` varchar(50) NULL,
  `location` varchar(50) NULL,
  `comment` tinytext NULL,
  `recovery_key` char(32) NULL,
  UNIQUE KEY `account_id` (`account_id`)
) ENGINE = InnoDB;

CREATE TABLE `nicaw_account_logs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `account_id` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `account_id` (`account_id`)
) ENGINE = InnoDB;

CREATE TABLE `nicaw_news` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(64) NOT NULL,
  `creator` varchar(25) NOT NULL,
  `date` int(11) NOT NULL,
  `text` text NOT NULL,
  `html` tinyint(1) NOT NULL default '0',
  UNIQUE KEY `id` (`id`)
) ENGINE = InnoDB;

CREATE TABLE `nicaw_polls` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `question` varchar(255) NOT NULL,
  `startdate` int(10) unsigned NOT NULL,
  `enddate` int(10) unsigned NOT NULL,
  `minlevel` int(10) unsigned NOT NULL,
  `hidden` tinyint(1) NOT NULL default '0',
  UNIQUE KEY `id` (`id`)
) ENGINE = InnoDB;

CREATE TABLE `nicaw_poll_options` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `poll_id` int(10) unsigned NOT NULL,
  `option` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE = InnoDB;

CREATE TABLE `nicaw_poll_votes` (
  `option_id` int(10) unsigned NOT NULL,
  `account_id` int(11) NOT NULL,
  `ip` int(11) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `nicaw_guild_invites` (
	`gid` int(10) unsigned NOT NULL COMMENT 'guild id',
	`pid` int(10) unsigned NOT NULL COMMENT 'player id',
	`rank` int(10) unsigned NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `nicaw_guild_info` (
	`id` int(10) unsigned NOT NULL COMMENT 'guild id',
	`description` TINYTEXT NULL,
	UNIQUE KEY `id` (`id`)
) ENGINE = InnoDB;