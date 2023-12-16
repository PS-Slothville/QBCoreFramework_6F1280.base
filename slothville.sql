-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for slothville
CREATE DATABASE IF NOT EXISTS `slothville` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `slothville`;

-- Dumping structure for table slothville.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.apartments: ~0 rows (approximately)

-- Dumping structure for table slothville.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_balance` int(11) NOT NULL DEFAULT 0,
  `account_type` enum('shared','job','gang') NOT NULL,
  `users` longtext DEFAULT '[]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.bank_accounts: ~0 rows (approximately)
REPLACE INTO `bank_accounts` (`id`, `citizenid`, `account_name`, `account_balance`, `account_type`, `users`) VALUES
	(3, NULL, 'police', 0, 'job', '[]');

-- Dumping structure for table slothville.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT 'checking',
  `amount` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `statement_type` enum('deposit','withdraw') DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.bank_statements: ~0 rows (approximately)

-- Dumping structure for table slothville.bans
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.bans: ~0 rows (approximately)

-- Dumping structure for table slothville.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table slothville.crypto: ~1 rows (approximately)
REPLACE INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 1018, '[{"PreviousWorth":1026,"NewWorth":1027},{"PreviousWorth":1026,"NewWorth":1027},{"PreviousWorth":1026,"NewWorth":1027},{"NewWorth":1018,"PreviousWorth":1027}]');

-- Dumping structure for table slothville.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table slothville.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.dealers: ~0 rows (approximately)

-- Dumping structure for table slothville.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.gloveboxitems: ~0 rows (approximately)

-- Dumping structure for table slothville.houselocations
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.houselocations: ~0 rows (approximately)

-- Dumping structure for table slothville.house_plants
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.house_plants: ~0 rows (approximately)

-- Dumping structure for table slothville.lapraces
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.lapraces: ~0 rows (approximately)

-- Dumping structure for table slothville.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table slothville.management_outfits: ~0 rows (approximately)

-- Dumping structure for table slothville.multijobs
CREATE TABLE IF NOT EXISTS `multijobs` (
  `citizenid` varchar(100) NOT NULL,
  `jobdata` text DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table slothville.multijobs: ~2 rows (approximately)
REPLACE INTO `multijobs` (`citizenid`, `jobdata`) VALUES
	('IOK99947', '{"police":4,"realestate":4,"bennys":3}'),
	('SIG65091', '{"police":4}');

-- Dumping structure for table slothville.occasion_vehicles
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.occasion_vehicles: ~0 rows (approximately)

-- Dumping structure for table slothville.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table slothville.phone_gallery: ~0 rows (approximately)

-- Dumping structure for table slothville.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.phone_invoices: ~0 rows (approximately)

-- Dumping structure for table slothville.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.phone_messages: ~0 rows (approximately)

-- Dumping structure for table slothville.phone_tweets
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.phone_tweets: ~0 rows (approximately)

-- Dumping structure for table slothville.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.players: ~1 rows (approximately)
REPLACE INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
	(247, 'IOK99947', 1, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'Jay', '{"bank":23947983475534,"crypto":0,"cash":23947983388884}', '{"account":"US08QBCore7508324364","cid":1,"firstname":"Dev","gender":0,"backstory":"placeholder backstory","birthdate":"2023-12-15","lastname":"Dev","phone":"2491645758","nationality":"Afghanistan"}', '{"grade":{"name":"Chief","level":4},"onduty":true,"label":"Law Enforcement","payment":150,"type":"leo","name":"police","isboss":true}', '{"label":"No Gang Affiliaton","grade":{"name":"none","level":0},"name":"none","isboss":false}', '{"x":128.10989379882813,"y":-205.4769287109375,"z":54.5040283203125}', '{"isdead":false,"phone":[],"thirst":58.20000000000003,"selectedRacerAuth":"god","hunger":53.79999999999997,"fingerprint":"Cn136a95EcJ0989","criminalrecord":{"hasRecord":false},"injail":0,"callsign":"NO CALLSIGN","phonedata":{"SerialNumber":81325504,"InstalledApps":[]},"dealerrep":0,"stress":7,"armor":0,"attachmentcraftingrep":0,"walletid":"QB-98368335","craftingrep":0,"licences":{"driver":true,"weapon":false,"business":false},"ishandcuffed":false,"jailitems":[],"tracker":false,"status":[],"inlaststand":false,"bloodtype":"B+","selectedRacerName":"Spagle","jobrep":{"hotdog":0,"trucker":0,"taxi":0,"tow":0},"fitbit":[],"inside":{"apartment":[]}}', '[{"type":"weapon","info":{"ammo":112,"serie":"66Fbt6tH066VzEv","quality":39.84999999999886},"name":"weapon_combatpistol","amount":1,"slot":1},{"type":"item","info":[],"name":"veh_toolbox","amount":1,"slot":2},{"type":"item","info":[],"name":"veh_exterior","amount":8,"slot":5},{"type":"item","info":[],"name":"weedplant_seedm","amount":1,"slot":6},{"type":"item","info":[],"name":"lockpick","amount":1,"slot":7},{"type":"item","info":[],"name":"racing_gps","amount":1,"slot":9},{"type":"item","info":[],"name":"phone","amount":1,"slot":13},{"type":"item","info":{"type":"Class C Driver License","firstname":"Dev","birthdate":"2023-12-15","lastname":"Dev"},"name":"driver_license","amount":1,"slot":11},{"type":"item","info":{"birthdate":"2023-12-15","lastname":"Dev","citizenid":"IOK99947","firstname":"Dev","nationality":"Afghanistan","gender":0},"name":"id_card","amount":1,"slot":12}]', '2023-12-15 23:45:01');

-- Dumping structure for table slothville.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table slothville.playerskins: ~1 rows (approximately)
REPLACE INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(7, 'IOK99947', 'mp_m_freemode_01', '{"faceFeatures":{"neckThickness":0,"chinBoneLowering":0,"cheeksWidth":0,"eyeBrownHigh":0,"lipsThickness":0,"noseWidth":0,"nosePeakHigh":0,"nosePeakLowering":0,"eyeBrownForward":0,"eyesOpening":0,"chinHole":0,"noseBoneTwist":0,"chinBoneLenght":0,"cheeksBoneHigh":0,"cheeksBoneWidth":0,"chinBoneSize":0,"noseBoneHigh":0,"nosePeakSize":0,"jawBoneBackSize":0,"jawBoneWidth":0},"model":"mp_m_freemode_01","tattoos":{"ZONE_HAIR":[{"label":"hair-24-11","collection":"mpBiker_overlays","name":"hair-24-11","hashMale":"MP_Biker_Hair_003_M","zone":"ZONE_HAIR","hashFemale":"MP_Biker_Hair_003_F"}]},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headBlend":{"shapeThird":0,"thirdMix":0,"shapeFirst":2,"shapeMix":0.8,"skinSecond":0,"skinFirst":7,"shapeSecond":6,"skinThird":0,"skinMix":0.3},"eyeColor":4,"headOverlays":{"makeUp":{"secondColor":0,"style":0,"opacity":0,"color":0},"lipstick":{"secondColor":0,"style":0,"opacity":0,"color":0},"blemishes":{"secondColor":0,"style":0,"opacity":0,"color":0},"complexion":{"secondColor":0,"style":0,"opacity":0,"color":0},"moleAndFreckles":{"secondColor":0,"style":0,"opacity":0,"color":0},"blush":{"secondColor":0,"style":0,"opacity":0,"color":0},"bodyBlemishes":{"secondColor":0,"style":0,"opacity":0,"color":0},"chestHair":{"secondColor":0,"style":0,"opacity":0,"color":0},"ageing":{"secondColor":0,"style":0,"opacity":0,"color":0},"eyebrows":{"secondColor":0,"style":12,"opacity":1,"color":0},"beard":{"secondColor":0,"style":3,"opacity":0.5,"color":0},"sunDamage":{"secondColor":0,"style":0,"opacity":0,"color":0}},"hair":{"style":73,"texture":0,"color":0,"highlight":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":183},{"texture":0,"component_id":2,"drawable":73},{"texture":0,"component_id":3,"drawable":176},{"texture":0,"component_id":5,"drawable":0},{"texture":6,"component_id":6,"drawable":12},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":15},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":65},{"texture":0,"component_id":4,"drawable":38}]}', 1);

-- Dumping structure for table slothville.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.player_contacts: ~0 rows (approximately)

-- Dumping structure for table slothville.player_houses
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.player_houses: ~0 rows (approximately)

-- Dumping structure for table slothville.player_mails
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.player_mails: ~0 rows (approximately)

-- Dumping structure for table slothville.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table slothville.player_outfits: ~0 rows (approximately)

-- Dumping structure for table slothville.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table slothville.player_outfit_codes: ~0 rows (approximately)

-- Dumping structure for table slothville.player_vehicles
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.player_vehicles: ~2 rows (approximately)
REPLACE INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`) VALUES
	(5, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'IOK99947', 'sultan2', '872704284', '{"modSteeringWheel":-1,"fuelLevel":43.68805290983548,"wheelWidth":1.0,"modWindows":-1,"headlightColor":255,"modShifterLeavers":-1,"model":872704284,"modVanityPlate":-1,"modKit21":-1,"modTurbo":false,"extras":[],"modDashboard":-1,"tyreSmokeColor":[255,255,255],"modKit49":-1,"modStruts":-1,"modRearBumper":-1,"modDial":-1,"modTransmission":-1,"modArmor":-1,"modLivery":-1,"modHood":-1,"xenonColor":255,"modOrnaments":-1,"dashboardColor":160,"neonEnabled":[false,false,false,false],"modSpeakers":-1,"modSpoilers":-1,"plateIndex":0,"modAerials":-1,"modAirFilter":-1,"bodyHealth":996.8819345789732,"modFrontWheels":-1,"modRoof":-1,"modCustomTiresR":false,"wheels":5,"modEngineBlock":-1,"modFrontBumper":-1,"modGrille":-1,"modKit47":-1,"modPlateHolder":-1,"color2":50,"interiorColor":3,"modSmokeEnabled":false,"modHydrolic":-1,"modArchCover":-1,"modAPlate":-1,"modSuspension":-1,"color1":50,"modKit19":-1,"windowTint":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFender":-1,"modXenon":false,"engineHealth":997.6762628136975,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"modExhaust":-1,"modCustomTiresF":false,"modTrimA":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"oilLevel":4.76596940834568,"plate":"00GCO690","modBackWheels":-1,"modBrakes":-1,"dirtLevel":0.79432823472428,"tankHealth":1000.0592475178704,"wheelSize":1.0,"modSideSkirt":-1,"modHorns":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit17":-1,"modTrunk":-1,"modFrame":-1,"liveryRoof":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modDoorSpeaker":-1,"pearlescentColor":57,"modEngine":-1,"modTrimB":-1,"neonColor":[255,0,255],"modTank":-1,"wheelColor":156,"modRightFender":-1}', '00GCO690', NULL, '4', 43, 998, 997, 1, 0, NULL, '{"axle":98,"brakes":98,"radiator":98,"fuel":100,"clutch":100}', 0, 0, 0, 0),
	(6, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'IOK99947', 'sadler', '-599568815', '{"modVanityPlate":-1,"modKit49":-1,"wheelSize":0.0,"modArchCover":-1,"pearlescentColor":14,"modAPlate":-1,"modDoorSpeaker":-1,"plate":"5GQ404CR","modFender":-1,"modSteeringWheel":-1,"modRightFender":-1,"modDial":-1,"modBrakes":-1,"modSmokeEnabled":false,"tyreSmokeColor":[255,255,255],"modSpeakers":-1,"modSeats":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDashboard":-1,"modFrontBumper":-1,"xenonColor":255,"modTrunk":-1,"modAirFilter":-1,"neonColor":[255,0,255],"modKit17":-1,"modFrontWheels":-1,"modFrame":-1,"modTank":-1,"modHorns":-1,"modBackWheels":-1,"modTransmission":-1,"modArmor":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modStruts":-1,"engineHealth":1000.0592475178704,"dashboardColor":0,"modTrimA":-1,"dirtLevel":11.91492352086422,"modLivery":-1,"modXenon":false,"modExhaust":-1,"modKit19":-1,"modSuspension":-1,"windowTint":-1,"modEngineBlock":-1,"extras":{"1":false,"2":true,"10":false,"11":false,"12":true,"7":false,"5":false,"6":false,"4":false},"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"bodyHealth":1000.0592475178704,"modSideSkirt":-1,"modRoof":-1,"liveryRoof":-1,"modTrimB":-1,"modTurbo":false,"modSpoilers":-1,"modGrille":-1,"neonEnabled":[false,false,false,false],"modHood":-1,"modCustomTiresF":false,"modWindows":-1,"modShifterLeavers":-1,"color1":11,"modAerials":-1,"modEngine":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"headlightColor":255,"modHydrolic":-1,"modCustomTiresR":false,"model":-599568815,"wheelColor":156,"modKit47":-1,"modRearBumper":-1,"modKit21":-1,"modOrnaments":-1,"modPlateHolder":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"oilLevel":6.35462587779425,"wheelWidth":0.0,"plateIndex":0,"tankHealth":1000.0592475178704,"interiorColor":0,"fuelLevel":100.08535757525947,"wheels":3,"color2":11}', '5GQ404CR', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0);

