/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: apartments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bank_accounts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_balance` int(11) NOT NULL DEFAULT 0,
  `account_type` enum('shared', 'job', 'gang') NOT NULL,
  `users` longtext DEFAULT '[]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bank_statements
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bank_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT 'checking',
  `amount` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `statement_type` enum('deposit', 'withdraw') DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bans
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: crypto
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: crypto_transactions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dealers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: gloveboxitems
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: house_plants
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: houselocations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: lapraces
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: occasion_vehicles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: phone_gallery
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: phone_invoices
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: phone_messages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: phone_tweets
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_contacts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_houses
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_mails
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_outfits
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_vehicles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(8) NOT NULL,
  `fakeplate` varchar(8) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_warns
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: players
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE = InnoDB AUTO_INCREMENT = 69 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: playerskins
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: race_tracks
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `race_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creatorid` varchar(50) DEFAULT NULL,
  `creatorname` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  `access` text DEFAULT '{}',
  `curated` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `raceid` (`raceid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: racer_names
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `racer_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` text NOT NULL,
  `racername` text NOT NULL,
  `lasttouched` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `races` int(11) NOT NULL DEFAULT 0,
  `wins` int(11) NOT NULL DEFAULT 0,
  `tracks` int(11) NOT NULL DEFAULT 0,
  `auth` text DEFAULT 'racer',
  `createdby` text DEFAULT NULL,
  `revoked` tinyint(4) DEFAULT 0,
  KEY `id` (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: stashitems
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: trunkitems
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: weedplants
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `weedplants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `time` int(255) NOT NULL,
  `fertilizer` longtext NOT NULL CHECK (json_valid(`fertilizer`)),
  `water` longtext NOT NULL CHECK (json_valid(`water`)),
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: apartments
# ------------------------------------------------------------

INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    1,
    'apartment4407',
    'apartment4',
    'Tinsel Towers 407',
    'WCO36682'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bank_accounts
# ------------------------------------------------------------

INSERT INTO
  `bank_accounts` (
    `id`,
    `citizenid`,
    `account_name`,
    `account_balance`,
    `account_type`,
    `users`
  )
VALUES
  (1, NULL, 'bennys', 0, 'job', '[]');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bank_statements
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bans
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: crypto
# ------------------------------------------------------------

INSERT INTO
  `crypto` (`crypto`, `worth`, `history`)
VALUES
  (
    'qbit',
    1080,
    '[{\"PreviousWorth\":1063,\"NewWorth\":1071},{\"PreviousWorth\":1063,\"NewWorth\":1071},{\"PreviousWorth\":1063,\"NewWorth\":1071},{\"PreviousWorth\":1071,\"NewWorth\":1080}]'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: crypto_transactions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: dealers
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: gloveboxitems
# ------------------------------------------------------------

INSERT INTO
  `gloveboxitems` (`id`, `plate`, `items`)
VALUES
  (1, '20NEA619', '[]');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: house_plants
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: houselocations
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lapraces
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: occasion_vehicles
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: phone_gallery
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: phone_invoices
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: phone_messages
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: phone_tweets
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_contacts
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_houses
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_mails
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_outfits
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_vehicles
# ------------------------------------------------------------

INSERT INTO
  `player_vehicles` (
    `id`,
    `license`,
    `citizenid`,
    `vehicle`,
    `hash`,
    `mods`,
    `plate`,
    `fakeplate`,
    `garage`,
    `fuel`,
    `engine`,
    `body`,
    `state`,
    `depotprice`,
    `drivingdistance`,
    `status`,
    `balance`,
    `paymentamount`,
    `paymentsleft`,
    `financetime`
  )
VALUES
  (
    1,
    'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1',
    'WCO36682',
    'tenf2',
    '274946574',
    '{\"modTrimA\":-1,\"extras\":[],\"model\":274946574,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"oilLevel\":4.76596940834568,\"modDashboard\":-1,\"modAPlate\":-1,\"plateIndex\":0,\"wheelWidth\":0.0,\"plate\":\"49QOW020\",\"modDoorSpeaker\":-1,\"modKit19\":-1,\"modCustomTiresR\":false,\"tyreSmokeColor\":[255,255,255],\"tankHealth\":999.2649192831461,\"modOrnaments\":-1,\"modHydrolic\":-1,\"dirtLevel\":0.0,\"modKit49\":-1,\"pearlescentColor\":4,\"modTurbo\":1,\"wheelSize\":0.0,\"modKit17\":-1,\"modTank\":-1,\"modAirFilter\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modRoof\":-1,\"modAerials\":-1,\"xenonColor\":255,\"modFrame\":-1,\"modGrille\":-1,\"modSuspension\":4,\"color1\":19,\"liveryRoof\":-1,\"modTrimB\":-1,\"modRearBumper\":-1,\"modArchCover\":-1,\"modStruts\":-1,\"modExhaust\":-1,\"interiorColor\":37,\"bodyHealth\":994.4989498748004,\"modSteeringWheel\":-1,\"modHorns\":-1,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modCustomTiresF\":false,\"modKit47\":-1,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modBrakes\":2,\"modHood\":-1,\"modEngine\":3,\"modArmor\":4,\"modFender\":-1,\"modLivery\":-1,\"dashboardColor\":156,\"modRightFender\":-1,\"modFrontWheels\":-1,\"modTrunk\":-1,\"modSideSkirt\":-1,\"color2\":0,\"modSpoilers\":-1,\"modFrontBumper\":-1,\"modSpeakers\":-1,\"fuelLevel\":61.16327407376967,\"modDial\":-1,\"wheels\":7,\"modEngineBlock\":-1,\"neonColor\":[255,0,255],\"modTransmission\":2,\"windowTint\":-1,\"modSeats\":-1,\"engineHealth\":1000.0592475178704,\"wheelColor\":0,\"modKit21\":-1,\"modPlateHolder\":-1,\"modWindows\":-1,\"modSmokeEnabled\":false,\"neonEnabled\":[false,false,false,false],\"tireHealth\":{\"1\":999.75,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modBackWheels\":-1,\"headlightColor\":255,\"modXenon\":false}',
    '49QOW020',
    NULL,
    'pillboxgarage',
    62,
    1000,
    995,
    1,
    0,
    NULL,
    '{\"brakes\":98,\"axle\":100,\"fuel\":96,\"clutch\":100,\"radiator\":100}',
    0,
    0,
    0,
    0
  );
INSERT INTO
  `player_vehicles` (
    `id`,
    `license`,
    `citizenid`,
    `vehicle`,
    `hash`,
    `mods`,
    `plate`,
    `fakeplate`,
    `garage`,
    `fuel`,
    `engine`,
    `body`,
    `state`,
    `depotprice`,
    `drivingdistance`,
    `status`,
    `balance`,
    `paymentamount`,
    `paymentsleft`,
    `financetime`
  )
VALUES
  (
    2,
    'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1',
    'WCO36682',
    'coureur',
    '610429990',
    '{\"modTrunk\":-1,\"modStruts\":-1,\"modFrame\":-1,\"modRearBumper\":-1,\"modKit17\":-1,\"modKit19\":-1,\"modKit21\":-1,\"modHood\":-1,\"tyreSmokeColor\":[255,255,255],\"modTurbo\":false,\"modSeats\":-1,\"modRoof\":-1,\"modArmor\":-1,\"modSuspension\":-1,\"neonColor\":[255,0,255],\"wheelSize\":1.0,\"oilLevel\":4.76596940834568,\"wheels\":7,\"modDoorSpeaker\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"fuelLevel\":63.54625877794252,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modBackWheels\":-1,\"interiorColor\":93,\"modTrimA\":-1,\"tankHealth\":1000.0592475178704,\"modShifterLeavers\":-1,\"modFrontBumper\":-1,\"wheelWidth\":1.0,\"modHorns\":-1,\"modAPlate\":-1,\"dashboardColor\":134,\"modEngineBlock\":-1,\"pearlescentColor\":73,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modKit47\":-1,\"modGrille\":-1,\"modKit49\":-1,\"modAerials\":-1,\"modTank\":-1,\"modEngine\":-1,\"bodyHealth\":996.8819345789732,\"model\":610429990,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modSpeakers\":-1,\"modVanityPlate\":-1,\"modBrakes\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modDashboard\":-1,\"headlightColor\":255,\"modPlateHolder\":-1,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modFender\":-1,\"plateIndex\":0,\"color2\":64,\"modOrnaments\":-1,\"modXenon\":false,\"modCustomTiresR\":false,\"extras\":{\"1\":true},\"modSmokeEnabled\":false,\"plate\":\"6KP012FL\",\"modRightFender\":-1,\"dirtLevel\":4.76596940834568,\"wheelColor\":0,\"modLivery\":-1,\"windowTint\":-1,\"modTrimB\":-1,\"modCustomTiresF\":false,\"modTransmission\":-1,\"modWindows\":-1,\"modHydrolic\":-1,\"xenonColor\":255,\"color1\":64,\"engineHealth\":1000.0592475178704,\"modDial\":-1,\"modSteeringWheel\":-1,\"liveryRoof\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modExhaust\":-1,\"modAirFilter\":-1,\"neonEnabled\":[false,false,false,false]}',
    '6KP012FL',
    NULL,
    'pillboxgarage',
    64,
    1000,
    997,
    1,
    0,
    NULL,
    '{\"clutch\":100,\"fuel\":100,\"brakes\":100,\"axle\":100,\"radiator\":100}',
    0,
    0,
    0,
    0
  );
INSERT INTO
  `player_vehicles` (
    `id`,
    `license`,
    `citizenid`,
    `vehicle`,
    `hash`,
    `mods`,
    `plate`,
    `fakeplate`,
    `garage`,
    `fuel`,
    `engine`,
    `body`,
    `state`,
    `depotprice`,
    `drivingdistance`,
    `status`,
    `balance`,
    `paymentamount`,
    `paymentsleft`,
    `financetime`
  )
VALUES
  (
    3,
    'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1',
    'WCO36682',
    'euros',
    '2038480341',
    '{\"modTrunk\":-1,\"modStruts\":-1,\"modFrame\":7,\"modRearBumper\":1,\"modKit17\":-1,\"modKit19\":-1,\"modKit21\":-1,\"modHood\":-1,\"tyreSmokeColor\":[255,255,255],\"modTurbo\":1,\"modSeats\":14,\"modRoof\":5,\"modArmor\":4,\"modSuspension\":3,\"neonColor\":[15,3,255],\"wheelSize\":0.6822765469551,\"oilLevel\":4.76596940834568,\"wheels\":11,\"modDoorSpeaker\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"fuelLevel\":42.8937246751112,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modBackWheels\":-1,\"interiorColor\":7,\"modTrimA\":1,\"tankHealth\":3997.8540053673089,\"modShifterLeavers\":-1,\"modFrontBumper\":1,\"wheelWidth\":0.53567004203796,\"modHorns\":0,\"modAPlate\":-1,\"dashboardColor\":156,\"modEngineBlock\":-1,\"pearlescentColor\":60,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modKit47\":-1,\"modGrille\":-1,\"modKit49\":-1,\"modAerials\":-1,\"modTank\":-1,\"modEngine\":3,\"bodyHealth\":980.2010416497633,\"model\":2038480341,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modSpeakers\":-1,\"modVanityPlate\":1,\"modBrakes\":2,\"modSideSkirt\":8,\"modSpoilers\":-1,\"modDashboard\":2,\"headlightColor\":255,\"modPlateHolder\":-1,\"modFrontWheels\":74,\"modArchCover\":-1,\"modFender\":-1,\"plateIndex\":1,\"color2\":65,\"modOrnaments\":-1,\"modXenon\":1,\"modCustomTiresR\":false,\"extras\":[],\"modSmokeEnabled\":false,\"plate\":\"20NEA619\",\"modRightFender\":-1,\"dirtLevel\":0.79432823472428,\"wheelColor\":0,\"modLivery\":11,\"windowTint\":1,\"modTrimB\":3,\"modCustomTiresF\":false,\"modTransmission\":2,\"modWindows\":-1,\"modHydrolic\":-1,\"xenonColor\":255,\"color1\":73,\"engineHealth\":996.8819345789732,\"modDial\":-1,\"modSteeringWheel\":14,\"liveryRoof\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modExhaust\":-1,\"modAirFilter\":-1,\"neonEnabled\":[1,1,1,1]}',
    '20NEA619',
    NULL,
    'pillboxgarage',
    43,
    997,
    980,
    1,
    0,
    NULL,
    '{\"clutch\":97,\"fuel\":100,\"brakes\":98,\"axle\":97,\"radiator\":98}',
    0,
    0,
    0,
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_warns
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: players
# ------------------------------------------------------------

INSERT INTO
  `players` (
    `id`,
    `citizenid`,
    `cid`,
    `license`,
    `name`,
    `money`,
    `charinfo`,
    `job`,
    `gang`,
    `position`,
    `metadata`,
    `inventory`,
    `last_updated`
  )
VALUES
  (
    1,
    'WCO36682',
    1,
    'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1',
    'Jay',
    '{\"crypto\":0,\"cash\":9829388929989,\"bank\":9829389236864}',
    '{\"gender\":0,\"nationality\":\"Afghanistan\",\"backstory\":\"placeholder backstory\",\"cid\":1,\"birthdate\":\"1990-08-30\",\"lastname\":\"Char\",\"account\":\"US08QBCore4758822654\",\"phone\":\"7675192132\",\"firstname\":\"Dev\"}',
    '{\"onduty\":true,\"payment\":150,\"name\":\"bennys\",\"label\":\"Benny\'s Original Motor Works\",\"isboss\":true,\"type\":\"mechanic\",\"grade\":{\"level\":4,\"name\":\"Manager\"}}',
    '{\"label\":\"No Gang Affiliaton\",\"isboss\":false,\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0}}',
    '{\"x\":149.22198486328126,\"y\":-1046.848388671875,\"z\":29.3304443359375}',
    '{\"walletid\":\"QB-36759105\",\"stress\":1,\"tracker\":false,\"injail\":0,\"selectedRacerName\":\"FWO TidehBop\",\"criminalrecord\":{\"hasRecord\":false},\"craftingrep\":0,\"inlaststand\":false,\"fitbit\":[],\"thirst\":88.60000000000001,\"callsign\":\"NO CALLSIGN\",\"bloodtype\":\"O-\",\"isdead\":false,\"jailitems\":[],\"inside\":{\"apartment\":[]},\"hunger\":87.39999999999999,\"phonedata\":{\"SerialNumber\":60194216,\"InstalledApps\":[]},\"jobrep\":{\"hotdog\":0,\"trucker\":0,\"taxi\":0,\"tow\":0},\"status\":[],\"fingerprint\":\"Rn299K16SiJ6345\",\"armor\":0,\"dealerrep\":0,\"attachmentcraftingrep\":0,\"ishandcuffed\":false,\"licences\":{\"weapon\":false,\"driver\":true,\"business\":false},\"phone\":[],\"selectedRacerAuth\":\"god\"}',
    '[{\"amount\":1,\"slot\":1,\"type\":\"weapon\",\"name\":\"weapon_pistol\",\"info\":{\"quality\":94.4499999999998,\"serie\":\"62Ugg6xv529qutR\",\"ammo\":67}},{\"amount\":1,\"slot\":2,\"type\":\"item\",\"name\":\"harness\",\"info\":{\"uses\":18}},{\"amount\":1,\"slot\":3,\"type\":\"item\",\"name\":\"racing_gps\",\"info\":[]},{\"amount\":1,\"slot\":4,\"type\":\"item\",\"name\":\"oxy\",\"info\":{\"recieverName\":\"test\",\"citizenId\":\"tester\",\"notes\":\"Due to broken penis\",\"giverName\":\"Doctor Dingle Berry\",\"drug\":\"Oxy\",\"fromDate\":\"12/6/2023\"}},{\"amount\":1,\"slot\":5,\"type\":\"item\",\"name\":\"tunerlaptop\",\"info\":[]},{\"amount\":1,\"slot\":6,\"type\":\"item\",\"name\":\"driver_license\",\"info\":{\"type\":\"Class C Driver License\",\"lastname\":\"Char\",\"birthdate\":\"1990-08-30\",\"firstname\":\"Dev\"}},{\"amount\":1,\"slot\":7,\"type\":\"item\",\"name\":\"veh_suspension\",\"info\":[]},{\"amount\":1,\"slot\":8,\"type\":\"item\",\"name\":\"phone\",\"info\":[]},{\"amount\":1,\"slot\":9,\"type\":\"item\",\"name\":\"id_card\",\"info\":{\"gender\":0,\"citizenid\":\"WCO36682\",\"lastname\":\"Char\",\"firstname\":\"Dev\",\"nationality\":\"Afghanistan\",\"birthdate\":\"1990-08-30\"}},{\"amount\":1,\"slot\":10,\"type\":\"item\",\"name\":\"veh_engine\",\"info\":[]},{\"amount\":1,\"slot\":11,\"type\":\"item\",\"name\":\"prescription_card\",\"info\":{\"recieverName\":\"test\",\"expirationDate\":\"22/22/22\",\"citizenId\":\"test\",\"notes\":\"test\",\"giverName\":\"Test\",\"drug\":\"Oxy\",\"fromDate\":\"12/6/2023\"}},{\"amount\":1,\"slot\":12,\"type\":\"item\",\"name\":\"veh_turbo\",\"info\":[]},{\"amount\":1,\"slot\":13,\"type\":\"item\",\"name\":\"weedplant_seedm\",\"info\":[]},{\"amount\":1,\"slot\":15,\"type\":\"item\",\"name\":\"camera\",\"info\":[]},{\"amount\":1,\"slot\":16,\"type\":\"item\",\"name\":\"veh_brakes\",\"info\":[]},{\"amount\":1,\"slot\":17,\"type\":\"item\",\"name\":\"veh_toolbox\",\"info\":[]},{\"amount\":1,\"slot\":21,\"type\":\"item\",\"name\":\"veh_armor\",\"info\":[]},{\"amount\":1,\"slot\":27,\"type\":\"item\",\"name\":\"repairkit\",\"info\":[]},{\"amount\":1,\"slot\":28,\"type\":\"item\",\"name\":\"advancedrepairkit\",\"info\":[]},{\"amount\":1,\"slot\":29,\"type\":\"item\",\"name\":\"tirerepairkit\",\"info\":[]}]',
    '2023-12-06 22:57:29'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: playerskins
# ------------------------------------------------------------

INSERT INTO
  `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`)
VALUES
  (
    1,
    'WCO36682',
    '1885233650',
    '{\"neck_thikness\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_0\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"face\":{\"item\":28,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":7},\"moles\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"nose_1\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"face2\":{\"item\":18,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"eye_opening\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"makeup\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"torso2\":{\"item\":502,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"mask\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"arms\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_lowering\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"decals\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"hat\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"eyebrown_high\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_4\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"ear\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"lipstick\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"cheek_1\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_width\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"shoes\":{\"item\":62,\"defaultTexture\":0,\"defaultItem\":1,\"texture\":4},\"chimp_bone_lenght\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"jaw_bone_back_lenght\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"eyebrown_forward\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"eyebrows\":{\"item\":29,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"lips_thickness\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"jaw_bone_width\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"cheek_3\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"bag\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"facemix\":{\"shapeMix\":0.41,\"defaultShapeMix\":0.0,\"skinMix\":0,\"defaultSkinMix\":0.0},\"cheek_2\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"vest\":{\"item\":89,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"t-shirt\":{\"item\":15,\"defaultTexture\":0,\"defaultItem\":1,\"texture\":0},\"ageing\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"nose_5\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"chimp_hole\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_3\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_2\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"beard\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"hair\":{\"item\":75,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"accessory\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"blush\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"bracelet\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"watch\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"glass\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"eye_color\":{\"item\":27,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"pants\":{\"item\":97,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":23}}',
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: race_tracks
# ------------------------------------------------------------

INSERT INTO
  `race_tracks` (
    `id`,
    `name`,
    `checkpoints`,
    `records`,
    `creatorid`,
    `creatorname`,
    `distance`,
    `raceid`,
    `access`,
    `curated`
  )
VALUES
  (
    1,
    'First Ever Race',
    '[{\"coords\":{\"y\":-2214.700439453125,\"x\":588.17626953125,\"z\":5.33072853088378},\"offset\":{\"left\":{\"y\":-2213.947265625,\"x\":581.21728515625,\"z\":5.4017219543457},\"right\":{\"y\":-2215.45361328125,\"x\":595.13525390625,\"z\":5.25973510742187}}},{\"coords\":{\"y\":-2151.05126953125,\"x\":441.1722412109375,\"z\":16.13723373413086},\"offset\":{\"left\":{\"y\":-2158.29345703125,\"x\":444.5696716308594,\"z\":16.03893661499023},\"right\":{\"y\":-2143.80908203125,\"x\":437.7748107910156,\"z\":16.23553085327148}}},{\"coords\":{\"y\":-2131.732177734375,\"x\":295.38037109375,\"z\":14.69620704650878},\"offset\":{\"left\":{\"y\":-2141.17431640625,\"x\":286.4447326660156,\"z\":14.71760749816894},\"right\":{\"y\":-2122.2900390625,\"x\":304.3160095214844,\"z\":14.67480659484863}}},{\"coords\":{\"y\":-2052.611328125,\"x\":-40.11820983886719,\"z\":19.55707168579101},\"offset\":{\"left\":{\"y\":-2064.925537109375,\"x\":-35.95233535766601,\"z\":19.48872184753418},\"right\":{\"y\":-2040.297119140625,\"x\":-44.28408432006836,\"z\":19.62542152404785}}},{\"coords\":{\"y\":-2039.0052490234376,\"x\":-409.5696411132813,\"z\":25.32349014282226},\"offset\":{\"left\":{\"y\":-2046.154541015625,\"x\":-415.0304870605469,\"z\":25.58218002319336},\"right\":{\"y\":-2031.85595703125,\"x\":-404.1087951660156,\"z\":25.06480026245117}}},{\"coords\":{\"y\":-1782.0799560546876,\"x\":-403.9142761230469,\"z\":20.62799644470215},\"offset\":{\"left\":{\"y\":-1783.839599609375,\"x\":-417.8031005859375,\"z\":20.55988883972168},\"right\":{\"y\":-1780.3203125,\"x\":-390.02545166015627,\"z\":20.69610404968261}}},{\"coords\":{\"y\":-1431.191162109375,\"x\":-307.98406982421877,\"z\":30.6593952178955},\"offset\":{\"left\":{\"y\":-1452.1654052734376,\"x\":-306.9466247558594,\"z\":30.73631477355957},\"right\":{\"y\":-1410.2169189453126,\"x\":-309.0215148925781,\"z\":30.58247566223144}}},{\"coords\":{\"y\":-1291.383544921875,\"x\":-367.9093017578125,\"z\":36.63049697875976},\"offset\":{\"left\":{\"y\":-1287.641845703125,\"x\":-376.0942687988281,\"z\":36.7107925415039},\"right\":{\"y\":-1295.125244140625,\"x\":-359.7243347167969,\"z\":36.55020141601562}}},{\"coords\":{\"y\":-1246.552490234375,\"x\":654.030029296875,\"z\":41.35019302368164},\"offset\":{\"left\":{\"y\":-1238.72900390625,\"x\":655.6979370117188,\"z\":41.24712753295898},\"right\":{\"y\":-1254.3759765625,\"x\":652.3621215820313,\"z\":41.4532585144043}}},{\"coords\":{\"y\":-1388.4757080078126,\"x\":796.5804443359375,\"z\":26.3008918762207},\"offset\":{\"left\":{\"y\":-1389.1585693359376,\"x\":809.5624389648438,\"z\":26.27272415161132},\"right\":{\"y\":-1387.7928466796876,\"x\":783.5984497070313,\"z\":26.32905960083008}}},{\"coords\":{\"y\":-1758.0093994140626,\"x\":882.23388671875,\"z\":29.43227005004882},\"offset\":{\"left\":{\"y\":-1741.0457763671876,\"x\":883.3445434570313,\"z\":29.42478370666504},\"right\":{\"y\":-1774.9730224609376,\"x\":881.1232299804688,\"z\":29.43975639343261}}},{\"coords\":{\"y\":-1662.6361083984376,\"x\":1269.7620849609376,\"z\":46.64179992675781},\"offset\":{\"left\":{\"y\":-1654.054443359375,\"x\":1264.631591796875,\"z\":46.82509994506836},\"right\":{\"y\":-1671.2177734375,\"x\":1274.892578125,\"z\":46.45849990844726}}},{\"coords\":{\"y\":-1435.8836669921876,\"x\":1135.0555419921876,\"z\":34.05559539794922},\"offset\":{\"left\":{\"y\":-1449.880126953125,\"x\":1134.7960205078126,\"z\":34.23761749267578},\"right\":{\"y\":-1421.88720703125,\"x\":1135.3150634765626,\"z\":33.87357330322265}}},{\"coords\":{\"y\":-1474.148681640625,\"x\":395.5058898925781,\"z\":28.68600082397461},\"offset\":{\"left\":{\"y\":-1486.2470703125,\"x\":402.5505981445313,\"z\":28.69711875915527},\"right\":{\"y\":-1462.05029296875,\"x\":388.461181640625,\"z\":28.67488288879394}}},{\"coords\":{\"y\":-1583.1099853515626,\"x\":400.6892700195313,\"z\":28.6853084564209},\"offset\":{\"left\":{\"y\":-1571.562744140625,\"x\":411.7645263671875,\"z\":28.69268417358398},\"right\":{\"y\":-1594.6572265625,\"x\":389.614013671875,\"z\":28.67793273925781}}},{\"coords\":{\"y\":-1697.6517333984376,\"x\":395.2007141113281,\"z\":28.6479434967041},\"offset\":{\"left\":{\"y\":-1702.4537353515626,\"x\":401.5979919433594,\"z\":28.77479743957519},\"right\":{\"y\":-1692.8497314453126,\"x\":388.8034362792969,\"z\":28.521089553833}}},{\"coords\":{\"y\":-1910.7874755859376,\"x\":319.1643371582031,\"z\":25.11222457885742},\"offset\":{\"left\":{\"y\":-1904.80908203125,\"x\":324.4776306152344,\"z\":25.28065490722656},\"right\":{\"y\":-1916.765869140625,\"x\":313.8510437011719,\"z\":24.94379425048828}}},{\"coords\":{\"y\":-1907.6348876953126,\"x\":499.1021423339844,\"z\":24.83514022827148},\"offset\":{\"left\":{\"y\":-1900.431884765625,\"x\":495.6466369628906,\"z\":24.41446304321289},\"right\":{\"y\":-1914.837890625,\"x\":502.5576477050781,\"z\":25.25581741333008}}},{\"coords\":{\"y\":-1602.9483642578126,\"x\":604.328125,\"z\":25.51258850097656},\"offset\":{\"left\":{\"y\":-1604.8607177734376,\"x\":596.5616455078125,\"z\":25.35693359375},\"right\":{\"y\":-1601.0360107421876,\"x\":612.0946044921875,\"z\":25.66824340820312}}},{\"coords\":{\"y\":-1326.58447265625,\"x\":518.5889282226563,\"z\":28.66043281555176},\"offset\":{\"left\":{\"y\":-1331.0050048828126,\"x\":511.9237365722656,\"z\":28.4765625},\"right\":{\"y\":-1322.1639404296876,\"x\":525.2540893554688,\"z\":28.84430313110351}}},{\"coords\":{\"y\":-665.6963500976563,\"x\":511.7055358886719,\"z\":24.1198501586914},\"offset\":{\"left\":{\"y\":-665.5765991210938,\"x\":505.7068786621094,\"z\":24.16214561462402},\"right\":{\"y\":-665.8161010742188,\"x\":517.7041625976563,\"z\":24.07755470275879}}}]',
    '[{\"Vehicle\":\"Euros\",\"Time\":200844,\"Holder\":\"FWO TidehBop\",\"Class\":\"S\"}]',
    'WCO36682',
    'FWO TidehBop',
    6706,
    'LR-6306',
    '{}',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: racer_names
# ------------------------------------------------------------

INSERT INTO
  `racer_names` (
    `id`,
    `citizenid`,
    `racername`,
    `lasttouched`,
    `races`,
    `wins`,
    `tracks`,
    `auth`,
    `createdby`,
    `revoked`
  )
VALUES
  (
    1,
    'WCO36682',
    'FWO TidehBop',
    '2023-12-05 23:52:59',
    0,
    0,
    0,
    'god',
    'WCO36682',
    0
  );
INSERT INTO
  `racer_names` (
    `id`,
    `citizenid`,
    `racername`,
    `lasttouched`,
    `races`,
    `wins`,
    `tracks`,
    `auth`,
    `createdby`,
    `revoked`
  )
VALUES
  (
    2,
    'WCO36682',
    'YeeBee',
    '2023-12-05 23:55:03',
    0,
    0,
    0,
    'racer',
    'WCO36682',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: stashitems
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: trunkitems
# ------------------------------------------------------------

INSERT INTO
  `trunkitems` (`id`, `plate`, `items`)
VALUES
  (1, '20NEA619', '[]');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: weedplants
# ------------------------------------------------------------


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