-- Dumping structure for table slothville.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.player_warns: ~0 rows (approximately)

-- Dumping structure for table slothville.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `has_access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`has_access`)),
  `extra_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`extra_imgs`)),
  `furnitures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`furnitures`)),
  `for_sale` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `shell` varchar(50) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `door_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`door_data`)),
  `garage_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_data`)),
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `UQ_owner_apartment` (`owner_citizenid`,`apartment`),
  CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table slothville.properties: ~2 rows (approximately)
REPLACE INTO `properties` (`property_id`, `owner_citizenid`, `street`, `region`, `description`, `has_access`, `extra_imgs`, `furnitures`, `for_sale`, `price`, `shell`, `apartment`, `door_data`, `garage_data`) VALUES
	(3, 'IOK99947', NULL, NULL, 'This is Dev Dev\'s apartment in South Rockford Drive', '[]', '[]', '[{"label":"Storage Unit","id":"8737963","type":"storage","rotation":{"z":90.0,"y":-0.0,"x":0.0},"object":"v_res_tre_storagebox","position":{"z":-1.5515,"y":1.91,"x":2.89}},{"label":"Wardrobe","id":"2956433","type":"clothing","rotation":{"x":0.0,"y":-0.0,"z":-90.0},"object":"v_res_tre_wardrobe","position":{"z":-1.5558,"y":0.65,"x":2.8699}}]', 0, 0, 'Standard Motel', 'South Rockford Drive', '[]', '[]'),
	(4, 'IOK99947', 'Nikola Pl', 'Mirror Park', 'The best place in mirror park', '[]', '[]', '[]', 1, 5, '2 Floor House', NULL, '{"y":-593.45,"z":74.48,"locked":false,"length":1.5,"x":1386.24,"width":2.2,"h":232.2}', '{"y":-597.16,"z":74.33,"length":3.0,"h":50.84,"width":5.0,"x":1378.81}');

-- Dumping structure for table slothville.racer_names
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table slothville.racer_names: ~2 rows (approximately)
REPLACE INTO `racer_names` (`id`, `citizenid`, `racername`, `lasttouched`, `races`, `wins`, `tracks`, `auth`, `createdby`, `revoked`) VALUES
	(3, 'IOK99947', 'Spagle', '2023-12-15 02:33:02', 0, 0, 0, 'god', 'IOK99947', 0),
	(4, 'IOK99947', 'Spagle2', '2023-12-15 02:33:19', 0, 0, 0, 'god', 'IOK99947', 0);

-- Dumping structure for table slothville.race_tracks
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table slothville.race_tracks: ~0 rows (approximately)
REPLACE INTO `race_tracks` (`id`, `name`, `checkpoints`, `records`, `creatorid`, `creatorname`, `distance`, `raceid`, `access`, `curated`) VALUES
	(1, 'First Ever Race', '[{"coords":{"y":-2214.700439453125,"x":588.17626953125,"z":5.33072853088378},"offset":{"left":{"y":-2213.947265625,"x":581.21728515625,"z":5.4017219543457},"right":{"y":-2215.45361328125,"x":595.13525390625,"z":5.25973510742187}}},{"coords":{"y":-2151.05126953125,"x":441.1722412109375,"z":16.13723373413086},"offset":{"left":{"y":-2158.29345703125,"x":444.5696716308594,"z":16.03893661499023},"right":{"y":-2143.80908203125,"x":437.7748107910156,"z":16.23553085327148}}},{"coords":{"y":-2131.732177734375,"x":295.38037109375,"z":14.69620704650878},"offset":{"left":{"y":-2141.17431640625,"x":286.4447326660156,"z":14.71760749816894},"right":{"y":-2122.2900390625,"x":304.3160095214844,"z":14.67480659484863}}},{"coords":{"y":-2052.611328125,"x":-40.11820983886719,"z":19.55707168579101},"offset":{"left":{"y":-2064.925537109375,"x":-35.95233535766601,"z":19.48872184753418},"right":{"y":-2040.297119140625,"x":-44.28408432006836,"z":19.62542152404785}}},{"coords":{"y":-2039.0052490234376,"x":-409.5696411132813,"z":25.32349014282226},"offset":{"left":{"y":-2046.154541015625,"x":-415.0304870605469,"z":25.58218002319336},"right":{"y":-2031.85595703125,"x":-404.1087951660156,"z":25.06480026245117}}},{"coords":{"y":-1782.0799560546876,"x":-403.9142761230469,"z":20.62799644470215},"offset":{"left":{"y":-1783.839599609375,"x":-417.8031005859375,"z":20.55988883972168},"right":{"y":-1780.3203125,"x":-390.02545166015627,"z":20.69610404968261}}},{"coords":{"y":-1431.191162109375,"x":-307.98406982421877,"z":30.6593952178955},"offset":{"left":{"y":-1452.1654052734376,"x":-306.9466247558594,"z":30.73631477355957},"right":{"y":-1410.2169189453126,"x":-309.0215148925781,"z":30.58247566223144}}},{"coords":{"y":-1291.383544921875,"x":-367.9093017578125,"z":36.63049697875976},"offset":{"left":{"y":-1287.641845703125,"x":-376.0942687988281,"z":36.7107925415039},"right":{"y":-1295.125244140625,"x":-359.7243347167969,"z":36.55020141601562}}},{"coords":{"y":-1246.552490234375,"x":654.030029296875,"z":41.35019302368164},"offset":{"left":{"y":-1238.72900390625,"x":655.6979370117188,"z":41.24712753295898},"right":{"y":-1254.3759765625,"x":652.3621215820313,"z":41.4532585144043}}},{"coords":{"y":-1388.4757080078126,"x":796.5804443359375,"z":26.3008918762207},"offset":{"left":{"y":-1389.1585693359376,"x":809.5624389648438,"z":26.27272415161132},"right":{"y":-1387.7928466796876,"x":783.5984497070313,"z":26.32905960083008}}},{"coords":{"y":-1758.0093994140626,"x":882.23388671875,"z":29.43227005004882},"offset":{"left":{"y":-1741.0457763671876,"x":883.3445434570313,"z":29.42478370666504},"right":{"y":-1774.9730224609376,"x":881.1232299804688,"z":29.43975639343261}}},{"coords":{"y":-1662.6361083984376,"x":1269.7620849609376,"z":46.64179992675781},"offset":{"left":{"y":-1654.054443359375,"x":1264.631591796875,"z":46.82509994506836},"right":{"y":-1671.2177734375,"x":1274.892578125,"z":46.45849990844726}}},{"coords":{"y":-1435.8836669921876,"x":1135.0555419921876,"z":34.05559539794922},"offset":{"left":{"y":-1449.880126953125,"x":1134.7960205078126,"z":34.23761749267578},"right":{"y":-1421.88720703125,"x":1135.3150634765626,"z":33.87357330322265}}},{"coords":{"y":-1474.148681640625,"x":395.5058898925781,"z":28.68600082397461},"offset":{"left":{"y":-1486.2470703125,"x":402.5505981445313,"z":28.69711875915527},"right":{"y":-1462.05029296875,"x":388.461181640625,"z":28.67488288879394}}},{"coords":{"y":-1583.1099853515626,"x":400.6892700195313,"z":28.6853084564209},"offset":{"left":{"y":-1571.562744140625,"x":411.7645263671875,"z":28.69268417358398},"right":{"y":-1594.6572265625,"x":389.614013671875,"z":28.67793273925781}}},{"coords":{"y":-1697.6517333984376,"x":395.2007141113281,"z":28.6479434967041},"offset":{"left":{"y":-1702.4537353515626,"x":401.5979919433594,"z":28.77479743957519},"right":{"y":-1692.8497314453126,"x":388.8034362792969,"z":28.521089553833}}},{"coords":{"y":-1910.7874755859376,"x":319.1643371582031,"z":25.11222457885742},"offset":{"left":{"y":-1904.80908203125,"x":324.4776306152344,"z":25.28065490722656},"right":{"y":-1916.765869140625,"x":313.8510437011719,"z":24.94379425048828}}},{"coords":{"y":-1907.6348876953126,"x":499.1021423339844,"z":24.83514022827148},"offset":{"left":{"y":-1900.431884765625,"x":495.6466369628906,"z":24.41446304321289},"right":{"y":-1914.837890625,"x":502.5576477050781,"z":25.25581741333008}}},{"coords":{"y":-1602.9483642578126,"x":604.328125,"z":25.51258850097656},"offset":{"left":{"y":-1604.8607177734376,"x":596.5616455078125,"z":25.35693359375},"right":{"y":-1601.0360107421876,"x":612.0946044921875,"z":25.66824340820312}}},{"coords":{"y":-1326.58447265625,"x":518.5889282226563,"z":28.66043281555176},"offset":{"left":{"y":-1331.0050048828126,"x":511.9237365722656,"z":28.4765625},"right":{"y":-1322.1639404296876,"x":525.2540893554688,"z":28.84430313110351}}},{"coords":{"y":-665.6963500976563,"x":511.7055358886719,"z":24.1198501586914},"offset":{"left":{"y":-665.5765991210938,"x":505.7068786621094,"z":24.16214561462402},"right":{"y":-665.8161010742188,"x":517.7041625976563,"z":24.07755470275879}}}]', '[{"Vehicle":"Euros","Time":200844,"Holder":"FWO TidehBop","Class":"S"}]', 'WCO36682', 'FWO TidehBop', 6706, 'LR-6306', '{}', 0),
	(2, 'County Circuit', '[{"coords":{"x":1915.898193359375,"z":44.92018127441406,"y":3245.181640625},"offset":{"left":{"x":1918.709228515625,"z":45.00728988647461,"y":3237.6923828125},"right":{"x":1913.087158203125,"z":44.83307266235351,"y":3252.6708984375}}},{"coords":{"x":1500.745361328125,"z":41.15540313720703,"y":3047.9912109375},"offset":{"left":{"x":1505.123291015625,"z":41.15803146362305,"y":3043.888427734375},"right":{"x":1496.367431640625,"z":41.15277481079101,"y":3052.093994140625}}},{"coords":{"x":1079.7625732421876,"z":41.21303558349609,"y":2970.28466796875},"offset":{"left":{"x":1079.90869140625,"z":41.222412109375,"y":2964.286376953125},"right":{"x":1079.616455078125,"z":41.20365905761719,"y":2976.282958984375}}},{"coords":{"x":639.1195068359375,"z":43.34089660644531,"y":3071.6884765625},"offset":{"left":{"x":640.9505615234375,"z":43.33726119995117,"y":3065.974609375},"right":{"x":637.2884521484375,"z":43.34453201293945,"y":3077.40234375}}},{"coords":{"x":261.8995361328125,"z":41.88043975830078,"y":3135.535400390625},"offset":{"left":{"x":262.12841796875,"z":41.88153839111328,"y":3129.539794921875},"right":{"x":261.670654296875,"z":41.87934112548828,"y":3141.531005859375}}},{"coords":{"x":218.0886993408203,"z":41.47073364257812,"y":3237.412841796875},"offset":{"left":{"x":210.2037353515625,"z":41.52676391601562,"y":3238.763427734375},"right":{"x":225.97366333007813,"z":41.41470336914062,"y":3236.062255859375}}},{"coords":{"x":173.41539001464845,"z":37.72440719604492,"y":3401.207763671875},"offset":{"left":{"x":170.0395050048828,"z":37.7678108215332,"y":3393.955078125},"right":{"x":176.79127502441407,"z":37.68100357055664,"y":3408.46044921875}}},{"coords":{"x":-71.1732406616211,"z":44.18035507202148,"y":3605.953125},"offset":{"left":{"x":-72.7914047241211,"z":44.19211196899414,"y":3599.142822265625},"right":{"x":-69.5550765991211,"z":44.16859817504883,"y":3612.763427734375}}},{"coords":{"x":-221.59942626953126,"z":37.13151168823242,"y":3960.51953125},"offset":{"left":{"x":-228.51419067382813,"z":37.13344955444336,"y":3961.608642578125},"right":{"x":-214.68466186523438,"z":37.12957382202148,"y":3959.430419921875}}},{"coords":{"x":-90.23905181884766,"z":46.56930923461914,"y":4304.6884765625},"offset":{"left":{"x":-96.03022003173828,"z":46.52876281738281,"y":4308.62060546875},"right":{"x":-84.44788360595703,"z":46.60985565185547,"y":4300.75634765625}}},{"coords":{"x":333.42724609375,"z":61.67296981811523,"y":4500.73046875},"offset":{"left":{"x":338.1651611328125,"z":61.68405151367187,"y":4505.88330078125},"right":{"x":328.6893310546875,"z":61.66188812255859,"y":4495.57763671875}}},{"coords":{"x":676.2330932617188,"z":54.75848770141601,"y":4241.705078125},"offset":{"left":{"x":675.8081665039063,"z":54.76110458374023,"y":4248.6923828125},"right":{"x":676.6580200195313,"z":54.7558708190918,"y":4234.7177734375}}},{"coords":{"x":832.6201782226563,"z":52.03833389282226,"y":4401.33642578125},"offset":{"left":{"x":826.8245849609375,"z":52.03351974487305,"y":4399.78369140625},"right":{"x":838.415771484375,"z":52.04314804077148,"y":4402.88916015625}}},{"coords":{"x":1119.74609375,"z":63.38479232788086,"y":4423.029296875},"offset":{"left":{"x":1120.9151611328126,"z":63.38715744018555,"y":4428.91455078125},"right":{"x":1118.5770263671876,"z":63.38242721557617,"y":4417.14404296875}}},{"coords":{"x":1590.8232421875,"z":47.38955307006836,"y":4569.74609375},"offset":{"left":{"x":1589.9556884765626,"z":47.42789840698242,"y":4575.68310546875},"right":{"x":1591.6907958984376,"z":47.3512077331543,"y":4563.80908203125}}},{"coords":{"x":1694.09716796875,"z":41.74990463256836,"y":4718.2783203125},"offset":{"left":{"x":1687.39892578125,"z":41.72067642211914,"y":4716.2451171875},"right":{"x":1700.79541015625,"z":41.77913284301758,"y":4720.3115234375}}},{"coords":{"x":1838.646728515625,"z":54.93945693969726,"y":5080.875},"offset":{"left":{"x":1834.316650390625,"z":54.93789672851562,"y":5086.375},"right":{"x":1842.976806640625,"z":54.9410171508789,"y":5075.375}}},{"coords":{"x":2011.0980224609376,"z":47.15962219238281,"y":5169.5595703125},"offset":{"left":{"x":2006.687255859375,"z":47.15732192993164,"y":5174.9951171875},"right":{"x":2015.5087890625,"z":47.16192245483398,"y":5164.1240234375}}},{"coords":{"x":2293.319580078125,"z":59.26054000854492,"y":5182.7333984375},"offset":{"left":{"x":2290.76220703125,"z":59.27288818359375,"y":5189.24951171875},"right":{"x":2295.876953125,"z":59.24819183349609,"y":5176.21728515625}}},{"coords":{"x":2443.98681640625,"z":46.37164688110351,"y":5126.22119140625},"offset":{"left":{"x":2447.645263671875,"z":46.37871551513672,"y":5132.18896484375},"right":{"x":2440.328369140625,"z":46.36457824707031,"y":5120.25341796875}}},{"coords":{"x":2679.130615234375,"z":43.99551773071289,"y":4825.79296875},"offset":{"left":{"x":2688.046630859375,"z":43.99856567382812,"y":4827.01904296875},"right":{"x":2670.214599609375,"z":43.99246978759765,"y":4824.56689453125}}},{"coords":{"x":2811.72998046875,"z":49.62870025634765,"y":4292.20263671875},"offset":{"left":{"x":2820.1201171875,"z":49.63370895385742,"y":4295.45947265625},"right":{"x":2803.33984375,"z":49.62369155883789,"y":4288.94580078125}}},{"coords":{"x":2901.47265625,"z":52.05006408691406,"y":3762.307861328125},"offset":{"left":{"x":2910.30078125,"z":52.05546188354492,"y":3760.5576171875},"right":{"x":2892.64453125,"z":52.0446662902832,"y":3764.05810546875}}},{"coords":{"x":2538.818115234375,"z":42.79790496826172,"y":3049.4365234375},"offset":{"left":{"x":2541.2763671875,"z":42.79472732543945,"y":3045.08251953125},"right":{"x":2536.35986328125,"z":42.80108261108398,"y":3053.79052734375}}},{"coords":{"x":2301.146484375,"z":45.93133544921875,"y":3062.1337890625},"offset":{"left":{"x":2294.19873046875,"z":46.03860855102539,"y":3062.981201171875},"right":{"x":2308.09423828125,"z":45.82406234741211,"y":3061.286376953125}}},{"coords":{"x":2178.221435546875,"z":46.76425552368164,"y":3252.528076171875},"offset":{"left":{"x":2176.6806640625,"z":46.81613159179687,"y":3245.699951171875},"right":{"x":2179.76220703125,"z":46.7123794555664,"y":3259.356201171875}}},{"coords":{"x":1986.801025390625,"z":44.95058441162109,"y":3292.63330078125},"offset":{"left":{"x":1991.6595458984376,"z":45.00247573852539,"y":3286.27783203125},"right":{"x":1981.9425048828126,"z":44.8986930847168,"y":3298.98876953125}}}]', '[{"Class":"S","Holder":"FWO TidehBop","Time":270747,"Vehicle":"Zentorno"},{"Holder":"Spagle","Time":283968,"Class":"X","Vehicle":"model not found","RaceType":"Circuit"}]', 'WCO36682', 'FWO TidehBop', 9117, 'LR-9531', '{}', 0);

-- Dumping structure for table slothville.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.stashitems: ~2 rows (approximately)
REPLACE INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(9, 'property_1', '[]'),
	(10, 'property_3', '[]');

-- Dumping structure for table slothville.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table slothville.trunkitems: ~0 rows (approximately)

-- Dumping structure for table slothville.weedplants
CREATE TABLE IF NOT EXISTS `weedplants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `time` int(255) NOT NULL,
  `fertilizer` longtext NOT NULL CHECK (json_valid(`fertilizer`)),
  `water` longtext NOT NULL CHECK (json_valid(`water`)),
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table slothville.weedplants: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
