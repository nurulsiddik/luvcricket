-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema crickdb
--

CREATE DATABASE IF NOT EXISTS crickdb;
USE crickdb;

--
-- Definition of table `player_contribution`
--

DROP TABLE IF EXISTS `player_contribution`;
CREATE TABLE `player_contribution` (
  `match_id` smallint(6) NOT NULL default '0',
  `player_id` int(11) NOT NULL default '0',
  `runs_scored` smallint(6) default NULL,
  `wickets_taken` smallint(6) default NULL,
  `catches` smallint(6) default NULL,
  `stumps` smallint(6) default NULL,
  `runout` smallint(6) default NULL,
  `player_points` smallint(6) default NULL,
  PRIMARY KEY  (`match_id`,`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_contribution`
--

/*!40000 ALTER TABLE `player_contribution` DISABLE KEYS */;
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (1,61,36,0,1,0,0,42),
 (1,62,9,0,1,0,0,15),
 (1,64,0,1,0,0,0,26),
 (1,65,11,3,0,0,1,102),
 (1,66,6,0,0,0,0,7),
 (1,67,0,0,3,1,0,21),
 (1,69,11,2,0,0,0,62),
 (1,70,37,0,0,0,0,38),
 (1,71,11,0,1,0,0,17),
 (1,74,62,0,1,0,0,78),
 (1,75,0,2,0,0,0,51),
 (1,136,37,0,2,0,0,48),
 (1,138,16,3,2,0,0,112),
 (1,139,19,0,1,0,0,25),
 (1,140,8,1,0,0,0,34),
 (1,141,2,0,0,0,0,3),
 (1,143,1,2,0,0,0,52),
 (1,144,1,0,3,0,0,17),
 (1,145,63,0,0,0,0,74),
 (1,146,49,0,0,0,0,50),
 (1,148,32,3,0,0,0,118),
 (1,150,2,1,0,0,0,28),
 (2,0,113,0,0,0,0,149),
 (2,1,0,0,1,0,0,6),
 (2,2,15,0,0,0,0,16),
 (2,3,46,0,1,0,0,52),
 (2,5,60,0,0,0,1,76),
 (2,6,29,1,0,0,0,55),
 (2,7,40,1,0,0,0,66),
 (2,8,4,0,0,0,0,5),
 (2,11,0,3,0,0,1,91),
 (2,13,0,2,0,0,0,51),
 (2,14,18,0,1,0,0,24),
 (2,226,4,1,0,0,0,30),
 (2,227,6,0,0,0,0,7),
 (2,228,0,0,0,0,0,1),
 (2,229,19,1,0,0,0,45),
 (2,230,3,0,0,0,0,4),
 (2,231,16,2,0,0,0,67);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (2,232,0,1,1,0,0,31),
 (2,237,1,0,0,0,0,2),
 (2,238,6,1,0,0,0,32),
 (2,239,51,0,0,1,0,67),
 (2,240,9,0,0,0,0,10),
 (3,166,72,2,2,0,0,143),
 (3,167,0,1,0,0,1,31),
 (3,169,0,2,0,0,0,51),
 (3,170,35,0,1,0,1,46),
 (3,171,0,0,0,0,0,1),
 (3,172,4,0,0,0,0,5),
 (3,173,0,0,0,0,0,1),
 (3,174,0,1,1,0,0,31),
 (3,176,58,0,0,1,0,74),
 (3,178,6,0,0,0,0,7),
 (3,180,0,1,0,0,1,31),
 (3,181,8,0,0,0,0,9),
 (3,182,19,0,1,0,0,25),
 (3,183,41,0,0,0,0,42),
 (3,184,1,1,0,0,0,27),
 (3,185,34,0,0,0,0,35),
 (3,189,1,1,0,0,0,27),
 (3,190,34,1,0,0,0,60),
 (3,191,25,0,1,0,0,31),
 (3,192,1,0,0,0,0,2),
 (3,193,6,0,0,0,0,7),
 (3,194,15,0,0,0,0,16),
 (4,45,0,0,0,0,0,1),
 (4,46,4,0,1,0,0,10),
 (4,47,6,0,0,0,0,7),
 (4,48,28,1,0,0,0,54),
 (4,49,14,0,1,0,0,20),
 (4,50,6,2,1,0,0,62),
 (4,53,1,1,0,0,0,27),
 (4,54,0,2,0,0,0,51),
 (4,56,6,0,1,0,0,12),
 (4,57,0,0,0,0,0,1),
 (4,58,4,0,2,0,0,15),
 (4,121,85,0,1,0,0,101);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (4,122,2,0,0,0,0,3),
 (4,125,12,0,0,0,0,13),
 (4,127,22,0,0,0,0,23),
 (4,128,0,0,1,0,0,6),
 (4,129,9,4,0,0,0,120),
 (4,130,0,3,0,0,0,86),
 (4,131,0,2,0,0,0,51),
 (4,132,76,0,3,0,0,102),
 (4,133,55,0,0,0,0,66),
 (4,134,30,0,0,0,0,31),
 (4,135,0,1,0,0,0,26),
 (5,151,1,0,0,0,0,2),
 (5,152,3,2,0,0,0,54),
 (5,153,12,0,0,0,0,13),
 (5,154,4,2,1,0,0,60),
 (5,156,12,0,0,0,0,13),
 (5,159,73,0,0,0,0,84),
 (5,160,0,2,0,0,0,51),
 (5,162,1,1,0,0,0,27),
 (5,163,67,0,1,0,0,83),
 (5,164,24,0,3,1,0,45),
 (5,165,14,1,0,0,1,45),
 (5,196,20,1,0,0,1,51),
 (5,197,0,2,0,0,1,56),
 (5,198,1,1,0,0,0,27),
 (5,199,115,0,1,0,0,156),
 (5,202,15,0,1,0,0,21),
 (5,205,21,0,1,0,0,27),
 (5,206,10,1,0,0,0,36),
 (5,207,1,0,1,0,1,12),
 (5,208,0,0,0,0,0,1),
 (5,209,0,1,1,0,0,31),
 (5,210,28,1,0,0,0,54),
 (6,106,67,1,1,0,0,108),
 (6,107,72,0,0,0,0,83),
 (6,109,128,0,0,0,1,169),
 (6,110,0,1,0,0,0,26),
 (6,113,0,2,0,0,0,51);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (6,114,0,1,1,0,0,31),
 (6,115,75,0,0,0,0,86),
 (6,116,0,1,0,0,0,26),
 (6,117,0,0,0,0,1,6),
 (6,118,0,0,0,0,1,6),
 (6,119,0,0,0,0,0,1),
 (6,211,5,1,0,0,0,31),
 (6,213,2,1,0,0,0,28),
 (6,214,21,0,0,0,0,22),
 (6,216,17,0,0,0,0,18),
 (6,218,4,0,0,0,0,5),
 (6,220,0,0,1,0,0,6),
 (6,221,1,1,0,0,0,27),
 (6,222,12,0,0,0,0,13),
 (6,223,57,0,0,0,0,68),
 (6,224,5,0,2,0,0,16),
 (6,225,1,0,0,0,0,2),
 (7,76,26,0,0,0,0,27),
 (7,77,0,2,0,0,0,51),
 (7,78,5,0,0,0,0,6),
 (7,80,31,0,0,0,0,32),
 (7,81,3,0,1,0,0,9),
 (7,82,0,0,1,0,0,6),
 (7,83,0,0,1,0,0,6),
 (7,86,42,0,1,0,0,48),
 (7,87,0,1,0,0,0,26),
 (7,88,60,0,0,0,0,71),
 (7,89,29,1,0,0,0,55),
 (7,91,7,0,0,0,0,8),
 (7,93,0,0,0,0,0,1),
 (7,94,0,0,0,0,0,1),
 (7,95,0,0,4,0,0,21),
 (7,96,87,2,1,0,0,153),
 (7,97,0,2,0,0,0,51),
 (7,98,27,0,0,0,0,28),
 (7,99,0,0,0,0,0,1),
 (7,100,0,2,1,0,0,56),
 (7,104,63,1,0,0,0,99),
 (7,105,0,0,0,0,0,1),
 (8,15,1,0,1,0,0,7);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (8,16,2,0,0,0,0,3),
 (8,17,0,3,2,0,0,96),
 (8,18,8,0,2,0,0,19),
 (8,20,0,4,0,0,0,111),
 (8,21,8,0,0,0,0,9),
 (8,22,0,3,0,0,0,86),
 (8,23,56,0,2,0,0,77),
 (8,25,53,0,0,0,0,64),
 (8,27,0,0,0,0,0,1),
 (8,28,51,0,0,0,0,62),
 (8,30,14,0,0,0,0,15),
 (8,31,7,0,0,0,0,8),
 (8,32,0,0,0,0,0,1),
 (8,33,0,0,1,2,0,16),
 (8,34,66,0,0,0,0,77),
 (8,35,0,0,0,0,0,1),
 (8,37,15,1,0,0,0,41),
 (8,39,15,2,0,0,0,66),
 (8,41,2,2,0,0,0,53),
 (8,43,9,0,0,0,0,10),
 (8,44,47,0,0,0,0,48),
 (9,61,1,0,0,0,0,2),
 (9,62,0,0,1,0,0,6),
 (9,63,2,0,0,0,0,3),
 (9,65,8,2,0,0,0,59),
 (9,66,24,0,0,0,0,25),
 (9,67,27,0,0,1,0,33),
 (9,69,4,1,2,0,0,40),
 (9,70,15,0,0,0,0,16),
 (9,73,12,3,0,0,0,98),
 (9,74,9,1,0,0,0,35),
 (9,75,1,0,0,0,0,2),
 (9,196,9,1,2,0,0,45),
 (9,197,0,2,0,0,0,51),
 (9,198,0,2,1,0,0,56),
 (9,199,3,0,1,0,0,9),
 (9,202,0,1,0,0,0,26),
 (9,203,0,0,1,0,0,6),
 (9,205,2,0,2,0,0,13),
 (9,206,16,1,0,0,0,42);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (9,207,72,0,2,0,0,93),
 (9,208,13,0,1,0,0,19),
 (9,209,0,3,0,0,0,86),
 (9,210,4,0,0,0,0,5),
 (10,0,23,0,0,0,0,24),
 (10,1,0,2,0,0,0,51),
 (10,2,93,0,1,0,1,114),
 (10,3,57,0,0,1,0,73),
 (10,5,59,0,1,0,0,75),
 (10,6,123,0,0,0,0,159),
 (10,7,0,4,0,0,0,111),
 (10,8,2,0,1,0,0,8),
 (10,11,0,2,0,0,0,51),
 (10,13,0,1,0,0,0,26),
 (10,14,12,0,0,0,0,13),
 (10,211,0,0,1,0,0,6),
 (10,212,8,0,0,0,0,9),
 (10,213,24,1,1,0,0,55),
 (10,214,14,2,0,0,0,65),
 (10,215,0,0,0,0,0,1),
 (10,216,0,0,0,0,0,1),
 (10,217,0,0,1,0,0,6),
 (10,218,25,0,0,0,0,26),
 (10,220,3,0,0,0,0,4),
 (10,223,1,2,1,0,0,57),
 (10,224,33,0,0,0,0,34),
 (10,225,9,0,0,0,0,10),
 (11,76,45,0,0,0,0,46),
 (11,77,0,1,0,0,0,26),
 (11,78,28,0,1,0,0,34),
 (11,79,29,2,0,0,0,80),
 (11,80,62,0,0,0,1,78),
 (11,81,2,0,0,0,0,3),
 (11,83,66,0,0,0,0,77),
 (11,86,23,0,0,1,0,29),
 (11,87,0,1,0,0,0,26),
 (11,88,5,0,1,0,0,11),
 (11,89,0,2,0,0,0,51);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (11,181,21,0,1,0,0,27),
 (11,182,6,0,1,0,0,12),
 (11,183,7,0,0,0,0,8),
 (11,184,0,0,0,0,0,1),
 (11,185,20,0,0,0,0,21),
 (11,186,27,0,0,0,0,28),
 (11,188,7,1,1,0,0,38),
 (11,189,0,1,0,0,0,26),
 (11,190,30,3,1,0,0,121),
 (11,191,58,0,0,0,0,69),
 (11,194,36,1,0,0,0,62),
 (12,30,7,0,0,0,0,8),
 (12,31,57,1,0,0,0,93),
 (12,32,0,3,0,0,0,86),
 (12,33,29,0,1,0,0,35),
 (12,34,89,0,0,0,0,100),
 (12,36,0,0,1,0,0,6),
 (12,37,0,2,0,0,0,51),
 (12,38,0,3,0,0,0,86),
 (12,39,0,1,0,0,0,26),
 (12,41,114,0,0,0,0,150),
 (12,43,3,0,1,0,0,9),
 (12,44,83,0,0,0,0,94),
 (12,45,0,0,0,0,0,1),
 (12,46,21,0,0,1,0,27),
 (12,47,13,2,0,0,0,64),
 (12,48,0,0,0,0,0,1),
 (12,49,76,0,0,0,0,87),
 (12,50,0,1,0,0,0,26),
 (12,51,1,1,2,0,0,37),
 (12,53,9,1,1,0,0,40),
 (12,55,9,0,0,0,0,10),
 (12,56,0,0,0,0,0,1),
 (12,58,0,0,1,0,0,6),
 (13,136,44,0,0,0,0,45),
 (13,138,37,0,0,0,1,43),
 (13,139,21,0,0,0,0,22),
 (13,140,0,0,0,0,0,1);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (13,141,40,0,0,0,0,41),
 (13,143,0,1,1,0,0,31),
 (13,144,0,0,0,0,0,1),
 (13,145,28,0,0,0,0,29),
 (13,146,12,0,0,0,0,13),
 (13,148,0,1,0,0,0,26),
 (13,150,0,2,0,0,0,51),
 (13,151,0,0,0,0,0,1),
 (13,153,12,0,1,0,0,18),
 (13,154,30,1,0,0,0,56),
 (13,157,0,1,1,0,0,31),
 (13,158,0,0,0,0,0,1),
 (13,159,16,0,0,0,0,17),
 (13,160,0,1,0,0,0,26),
 (13,161,0,1,0,0,0,26),
 (13,163,1,0,2,0,0,12),
 (13,164,50,0,0,0,0,61),
 (13,165,70,0,0,0,0,81),
 (14,106,91,0,1,0,0,107),
 (14,107,0,0,0,0,0,1),
 (14,108,0,0,0,0,0,1),
 (14,109,0,0,0,0,0,1),
 (14,110,0,3,0,0,0,86),
 (14,113,12,0,1,0,0,18),
 (14,114,0,1,0,0,0,26),
 (14,115,0,0,1,0,1,11),
 (14,116,0,2,0,0,0,51),
 (14,117,21,0,0,0,0,22),
 (14,118,62,0,1,0,1,83),
 (14,227,31,0,0,0,0,32),
 (14,228,23,0,0,0,0,24),
 (14,229,45,0,1,0,0,51),
 (14,230,4,0,0,0,0,5),
 (14,231,13,2,0,0,0,64),
 (14,232,18,0,0,0,0,19),
 (14,235,1,0,1,0,0,7),
 (14,236,0,0,0,0,0,1);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (14,238,0,1,1,0,0,31),
 (14,239,15,0,0,0,0,16),
 (14,240,24,0,0,0,0,25),
 (15,91,60,0,1,0,0,76),
 (15,94,14,2,2,0,0,75),
 (15,95,6,0,0,0,0,7),
 (15,96,63,0,0,0,0,74),
 (15,97,0,1,0,0,0,26),
 (15,98,71,0,0,0,0,82),
 (15,99,85,0,0,0,0,96),
 (15,100,0,2,1,0,1,61),
 (15,101,0,2,0,0,0,51),
 (15,104,3,0,1,0,0,9),
 (15,105,0,0,0,0,2,11),
 (15,166,7,1,3,0,0,48),
 (15,167,42,2,0,0,0,93),
 (15,169,12,0,0,0,0,13),
 (15,170,2,0,1,0,0,8),
 (15,171,21,0,0,0,1,27),
 (15,172,1,0,0,0,0,2),
 (15,174,4,2,0,0,0,55),
 (15,175,6,1,0,0,0,32),
 (15,176,4,0,0,0,0,5),
 (15,178,71,0,0,0,0,82),
 (15,180,1,0,1,0,0,7),
 (16,15,18,0,1,0,0,24),
 (16,16,0,0,0,0,0,1),
 (16,17,0,1,0,0,0,26),
 (16,18,12,0,2,0,0,23),
 (16,20,7,0,0,0,0,8),
 (16,21,45,0,0,0,0,46),
 (16,22,7,1,0,0,0,33),
 (16,23,6,0,0,0,0,7),
 (16,25,4,1,0,0,0,30),
 (16,27,0,1,0,0,0,26),
 (16,28,6,0,1,0,0,12),
 (16,121,46,0,0,0,1,52),
 (16,122,5,1,0,0,0,31);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (16,125,0,1,1,0,1,36),
 (16,127,109,0,1,0,0,150),
 (16,129,0,1,1,0,0,31),
 (16,130,0,3,0,0,0,86),
 (16,131,0,1,0,0,0,26),
 (16,132,56,0,2,0,0,77),
 (16,133,52,0,0,0,0,63),
 (16,134,26,0,1,0,0,32),
 (16,135,0,1,0,0,0,26),
 (17,61,37,0,3,0,0,53),
 (17,62,28,0,1,0,0,34),
 (17,64,6,2,0,0,0,57),
 (17,65,32,0,0,0,0,33),
 (17,66,160,0,1,0,0,201),
 (17,67,15,0,0,0,1,21),
 (17,70,3,1,0,0,0,29),
 (17,72,16,3,0,0,0,102),
 (17,73,5,1,0,0,0,31),
 (17,74,21,0,0,0,0,22),
 (17,75,10,2,1,0,0,66),
 (17,151,4,0,1,0,0,10),
 (17,152,9,3,1,0,0,100),
 (17,153,3,0,1,0,0,9),
 (17,154,27,3,0,0,0,113),
 (17,158,9,0,0,0,0,10),
 (17,159,18,0,2,0,0,29),
 (17,160,1,1,0,0,1,32),
 (17,161,0,1,0,0,0,26),
 (17,163,0,0,0,0,0,1),
 (17,164,13,0,1,0,0,19),
 (17,165,11,1,1,0,0,42),
 (18,213,0,0,0,0,0,1),
 (18,214,0,1,1,0,0,31),
 (18,215,0,2,0,0,0,51),
 (18,217,0,2,0,0,0,51),
 (18,218,9,1,0,0,0,35),
 (18,220,0,0,2,1,0,16);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (18,221,0,3,1,0,0,91),
 (18,222,12,0,0,0,0,13),
 (18,223,70,0,1,0,0,86),
 (18,224,0,1,0,0,0,26),
 (18,225,43,0,0,0,0,44),
 (18,226,1,0,1,0,0,7),
 (18,227,16,0,0,0,0,17),
 (18,228,18,2,0,0,0,69),
 (18,229,0,0,0,0,0,1),
 (18,230,4,0,0,0,0,5),
 (18,231,6,0,0,0,0,7),
 (18,232,7,0,0,0,0,8),
 (18,235,24,0,0,0,0,25),
 (18,237,0,0,0,0,0,1),
 (18,238,26,0,0,0,0,27),
 (18,239,19,0,1,0,0,25),
 (19,91,66,0,0,0,0,77),
 (19,93,0,3,0,0,0,86),
 (19,94,0,3,0,0,0,86),
 (19,95,52,0,1,0,0,68),
 (19,96,28,1,0,0,0,54),
 (19,98,10,0,0,0,0,11),
 (19,101,0,1,1,0,0,31),
 (19,102,0,0,0,0,0,1),
 (19,103,47,0,0,0,0,48),
 (19,104,35,0,0,0,0,36),
 (19,105,101,0,0,0,1,142),
 (19,181,52,2,1,0,0,118),
 (19,182,37,0,1,0,0,43),
 (19,183,40,0,0,0,0,41),
 (19,184,10,0,0,0,0,11),
 (19,185,50,0,1,0,0,66),
 (19,189,9,0,0,0,0,10),
 (19,190,17,0,0,0,0,18),
 (19,191,0,0,0,0,0,1),
 (19,192,0,0,0,0,0,1),
 (19,194,9,1,1,0,0,40);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (19,195,2,2,0,0,0,53),
 (20,30,60,0,0,0,0,71),
 (20,31,0,1,0,0,0,26),
 (20,32,10,1,1,0,0,41),
 (20,33,0,0,3,0,0,16),
 (20,34,7,1,0,0,0,33),
 (20,35,17,0,0,0,0,18),
 (20,37,1,2,0,0,0,52),
 (20,39,10,1,1,0,0,41),
 (20,41,48,0,0,0,0,49),
 (20,43,18,0,0,0,0,19),
 (20,44,6,0,0,0,0,7),
 (20,121,7,0,1,0,0,13),
 (20,122,19,0,1,0,1,30),
 (20,125,38,1,0,0,0,64),
 (20,126,0,1,0,0,0,26),
 (20,127,6,1,0,0,0,32),
 (20,130,0,1,1,0,0,31),
 (20,131,0,3,2,0,0,96),
 (20,132,15,0,0,0,0,16),
 (20,133,59,0,0,0,0,70),
 (20,134,64,0,0,0,0,75),
 (20,135,19,2,2,0,0,80),
 (21,136,0,0,0,0,0,1),
 (21,137,0,1,0,0,0,26),
 (21,138,0,2,0,0,0,51),
 (21,139,102,0,0,0,0,138),
 (21,141,18,2,1,0,0,74),
 (21,143,0,2,0,0,0,51),
 (21,144,0,0,4,0,0,21),
 (21,145,27,0,0,0,0,28),
 (21,146,36,0,1,0,0,42),
 (21,147,0,0,1,0,0,6),
 (21,148,0,0,0,0,0,1),
 (21,150,0,1,0,0,0,26),
 (21,197,20,1,0,0,0,46),
 (21,198,28,0,0,0,0,29);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (21,199,41,0,0,0,0,42),
 (21,202,8,1,0,0,0,34),
 (21,203,0,0,0,0,0,1),
 (21,205,18,0,0,0,0,19),
 (21,206,17,0,1,0,0,23),
 (21,207,11,0,0,0,0,12),
 (21,208,0,0,0,0,0,1),
 (21,209,0,0,0,0,0,1),
 (21,210,18,0,1,0,0,24),
 (22,0,91,0,0,0,0,102),
 (22,1,0,2,0,0,0,51),
 (22,2,92,0,1,0,0,108),
 (22,3,42,0,1,1,0,53),
 (22,5,101,0,1,0,0,142),
 (22,7,0,3,0,0,0,86),
 (22,8,5,0,0,0,0,6),
 (22,11,0,1,0,0,0,26),
 (22,12,18,0,0,0,0,19),
 (22,13,0,2,0,0,0,51),
 (22,14,14,1,0,0,1,45),
 (22,106,74,0,0,0,0,85),
 (22,107,17,0,2,0,0,28),
 (22,108,7,1,0,0,0,33),
 (22,109,48,1,1,0,0,79),
 (22,110,8,2,0,0,0,59),
 (22,113,1,0,0,0,0,2),
 (22,114,7,0,0,0,1,13),
 (22,115,22,0,0,0,0,23),
 (22,116,0,1,0,0,0,26),
 (22,117,1,0,0,0,0,2),
 (22,118,92,0,1,0,0,108),
 (23,76,1,0,1,0,1,12),
 (23,77,0,2,0,0,0,51),
 (23,78,16,0,0,0,0,17),
 (23,79,0,0,0,0,1,6),
 (23,80,18,2,1,0,0,74),
 (23,82,0,2,0,0,0,51),
 (23,83,75,0,0,0,0,86);
INSERT INTO `player_contribution` (`match_id`,`player_id`,`runs_scored`,`wickets_taken`,`catches`,`stumps`,`runout`,`player_points`) VALUES 
 (23,85,0,1,0,0,0,26),
 (23,86,0,0,0,0,1,6),
 (23,87,0,0,0,0,0,1),
 (23,88,56,0,0,0,0,67),
 (23,166,76,1,0,0,0,112),
 (23,167,4,1,0,0,0,30),
 (23,168,0,0,1,0,0,6),
 (23,169,17,0,0,0,0,18),
 (23,170,0,0,0,0,0,1),
 (23,171,10,0,1,0,0,16),
 (23,174,3,1,0,0,0,29),
 (23,175,10,0,0,0,0,11),
 (23,176,13,0,0,0,0,14),
 (23,178,4,0,0,0,0,5),
 (23,179,14,0,0,0,0,15),
 (23,180,4,0,0,0,0,5),
 (24,15,0,0,2,0,0,11),
 (24,16,12,0,0,0,0,13),
 (24,17,0,3,0,0,0,86),
 (24,18,7,0,1,0,0,13),
 (24,20,0,2,0,0,0,51),
 (24,21,29,0,0,0,0,30),
 (24,22,0,1,1,0,0,31),
 (24,23,0,0,0,0,0,1),
 (24,25,26,2,0,0,0,77),
 (24,27,0,1,0,0,0,26),
 (24,28,1,0,2,0,0,12),
 (24,45,11,0,0,0,0,12),
 (24,46,23,0,0,0,0,24),
 (24,47,2,0,0,0,0,3),
 (24,48,16,0,0,0,0,17),
 (24,49,0,0,0,0,0,1),
 (24,50,0,0,1,0,0,6),
 (24,53,0,0,0,0,0,1),
 (24,54,0,3,0,0,0,86),
 (24,55,0,0,0,0,0,1),
 (24,56,22,0,0,0,0,23),
 (24,58,9,0,1,0,0,15);
/*!40000 ALTER TABLE `player_contribution` ENABLE KEYS */;


--
-- Definition of table `playing_nations`
--

DROP TABLE IF EXISTS `playing_nations`;
CREATE TABLE `playing_nations` (
  `country_id` varchar(30) NOT NULL default '',
  `country_name` varchar(128) default NULL,
  `country_active` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playing_nations`
--

/*!40000 ALTER TABLE `playing_nations` DISABLE KEYS */;
INSERT INTO `playing_nations` (`country_id`,`country_name`,`country_active`) VALUES 
 ('Australia','AUSTRALIA',1),
 ('Bangladesh','BANGLADESH',1),
 ('Bermuda','Bermuda',1),
 ('Canada','Canada',1),
 ('England','ENGLAND',1),
 ('India','REPUBLIC OF INDIA',1),
 ('Ireland','Ireland',1),
 ('Kenya','Kenya',1),
 ('Netherlands','Netherlands',1),
 ('New Zealand','NEW ZEALAND',1),
 ('Pakistan','PAKISTAN',1),
 ('Scotland','Scotland ',1),
 ('South Africa','REPUBLIC OF SOUTH AFRICA',1),
 ('Sri Lanka','SRILANKA',1),
 ('West Indies','WEST INDIES',1),
 ('Zimbabwe','ZIMBABWE',1);
/*!40000 ALTER TABLE `playing_nations` ENABLE KEYS */;


--
-- Definition of table `playing_nations_team`
--

DROP TABLE IF EXISTS `playing_nations_team`;
CREATE TABLE `playing_nations_team` (
  `player_id` int(11) NOT NULL default '0',
  `country_id` varchar(30) default NULL,
  `player_name` varchar(128) default NULL,
  `player_type` smallint(5) unsigned default NULL,
  `player_role` varchar(128) default NULL,
  `player_link` varchar(255) default NULL,
  `player_photolink` varchar(255) default NULL,
  `player_status` smallint(5) unsigned default NULL,
  `player_welknown_name` varchar(128) NOT NULL,
  PRIMARY KEY  (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playing_nations_team`
--

/*!40000 ALTER TABLE `playing_nations_team` DISABLE KEYS */;
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (0,'Australia','Ricky Ponting',1,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/7133.html','http://ind.cricinfo.com/db/PICTURES/CMS/66700/66758.jpg',1,'RT Ponting'),
 (1,'Australia','Nathan Bracken',2,'Bowler','http://content-ind.cricinfo.com/wc2007/content/player/4185.html','http://ind.cricinfo.com/db/PICTURES/DB/032004/051176.jpg',1,'NW Bracken'),
 (2,'Australia','Michael Clarke',1,'Lower middle order batsman','http://content-ind.cricinfo.com/wc2007/content/player/4578.html','http://ind.cricinfo.com/db/PICTURES/DB/112004/055845.player.jpg',1,'MJ Clarke'),
 (3,'Australia','Adam Gilchrist',4,'Wicketkeeper batsman','http://content-ind.cricinfo.com/wc2007/content/player/5390.html','http://ind.cricinfo.com/db/PICTURES/CMS/52300/52375.1.jpg',1,'AC Gilchrist'),
 (4,'Australia','Brad Haddin',4,'Wicketkeeper batsman','http://content-ind.cricinfo.com/wc2007/content/player/5560.html','http://ind.cricinfo.com/db/PICTURES/CMS/52300/52379.1.jpg',1,'BJ Haddin'),
 (5,'Australia','Matthew Hayden',1,'Opening batsman','http://content-ind.cricinfo.com/wc2007/content/player/5616.html','http://ind.cricinfo.com/db/PICTURES/CMS/52300/52369.1.jpg',1,'ML Hayden');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (6,'Australia','Brad Hodge',3,'Higher middle order batsman','http://content-ind.cricinfo.com/wc2007/content/player/5674.html','http://ind.cricinfo.com/db/PICTURES/CMS/65900/65945.1.jpg',1,'BJ Hodge'),
 (7,'Australia','Brad Hogg',3,'All-rounder','http://content-ind.cricinfo.com/wc2007/content/player/5681.html','http://ind.cricinfo.com/db/PICTURES/CMS/50400/50417.1.jpg',1,'GB Hogg'),
 (8,'Australia','Michael Hussey',1,'Opening batsman','http://content-ind.cricinfo.com/wc2007/content/player/5939.html','http://ind.cricinfo.com/db/PICTURES/CMS/51100/51174.1.jpg',1,'MEK Hussey'),
 (9,'Australia','Mitchell Johnson',2,'Left-arm fast-medium','http://content-ind.cricinfo.com/wc2007/content/player/6033.html','http://ind.cricinfo.com/db/PICTURES/CMS/52300/52359.1.jpg',1,'MG Johnson'),
 (10,'Australia','Stuart Clark',2,'Right-arm fast-medium','http://content-ind.cricinfo.com/wc2007/content/player/4582.html','http://ind.cricinfo.com/db/PICTURES/CMS/52200/52215.1.jpg',1,'Stuart Clark'),
 (11,'Australia','Glenn McGrath',2,' Right-arm fast-medium','http://content-ind.cricinfo.com/wc2007/content/player/6565.html','http://ind.cricinfo.com/db/PICTURES/CMS/52300/52367.1.jpg',1,'GD McGrath');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (12,'Australia','Andrew Symonds',3,'All-rounder','http://content-ind.cricinfo.com/wc2007/content/player/7702.html','http://ind.cricinfo.com/db/PICTURES/CMS/69400/69420.1.jpg',1,'A Symonds'),
 (13,'Australia','Shaun Tait',2,'Right-arm fast','http://content-ind.cricinfo.com/wc2007/content/player/8076.html','http://content-ind.cricinfo.com/inline/content/image/215982.html?alt=1',1,'SW Tait'),
 (14,'Australia','Shane Watson',3,'All-rounder','http://content-ind.cricinfo.com/wc2007/content/player/8180.html','http://content-ind.cricinfo.com/inline/content/image/8179.html',1,'SR Watson'),
 (15,'Bangladesh','Habibul Bashar',1,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/55906.html','http://ind.cricinfo.com/db/PICTURES/CMS/50500/50508.1.jpg',1,'Habibul Bashar'),
 (16,'Bangladesh','Shahriar Nafees',1,'','http://content-ind.cricinfo.com/wc2007/content/player/56153.html','http://content-ind.cricinfo.com/inline/content/image/208680.html?alt=1',1,'Shahriar Nafees'),
 (17,'Bangladesh','Abdur Razzak',3,'','http://content-ind.cricinfo.com/wc2007/content/player/56283.html','',1,'Abdur Razzak');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (18,'Bangladesh','Aftab Ahmed',3,'','http://content-ind.cricinfo.com/wc2007/content/player/56266.html','http://content-ind.cricinfo.com/inline/content/image/208697.html?alt=1',1,'Aftab Ahmed'),
 (19,'Bangladesh','Javed Omar',1,'','http://content-ind.cricinfo.com/wc2007/content/player/55935.html','http://content-ind.cricinfo.com/inline/content/image/208691.html?alt=1',1,'Javed Omar'),
 (20,'Bangladesh','Mashrafe Mortaza',2,'','http://content-ind.cricinfo.com/wc2007/content/player/56007.html','http://content-ind.cricinfo.com/inline/content/image/208688.html?alt=1',1,'Mashrafe Mortaza'),
 (21,'Bangladesh','Mohammad Ashraful',1,'','http://content-ind.cricinfo.com/wc2007/content/player/55988.html','http://content-ind.cricinfo.com/inline/content/image/208695.html?alt=1',1,'Mohammad Ashraful'),
 (22,'Bangladesh','Mohammad Rafique',2,'','http://content-ind.cricinfo.com/wc2007/content/player/55973.html','http://content-ind.cricinfo.com/inline/content/image/208684.html?alt=1',1,'Mohammad Rafique'),
 (23,'Bangladesh','Mushfiqur Rahim',4,'Wicketkeeper','http://content-ind.cricinfo.com/wc2007/content/player/56029.html','http://content-ind.cricinfo.com/inline/content/image/263341.html?alt=1',1,'Mushfiqur Rahim');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (24,'Bangladesh','Rajin Saleh',1,'','http://content-ind.cricinfo.com/wc2007/content/player/56074.html','http://content-ind.cricinfo.com/inline/content/image/208682.html?alt=1',1,'Rajin Saleh'),
 (25,'Bangladesh','Saqibul Hasan',2,' left-armed medium-fast bowler','http://content-ind.cricinfo.com/wc2007/content/player/56143.html','',1,'Saqibul Hasan'),
 (26,'Bangladesh','Shahadat Hossain',2,'','http://content-ind.cricinfo.com/wc2007/content/player/56149.html','http://content-ind.cricinfo.com/inline/content/image/208681.html?alt=1',1,'Shahadat Hossain'),
 (27,'Bangladesh','Syed Rasel',2,'','http://content-ind.cricinfo.com/wc2007/content/player/56160.html','',1,'Syed Rasel'),
 (28,'Bangladesh','Tamim Iqbal',1,'','http://content-ind.cricinfo.com/wc2007/content/player/56194.html','http://content-ind.cricinfo.com/inline/content/image/277646.html?alt=1',1,'Tamim Iqbal'),
 (29,'Bangladesh','Tapash Baisya',2,'Right-arm fast-medium','http://content-ind.cricinfo.com/wc2007/content/player/56176.html','http://content-ind.cricinfo.com/inline/content/image/208675.html?alt=1',1,'Tapash Baisya');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (30,'India','Rahul Dravid',1,'captain','http://content-ind.cricinfo.com/wc2007/content/player/28114.html','http://ind.cricinfo.com/db/PICTURES/CMS/65200/65257.1.jpg',1,'R Dravid'),
 (31,'India','Sachin Tendulkar',1,'vice-captain','http://content-ind.cricinfo.com/wc2007/content/player/35320.html','http://ind.cricinfo.com/db/PICTURES/CMS/62800/62890.1.jpg',1,'SR Tendulkar'),
 (32,'India','Ajit Agarkar',2,'Bowler ','http://content-ind.cricinfo.com/wc2007/content/player/26184.html','http://ind.cricinfo.com/db/PICTURES/CMS/53100/53190.jpg',1,'AB Agarkar'),
 (33,'India','MS Dhoni',4,'Wicket keeper','http://content-ind.cricinfo.com/wc2007/content/player/28081.html','http://ind.cricinfo.com/db/PICTURES/CMS/59100/59168.1.jpg',1,'MS Dhoni'),
 (34,'India','Sourav Ganguly',1,'','http://content-ind.cricinfo.com/wc2007/content/player/28779.html','http://ind.cricinfo.com/db/PICTURES/CMS/53000/53088.1.jpg',1,'SC Ganguly'),
 (35,'India','Harbhajan Singh',2,'','http://content-ind.cricinfo.com/wc2007/content/player/29264.html','http://ind.cricinfo.com/db/PICTURES/CMS/53100/53197.jpg',1,'Harbhajan Singh');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (36,'India','Dinesh Karthik',4,'','http://content-ind.cricinfo.com/wc2007/content/player/30045.html','http://ind.cricinfo.com/db/PICTURES/DB/032005/059073.player.jpg',1,'KD Karthik'),
 (37,'India','Zaheer Khan',2,'','http://content-ind.cricinfo.com/wc2007/content/player/30102.html','http://ind.cricinfo.com/db/PICTURES/DB/042004/051329.player.jpg',1,'Z Khan'),
 (38,'India','Anil Kumble',2,'Legbreak googly','http://content-ind.cricinfo.com/wc2007/content/player/30176.html','http://ind.cricinfo.com/db/PICTURES/CMS/53100/53193.jpg',1,'A Kumble'),
 (39,'India','Munaf Patel',2,'Right-arm medium-fast','http://content-ind.cricinfo.com/wc2007/content/player/32965.html','http://ind.cricinfo.com/db/PICTURES/CMS/59500/59554.1.jpg',1,'MM Patel'),
 (40,'India','Irfan Pathan',3,'','http://content-ind.cricinfo.com/wc2007/content/player/32685.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054830.jpg',1,'IK Pathan'),
 (41,'India','Virender Sehwag',1,'','http://content-ind.cricinfo.com/wc2007/content/player/35263.html','http://ind.cricinfo.com/db/PICTURES/CMS/53100/53182.jpg',1,'V Sehwag');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (42,'India','Sreesanth',2,'Right-arm fast-medium','http://content-ind.cricinfo.com/wc2007/content/player/34274.html','http://ind.cricinfo.com/db/PICTURES/CMS/54500/54587.1.jpg',1,'S Sreesanth'),
 (43,'India','Robin Uthappa',1,'Opening Batsman','http://content-ind.cricinfo.com/wc2007/content/player/35582.html','',1,'AR Uthappa'),
 (44,'India','Yuvraj Singh',1,'','http://content-ind.cricinfo.com/wc2007/content/player/36084.html','http://ind.cricinfo.com/db/PICTURES/CMS/53100/53192.jpg',1,'Yuvraj Singh'),
 (45,'Bermuda','Irvine Romaine',1,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/23725.html','http://ind.cricinfo.com/db/PICTURES/CMS/70400/70461.1.jpg',1,'IH Romaine'),
 (46,'Bermuda','Dean Minors',4,'Wicketkeeper','http://content-ind.cricinfo.com/wc2007/content/player/23688.html','http://ind.cricinfo.com/db/PICTURES/CMS/70400/70457.1.jpg',1,'DA Minors'),
 (47,'Bermuda','Delyone Borden',1,'','http://content-ind.cricinfo.com/wc2007/content/player/23756.html','',1,'DC Borden');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (48,'Bermuda','Lionel Cann',3,'','http://content-ind.cricinfo.com/wc2007/content/player/23681.html','http://ind.cricinfo.com/db/PICTURES/CMS/70400/70456.1.jpg',1,'LO Cann'),
 (49,'Bermuda','David Hemp',1,'','http://content-ind.cricinfo.com/wc2007/content/player/14153.html','http://ind.cricinfo.com/db/PICTURES/CMS/64200/64230.1.jpg',1,'DL Hemp'),
 (50,'Bermuda','Kevin Hurdle',3,'','http://content-ind.cricinfo.com/wc2007/content/player/23685.html','http://content-ind.cricinfo.com/inline/content/image/275306.html?alt=1',1,'K Hurdle'),
 (51,'Bermuda','Malachi Jones',3,'','http://content-ind.cricinfo.com/wc2007/content/player/257574.html','',1,'M Jones'),
 (52,'Bermuda','Stefan Kelly',2,'','http://content-ind.cricinfo.com/wc2007/content/player/252869.html','http://ind.cricinfo.com/db/PICTURES/CMS/70400/70459.1.jpg',1,'S Kelly'),
 (53,'Bermuda','Dwayne Leverock',2,'','http://content-ind.cricinfo.com/wc2007/content/player/23742.html','http://ind.cricinfo.com/db/PICTURES/CMS/70400/70463.1.jpg',1,'DM Leverock');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (54,'Bermuda','Saleem Mukuddem',3,'','http://content-ind.cricinfo.com/wc2007/content/player/23755.html','http://ind.cricinfo.com/db/PICTURES/CMS/70400/70448.1.jpg',1,'S Mukuddem'),
 (55,'Bermuda','Steven Outerbridge',1,'','http://content-ind.cricinfo.com/wc2007/content/player/23704.html','http://ind.cricinfo.com/db/PICTURES/CMS/70400/70455.1.jpg',1,'SD Outerbridge'),
 (56,'Bermuda','Oliver Pitcher',3,'','http://content-ind.cricinfo.com/wc2007/content/player/23702.html','http://ind.cricinfo.com/db/PICTURES/DB/022000/009598.jpg',1,'OL Pitcher'),
 (57,'Bermuda','Clay Smith',1,'','http://content-ind.cricinfo.com/wc2007/content/player/23691.html','http://ind.cricinfo.com/db/PICTURES/CMS/70400/70452.1.jpg',1,'CJ Smith'),
 (58,'Bermuda','Janeiro Tucker',3,'','http://content-ind.cricinfo.com/wc2007/content/player/23694.html','http://ind.cricinfo.com/db/PICTURES/CMS/70400/70462.1.jpg',1,'JJ Tucker'),
 (59,'Bermuda','Kwame Tucker',4,'','http://content-ind.cricinfo.com/wc2007/content/player/23729.html','http://ind.cricinfo.com/db/PICTURES/CMS/70400/70453.1.jpg',1,'Kwame Tucker');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (61,'Pakistan','Inzamam-ul-Haq',1,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/40570.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66166.1.jpg',1,'Inzamam-ul-Haq'),
 (62,'Pakistan','Younis Khan',1,'Vice Captain','http://content-ind.cricinfo.com/wc2007/content/player/43652.html','http://ind.cricinfo.com/db/PICTURES/DB/122004/056816.player.jpg',1,'Younis Khan'),
 (63,'Pakistan','Azhar Mahmood',2,'','http://content-ind.cricinfo.com/wc2007/content/player/39024.html','http://ind.cricinfo.com/db/PICTURES/CMS/72300/72394.1.jpg',1,'Azhar Mahmood'),
 (64,'Pakistan','Danish Kaneria',2,'Legbreak','http://content-ind.cricinfo.com/wc2007/content/player/40043.html','http://ind.cricinfo.com/db/PICTURES/DB/122004/056815.player.jpg',1,'Danish Kaneria'),
 (65,'Pakistan','Iftikhar Anjum',2,'','http://content-ind.cricinfo.com/wc2007/content/player/40591.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66174.1.jpg',1,'Iftikhar Anjum'),
 (66,'Pakistan','Imran Nazir',1,'','http://content-ind.cricinfo.com/wc2007/content/player/40563.html','http://ind.cricinfo.com/db/PICTURES/DB/042002/035515.player.jpg',1,'Imran Nazir');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (67,'Pakistan','Kamran Akmal',4,'','http://content-ind.cricinfo.com/wc2007/content/player/41028.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66167.1.jpg',1,'Kamran Akmal'),
 (68,'Pakistan','Yasir Arafat',3,'Right-arm fast-medium','http://content-ind.cricinfo.com/wc2007/content/player/43654.html','http://ind.cricinfo.com/db/PICTURES/DB/032005/059067.player.jpg',1,'Yasir Arafat'),
 (69,'Pakistan','Mohammad Hafeez',1,'','http://content-ind.cricinfo.com/wc2007/content/player/41434.html','http://ind.cricinfo.com/db/PICTURES/CMS/20600/20651.3.jpg',1,'Mohammad Hafeez'),
 (70,'Pakistan','Mohammad Yousuf',1,'Right-hand bat','http://content-ind.cricinfo.com/wc2007/content/player/43650.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66171.1.jpg',1,'Mohammad Yousuf'),
 (71,'Pakistan','Naved-ul-Hasan',2,'Right-arm medium-fast','http://content-ind.cricinfo.com/wc2007/content/player/42272.html','http://ind.cricinfo.com/db/PICTURES/DB/122004/056802.player.jpg',1,'Naved-ul-Hasan'),
 (72,'Pakistan','Shahid Afridi',3,'','http://content-ind.cricinfo.com/wc2007/content/player/42639.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66176.1.jpg',1,'Shahid Afridi');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (73,'Pakistan','Mohammad Sami',2,'Right-arm fast','http://content-ind.cricinfo.com/wc2007/content/player/41324.html','http://ind.cricinfo.com/db/PICTURES/DB/122004/056812.player.jpg',1,'Mohammad Sami'),
 (74,'Pakistan','Shoaib Malik',3,'','http://content-ind.cricinfo.com/wc2007/content/player/42657.html','http://ind.cricinfo.com/db/PICTURES/DB/122004/056811.player.jpg',1,'Shoaib Malik'),
 (75,'Pakistan','Umar Gul',2,'','http://content-ind.cricinfo.com/wc2007/content/player/43524.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66180.1.jpg',1,'Umar Gul'),
 (76,'England','Michael Vaughan',1,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/22182.html','http://ind.cricinfo.com/db/PICTURES/CMS/52300/52381.1.jpg',1,'MP Vaughan'),
 (77,'England','James Anderson',2,'Right-arm fast-medium','http://content-ind.cricinfo.com/wc2007/content/player/8608.html','http://ind.cricinfo.com/db/PICTURES/CMS/53200/53279.1.jpg',1,'JM Anderson'),
 (78,'England','Ian Bell',1,'','http://content-ind.cricinfo.com/wc2007/content/player/9062.html','http://ind.cricinfo.com/db/PICTURES/CMS/53400/53463.1.jpg',1,'IR Bell');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (79,'England','Ravinder Bopara',3,'','http://content-ind.cricinfo.com/wc2007/content/player/10582.html','http://ind.cricinfo.com/db/PICTURES/CMS/64100/64163.1.jpg',1,'RS Bopara'),
 (80,'England','Paul Collingwood',1,'','http://content-ind.cricinfo.com/wc2007/content/player/10772.html','http://ind.cricinfo.com/db/PICTURES/DB/042004/051359.player.jpg',1,'PD Collingwood'),
 (81,'England','Jamie Dalrymple',3,'','http://content-ind.cricinfo.com/wc2007/content/player/11974.html','http://ind.cricinfo.com/db/PICTURES/CMS/63500/63541.1.jpg',1,'JWM Dalrymple'),
 (82,'England','Andrew Flintoff',3,'','http://content-ind.cricinfo.com/wc2007/content/player/12856.html','http://ind.cricinfo.com/db/PICTURES/CMS/61500/61543.1.jpg',1,'A Flintoff'),
 (83,'England','Ed Joyce',1,'','http://content-ind.cricinfo.com/wc2007/content/player/24249.html','http://ind.cricinfo.com/db/PICTURES/CMS/63500/63542.1.jpg',1,'Ec Joyce'),
 (84,'England','Jon Lewis',2,'','http://content-ind.cricinfo.com/wc2007/content/player/16281.html','http://ind.cricinfo.com/db/PICTURES/CMS/50500/50586.jpg',1,'J Lewis');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (85,'England','Sajid Mahmood',2,'','http://content-ind.cricinfo.com/wc2007/content/player/17944.html','http://ind.cricinfo.com/db/PICTURES/DB/072004/053246.player.jpg',1,'SI Mahmood'),
 (86,'England','Paul Nixon',4,'','http://content-ind.cricinfo.com/wc2007/content/player/18023.html','http://ind.cricinfo.com/db/PICTURES/CMS/64100/64187.1.jpg',1,'PA Nixon'),
 (87,'England','Monty Panesar',2,'','http://content-ind.cricinfo.com/wc2007/content/player/18655.html','http://ind.cricinfo.com/db/PICTURES/CMS/58000/58094.1.jpg',1,'MS Panesar'),
 (88,'England','Kevin Pietersen',1,'','http://content-ind.cricinfo.com/wc2007/content/player/19296.html','http://ind.cricinfo.com/db/PICTURES/DB/032005/059043.player.jpg',1,'KP Pietersen'),
 (89,'England','Liam Plunkett',2,'','http://content-ind.cricinfo.com/wc2007/content/player/19264.html','http://ind.cricinfo.com/db/PICTURES/CMS/51100/51188.1.jpg',1,'LE Plunkett'),
 (90,'England','Andrew Strauss',1,'','http://content-ind.cricinfo.com/wc2007/content/player/20387.html','http://ind.cricinfo.com/db/PICTURES/DB/042005/059739.player.jpg',1,'AJ Strauss');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (91,'New Zealand','Stephen Fleming',1,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/37000.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66186.2.jpg',1,'SP Fleming'),
 (92,'New Zealand','Mark Gillespie',2,'','http://content-ind.cricinfo.com/wc2007/content/player/37111.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66189.1.jpg',1,'MR Gillespie'),
 (93,'New Zealand','Jeetan Patel',2,'','http://content-ind.cricinfo.com/wc2007/content/player/38141.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66194.1.jpg',1,'JS Patel'),
 (94,'New Zealand','Daniel Vettori',2,'','http://content-ind.cricinfo.com/wc2007/content/player/38710.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66196.1.jpg',1,'DL Vettori'),
 (95,'New Zealand','Brendon McCullum',4,'','http://content-ind.cricinfo.com/wc2007/content/player/37737.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66191.1.jpg',1,'BB McCullum'),
 (96,'New Zealand','Scott Styris',3,'','http://content-ind.cricinfo.com/wc2007/content/player/38407.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66197.1.jpg',1,'SB Styris');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (97,'New Zealand','Shane Bond',2,'','http://content-ind.cricinfo.com/wc2007/content/player/36326.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66184.1.jpg',1,'SE Bond'),
 (98,'New Zealand','Craig McMillan',1,'','http://content-ind.cricinfo.com/wc2007/content/player/37712.html','http://ind.cricinfo.com/db/PICTURES/DB/102002/039686.player.jpg',1,'CD McMillan'),
 (99,'New Zealand','Ross Taylor',1,'','http://content-ind.cricinfo.com/wc2007/content/player/38699.html','http://ind.cricinfo.com/db/PICTURES/CMS/59600/59640.1.jpg',1,'RL Taylor'),
 (100,'New Zealand','James Franklin',2,'','http://content-ind.cricinfo.com/wc2007/content/player/37004.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66187.1.jpg',1,'JEC Franklin'),
 (101,'New Zealand','Michael Mason',2,'','http://content-ind.cricinfo.com/wc2007/content/player/37701.html','http://ind.cricinfo.com/db/PICTURES/CMS/59700/59720.1.jpg',1,'MJ Mason'),
 (102,'New Zealand','Daryl Tuffey',2,'','http://content-ind.cricinfo.com/wc2007/content/player/38620.html','http://ind.cricinfo.com/db/PICTURES/DB/062004/052742.player.jpg',1,'DR Tuffey');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (103,'New Zealand','Peter Fulton',1,'','http://content-ind.cricinfo.com/wc2007/content/player/37091.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66188.1.jpg',1,'PG Fulton'),
 (104,'New Zealand','Jacob Oram',3,'','http://content-ind.cricinfo.com/wc2007/content/player/38062.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66193.1.jpg',1,'JDP Oram'),
 (105,'New Zealand','Lou Vincent',1,'','http://content-ind.cricinfo.com/wc2007/content/player/38714.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66195.1.jpg',1,'L Vincent'),
 (106,'South Africa','Graeme Smith',1,'CAptain','http://content-ind.cricinfo.com/wc2007/content/player/47270.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66163.1.jpg',1,'GC Smith'),
 (107,'South Africa','Herschelle Gibbs',1,'','http://content-ind.cricinfo.com/wc2007/content/player/45224.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66154.1.jpg',1,'HH Gibbs'),
 (108,'South Africa','Makhaya Ntini',2,'','http://content-ind.cricinfo.com/wc2007/content/player/46592.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66160.1.jpg',1,'M Ntini');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (109,'South Africa','Jacques Kallis',3,'','http://content-ind.cricinfo.com/wc2007/content/player/45789.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66156.1.jpg',1,'JH Kallis'),
 (110,'South Africa','Andrew Hall',2,'','http://content-ind.cricinfo.com/wc2007/content/player/45396.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66155.1.jpg',1,'AJ Hall'),
 (111,'South Africa','Robin Peterson',2,'Spin bowlers','http://content-ind.cricinfo.com/wc2007/content/player/46750.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66161.1.jpg',1,'RJ Peterson'),
 (112,'South Africa','Loots Bosman',1,'','http://content-ind.cricinfo.com/wc2007/content/player/44098.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66151.1.jpg',1,'LL Bosman'),
 (113,'South Africa','Justin Kemp',3,'','http://content-ind.cricinfo.com/wc2007/content/player/45797.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66157.1.jpg',1,'JM Kemp'),
 (114,'South Africa','Shaun Pollock',2,'','http://content-ind.cricinfo.com/wc2007/content/player/46774.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66162.1.jpg',1,'SM Pollock');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (115,'South Africa','Mark Boucher',4,'','http://content-ind.cricinfo.com/wc2007/content/player/44111.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66152.1.jpg',1,'MV Boucher'),
 (116,'South Africa','Charl Langeveldt',2,'','http://content-ind.cricinfo.com/wc2007/content/player/45963.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66158.1.jpg',1,'CK Langeveldt'),
 (117,'South Africa','Ashwell Prince',1,'','http://content-ind.cricinfo.com/wc2007/content/player/46788.html','http://ind.cricinfo.com/db/PICTURES/DB/032005/058403.player.jpg',1,'AG Prince'),
 (118,'South Africa','AB de Villiers',1,'','http://content-ind.cricinfo.com/wc2007/content/player/44936.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66149.1.jpg',1,'AB de Villiers'),
 (119,'South Africa','Andre Nel',2,'','http://content-ind.cricinfo.com/wc2007/content/player/46569.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66159.1.jpg',1,'A Nel'),
 (120,'South Africa','Roger Telemachus',2,'','http://content-ind.cricinfo.com/wc2007/content/player/47539.html','http://ind.cricinfo.com/db/PICTURES/DB/032004/051150.player.jpg',1,'R Telemachus');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (121,'Sri Lanka','Mahela Jayawardene',1,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/49289.html','http://ind.cricinfo.com/db/PICTURES/CMS/64800/64804.1.jpg',1,'DPMD Jayawardene'),
 (122,'Sri Lanka','Russel Arnold',1,'','http://content-ind.cricinfo.com/wc2007/content/player/48122.html','http://ind.cricinfo.com/db/PICTURES/DB/102001/030874.player.jpg',1,'RP Arnold  '),
 (123,'Sri Lanka','Marvan Atapattu',1,'','http://content-ind.cricinfo.com/wc2007/content/player/48124.html','http://ind.cricinfo.com/db/PICTURES/DB/062004/053083.player.jpg',1,'MS Atapattu'),
 (124,'Sri Lanka','Malinga Bandara',2,'','http://content-ind.cricinfo.com/wc2007/content/player/48284.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/055334.player.jpg',1,'CM Bandara'),
 (125,'Sri Lanka','Tillakaratne Dilshan',4,'','http://content-ind.cricinfo.com/wc2007/content/player/48472.html','http://ind.cricinfo.com/db/PICTURES/CMS/57000/57076.1.jpg',1,'TM Dilshan'),
 (126,'Sri Lanka','Dilhara Fernando',2,'','http://content-ind.cricinfo.com/wc2007/content/player/48835.html','http://ind.cricinfo.com/db/PICTURES/DB/102001/030880.player.jpg',1,'CRD Fernando');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (127,'Sri Lanka','Sanath Jayasuriya',1,'','http://content-ind.cricinfo.com/wc2007/content/player/49209.html','http://ind.cricinfo.com/db/PICTURES/DB/042004/051270.player.jpg',1,'ST Jayasuriya'),
 (128,'Sri Lanka','Nuwan Kulasekara',2,'','http://content-ind.cricinfo.com/wc2007/content/player/49535.html','http://ind.cricinfo.com/db/PICTURES/DB/092004/054372.player.jpg',1,'KMDN Kulasekara'),
 (129,'Sri Lanka','Farveez Maharoof',2,'','http://content-ind.cricinfo.com/wc2007/content/player/49638.html','http://ind.cricinfo.com/db/PICTURES/DB/122004/056713.jpg',1,'MF Maharoof'),
 (130,'Sri Lanka','Lasith Malinga',2,'','http://content-ind.cricinfo.com/wc2007/content/player/49758.html','http://ind.cricinfo.com/db/PICTURES/CMS/71700/71792.1.jpg',1,'SL Malinga'),
 (131,'Sri Lanka','Muttiah Muralitharan',2,'','http://content-ind.cricinfo.com/wc2007/content/player/49636.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054826.jpg',1,'M Muralitharan'),
 (132,'Sri Lanka','Kumar Sangakkara',4,'','http://content-ind.cricinfo.com/wc2007/content/player/50710.html','http://ind.cricinfo.com/db/PICTURES/CMS/38000/38090.2.jpg',1,'KC Sangakkara');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (133,'Sri Lanka','Chamara Silva',1,'','http://content-ind.cricinfo.com/wc2007/content/player/50431.html','http://ind.cricinfo.com/db/PICTURES/CMS/15900/15915.1.jpg',1,'LPC Silva'),
 (134,'Sri Lanka','Upul Tharanga',1,'','http://content-ind.cricinfo.com/wc2007/content/player/50747.html','http://ind.cricinfo.com/db/PICTURES/CMS/51800/51871.jpg',1,'WU Tharanga'),
 (135,'Sri Lanka','Chaminda Vaas',2,'','http://content-ind.cricinfo.com/wc2007/content/player/50804.html','http://ind.cricinfo.com/db/PICTURES/CMS/38000/38087.2.jpg',1,'WPUJC Vaas'),
 (136,'West Indies','Brian Lara',1,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/52337.html','http://ind.cricinfo.com/db/PICTURES/CMS/66100/66199.1.jpg',1,'BC Lara'),
 (137,'West Indies','Ian Bradshaw',2,'','http://content-ind.cricinfo.com/wc2007/content/player/51246.html','http://ind.cricinfo.com/db/PICTURES/CMS/66200/66206.1.jpg',1,'IDR Bradshaw'),
 (138,'West Indies','Dwayne Bravo',3,'','http://content-ind.cricinfo.com/wc2007/content/player/51439.html','http://ind.cricinfo.com/db/PICTURES/CMS/66200/66202.1.jpg',1,'DJ Bravo');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (139,'West Indies','Shivnarine Chanderpaul',1,'','http://content-ind.cricinfo.com/wc2007/content/player/51469.html','http://ind.cricinfo.com/db/PICTURES/CMS/66200/66211.1.jpg',1,'S Chanderpaul'),
 (140,'West Indies','Corey Collymore',2,'','http://content-ind.cricinfo.com/wc2007/content/player/51481.html','http://ind.cricinfo.com/db/PICTURES/DB/042004/051349.player.jpg',1,'CD Collymore'),
 (141,'West Indies','Chris Gayle',1,'','http://content-ind.cricinfo.com/wc2007/content/player/51880.html','http://ind.cricinfo.com/db/PICTURES/CMS/66200/66200.1.jpg',1,'CH Gayle'),
 (142,'West Indies','Kieron Pollard',3,'','http://content-ind.cricinfo.com/wc2007/content/player/230559.html','http://ind.cricinfo.com/db/PICTURES/CMS/66900/66972.1.jpg',1,'KA Pollard'),
 (143,'West Indies','Daren Powell',2,'','http://content-ind.cricinfo.com/wc2007/content/player/52790.html','http://ind.cricinfo.com/db/PICTURES/CMS/70900/70986.1.jpg',1,'DB Powell'),
 (144,'West Indies','Denesh Ramdin',4,'','http://content-ind.cricinfo.com/wc2007/content/player/52917.html','http://ind.cricinfo.com/db/PICTURES/CMS/66200/66204.1.jpg',1,'D Ramdin');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (145,'West Indies','Marlon Samuels',3,'','http://content-ind.cricinfo.com/wc2007/content/player/52983.html','http://ind.cricinfo.com/db/PICTURES/CMS/70900/70989.1.jpg',1,'MN Samuels'),
 (146,'West Indies','Ramnaresh Sarwan',1,'','http://content-ind.cricinfo.com/wc2007/content/player/52969.html','http://ind.cricinfo.com/db/PICTURES/CMS/66200/66210.1.jpg',1,'RR Sarwan'),
 (147,'West Indies','Lendl Simmons',1,'','http://content-ind.cricinfo.com/wc2007/content/player/53116.html','http://ind.cricinfo.com/db/PICTURES/CMS/70900/70988.1.jpg',1,'LMP Simmons'),
 (148,'West Indies','Dwayne Smith',1,'','http://content-ind.cricinfo.com/wc2007/content/player/53118.html','http://ind.cricinfo.com/db/PICTURES/CMS/66200/66205.1.jpg',1,'DR Smith'),
 (149,'West Indies','Devon Smith',1,'','http://content-ind.cricinfo.com/wc2007/content/player/52962.html','http://ind.cricinfo.com/db/PICTURES/CMS/70900/70987.1.jpg',1,'DS Smith'),
 (150,'West Indies','Jerome Taylor',2,'','http://content-ind.cricinfo.com/wc2007/content/player/53191.html','http://ind.cricinfo.com/db/PICTURES/CMS/66200/66207.1.jpg',1,'JE Taylor');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (151,'Zimbabwe','Prosper Utseya',2,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/55820.html','',1,'P Utseya'),
 (152,'Zimbabwe','Gary Brent',2,'','http://content-ind.cricinfo.com/wc2007/content/player/55269.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054829.player.jpg',1,'GB Brent'),
 (153,'Zimbabwe','Chamu Chibhabha',3,'','http://content-ind.cricinfo.com/wc2007/content/player/55354.html','http://ind.cricinfo.com/db/PICTURES/CMS/65900/65907.1.jpg',1,'CJ Chibhabha'),
 (154,'Zimbabwe','Elton Chigumbura',3,'','http://content-ind.cricinfo.com/wc2007/content/player/55343.html','http://ind.cricinfo.com/db/PICTURES/CMS/65900/65910.1.jpg',1,'E Chigumbura'),
 (155,'Zimbabwe','Keith Dabengwa',3,'','http://content-ind.cricinfo.com/wc2007/content/player/55388.html','http://ind.cricinfo.com/db/PICTURES/CMS/65900/65909.1.jpg',1,'KM Dabengwa'),
 (156,'Zimbabwe','Terry Duffin',1,'','http://content-ind.cricinfo.com/wc2007/content/player/55391.html','http://ind.cricinfo.com/db/PICTURES/CMS/65900/65905.1.jpg',1,'T Duffin');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (157,'Zimbabwe','Anthony Ireland',2,'','http://content-ind.cricinfo.com/wc2007/content/player/55522.html','',1,'AJ Ireland'),
 (158,'Zimbabwe','Friday Kasteni',1,'','http://content-ind.cricinfo.com/wc2007/content/player/55551.html','http://ind.cricinfo.com/db/PICTURES/CMS/67000/67022.1.jpg',1,'F Kasteni'),
 (159,'Zimbabwe','Stuart Matsikenyeri',1,'','http://content-ind.cricinfo.com/wc2007/content/player/55612.html','http://ind.cricinfo.com/db/PICTURES/DB/092004/054717.player.jpg',1,'S Matsikenyeri'),
 (160,'Zimbabwe','Christopher Mpofu',2,'','http://content-ind.cricinfo.com/wc2007/content/player/55633.html','',1,'CB Mpofu'),
 (161,'Zimbabwe','Tawanda Mupariwa',2,'','http://content-ind.cricinfo.com/wc2007/content/player/55652.html','http://ind.cricinfo.com/db/PICTURES/CMS/62700/62711.1.jpg',1,'T Mupariwa'),
 (162,'Zimbabwe','Edward Rainsford',2,'','http://content-ind.cricinfo.com/wc2007/content/player/55740.html','http://ind.cricinfo.com/db/PICTURES/DB/092004/054612.player.jpg',1,'EC Rainsford');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (163,'Zimbabwe','Vusi Sibanda',1,'','http://content-ind.cricinfo.com/wc2007/content/player/55787.html','http://ind.cricinfo.com/db/PICTURES/DB/092004/054723.player.jpg',1,'V Sibanda'),
 (164,'Zimbabwe','Brendan Taylor',4,'','http://content-ind.cricinfo.com/wc2007/content/player/55814.html','http://ind.cricinfo.com/db/PICTURES/CMS/50500/50550.1.jpg',1,'BRM Taylor  '),
 (165,'Zimbabwe','Sean Williams',1,'','http://content-ind.cricinfo.com/wc2007/content/player/55870.html','http://ind.cricinfo.com/db/PICTURES/CMS/67000/67056.1.jpg',1,'SC Williams'),
 (166,'Kenya','Steve Tikolo',3,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/24728.html','http://ind.cricinfo.com/db/PICTURES/DB/062004/053122.player.jpg',1,'SO Tikolo'),
 (167,'Kenya','Thomas Odoyo',3,'','http://content-ind.cricinfo.com/wc2007/content/player/24705.html','http://ind.cricinfo.com/db/PICTURES/DB/052004/052163.player.jpg',1,'TM Odoyo'),
 (168,'Kenya','Rajesh Bhudia',2,'','http://content-ind.cricinfo.com/wc2007/content/player/24773.html','http://ind.cricinfo.com/db/PICTURES/CMS/50300/50359.1.jpg',1,'R Bhudia');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (169,'Kenya','Jimmy Kamande',2,'','http://content-ind.cricinfo.com/wc2007/content/player/24697.html','http://ind.cricinfo.com/db/PICTURES/CMS/72000/72038.1.jpg',1,'JK Kamande'),
 (170,'Kenya','Tanmay Mishra',1,'','http://content-ind.cricinfo.com/wc2007/content/player/24790.html','http://ind.cricinfo.com/db/PICTURES/CMS/61100/61156.1.jpg',1,'T Mishra'),
 (171,'Kenya','Collins Obuya',1,'','http://content-ind.cricinfo.com/wc2007/content/player/24752.html','http://ind.cricinfo.com/db/PICTURES/CMS/61100/61152.1.jpg',1,'CO Obuya'),
 (172,'Kenya','David Obuya',4,'','http://content-ind.cricinfo.com/wc2007/content/player/24760.html','http://ind.cricinfo.com/db/PICTURES/CMS/32200/32256.1.jpg',1,'DO Obuya'),
 (173,'Kenya','Nehemiah Odhiambo',1,'','http://content-ind.cricinfo.com/wc2007/content/player/238612.html','',1,'N Odhiambo'),
 (174,'Kenya','Peter Ongondo',2,'','http://content-ind.cricinfo.com/wc2007/content/player/24762.html','http://ind.cricinfo.com/db/PICTURES/CMS/60700/60720.1.jpg',1,'PJ Ongondo');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (175,'Kenya','Lameck Onyango',2,'','http://content-ind.cricinfo.com/wc2007/content/player/24711.html','http://ind.cricinfo.com/db/PICTURES/DB/092004/054557.player.jpg',1,'LN Onyango'),
 (176,'Kenya','Maurice Ouma',4,'','http://content-ind.cricinfo.com/wc2007/content/player/24750.html','http://ind.cricinfo.com/db/PICTURES/DB/122004/056459.player.jpg',1,'MA Ouma'),
 (177,'Kenya','Malhar Patel',1,'','http://content-ind.cricinfo.com/wc2007/content/player/24784.html','',1,'ML Patel'),
 (178,'Kenya','Ravi Shah',1,'','http://content-ind.cricinfo.com/wc2007/content/player/24719.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054797.player.jpg',1,'RD Shah'),
 (179,'Kenya','Tony Suji',3,'','http://content-ind.cricinfo.com/wc2007/content/player/24723.html','http://ind.cricinfo.com/db/PICTURES/CMS/61100/61151.1.jpg',1,'AO Suji'),
 (180,'Kenya','Hiren Varaiya',2,'','http://content-ind.cricinfo.com/wc2007/content/player/254114.html','',1,'HA Varaiya');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (181,'Canada','John Davison',1,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/23852.html','http://ind.cricinfo.com/db/PICTURES/DB/052004/052314.player.jpg',1,'JM Davison'),
 (182,'Canada','Ashish Bagai',4,'vice captain','http://content-ind.cricinfo.com/wc2007/content/player/23797.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71967.1.jpg',1,'A Bagai'),
 (183,'Canada','Geoff Barnett',1,'','http://content-ind.cricinfo.com/wc2007/content/player/36383.html','',1,'GEF Barnett'),
 (184,'Canada','Umar Bhatti',2,'','http://content-ind.cricinfo.com/wc2007/content/player/23865.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71979.1.jpg',1,'U Bhatti'),
 (185,'Canada','Ian Billcliff',1,'','http://content-ind.cricinfo.com/wc2007/content/player/23850.html','http://ind.cricinfo.com/db/PICTURES/CMS/43400/43481.1.jpg',1,'IS Billcliff'),
 (186,'Canada','Desmond Chumney',1,'','http://content-ind.cricinfo.com/wc2007/content/player/23767.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71970.1.jpg',1,'DR Chumney');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (187,'Canada','Austin Codrington',2,'','http://content-ind.cricinfo.com/wc2007/content/player/23848.html','http://ind.cricinfo.com/db/PICTURES/DB/022004/050012.player.jpg',1,'A Codrington'),
 (188,'Canada','George Codrington',3,'','http://content-ind.cricinfo.com/wc2007/content/player/23811.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71972.1.jpg',1,'GR Codrington'),
 (189,'Canada','Anderson Cummins',2,'','http://content-ind.cricinfo.com/wc2007/content/player/51488.html','',1,'AC Cummins'),
 (190,'Canada','Sunil Dhaniram',3,'','http://content-ind.cricinfo.com/wc2007/content/player/51738.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71975.1.jpg',1,'S Dhaniram'),
 (191,'Canada','Ashif Mulla',4,'','http://content-ind.cricinfo.com/wc2007/content/player/23899.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71968.1.jpg',1,'AA Mulla'),
 (192,'Canada','Henry Osinde',2,'','http://content-ind.cricinfo.com/wc2007/content/player/212175.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71976.1.jpg',1,'H Osinde');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (193,'Canada','Qaiser Ali',1,'','http://content-ind.cricinfo.com/wc2007/content/player/216920.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71974.1.jpg',1,'Qaiser Ali'),
 (194,'Canada','Abdool Samad',1,'','http://content-ind.cricinfo.com/wc2007/content/player/23826.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71969.1.jpg',1,'AM Samad'),
 (195,'Canada','Kevin Sandher',2,'','http://content-ind.cricinfo.com/wc2007/content/player/23824.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71973.1.jpg',1,'KT Sandher'),
 (196,'Ireland','Trent Johnston',2,'','http://content-ind.cricinfo.com/wc2007/content/player/6038.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71990.1.jpg',1,'DT Johnston'),
 (197,'Ireland','Kyle McCallan',2,'','http://content-ind.cricinfo.com/wc2007/content/player/24251.html','http://ind.cricinfo.com/db/PICTURES/CMS/71800/71872.1.gif',1,'WK McCallan'),
 (198,'Ireland','Andre Botha',3,'','http://content-ind.cricinfo.com/wc2007/content/player/44102.html','',1,'AC Botha');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (199,'Ireland','Jeremy Bray',1,'','http://content-ind.cricinfo.com/wc2007/content/player/4433.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71984.1.jpg',1,'JP Bray'),
 (200,'Ireland','Kenneth Carroll',1,'','http://content-ind.cricinfo.com/wc2007/content/player/245287.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71986.1.jpg',1,'KED Carroll'),
 (201,'Ireland','Peter Gillespie',1,'','http://content-ind.cricinfo.com/wc2007/content/player/24243.html','http://ind.cricinfo.com/db/PICTURES/CMS/72200/72289.1.jpg',1,'PG Gillespie'),
 (202,'Ireland','Dave Langford-Smith',2,'','http://content-ind.cricinfo.com/wc2007/content/player/243942.html','',1,'D Langford-Smith'),
 (203,'Ireland','John Mooney',2,'','http://content-ind.cricinfo.com/wc2007/content/player/24237.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71985.1.jpg',1,'JF Mooney'),
 (204,'Ireland','Paul Mooney',2,'','http://content-ind.cricinfo.com/wc2007/content/player/24261.html','http://ind.cricinfo.com/db/PICTURES/CMS/72100/72172.1.jpg',1,'PJK Mooney');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (205,'Ireland','Eoin Morgan',1,'','http://content-ind.cricinfo.com/wc2007/content/player/24598.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71983.1.jpg',1,'EJG Morgan'),
 (206,'Ireland','Kevin O\'Brien',1,'','http://content-ind.cricinfo.com/wc2007/content/player/24605.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71987.1.jpg',1,'KJ O\'Brien'),
 (207,'Ireland','Niall O\'Brien',4,'','http://content-ind.cricinfo.com/wc2007/content/player/24289.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71988.1.jpg',1,'NJ O\'Brien'),
 (208,'Ireland','William Porterfield',1,'','http://content-ind.cricinfo.com/wc2007/content/player/24611.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71991.1.jpg',1,'WTS Porterfield'),
 (209,'Ireland','Boyd Rankin',2,'','http://content-ind.cricinfo.com/wc2007/content/player/24599.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71982.1.jpg',1,'WB Rankin'),
 (210,'Ireland','Andrew White',3,'','http://content-ind.cricinfo.com/wc2007/content/player/24286.html','http://ind.cricinfo.com/db/PICTURES/CMS/71900/71981.1.jpg',1,'AR White');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (211,'Netherlands','Luuk van Troost',1,'','http://content-ind.cricinfo.com/wc2007/content/player/24969.html','http://ind.cricinfo.com/db/PICTURES/DB/052004/052584.player.jpg',1,'LP van Troost'),
 (212,'Netherlands','Adeel Raja',2,'','http://content-ind.cricinfo.com/wc2007/content/player/24978.html','http://ind.cricinfo.com/db/PICTURES/DB/012003/041431.player.jpg',1,'Adeel Raja'),
 (213,'Netherlands','Peter Borren',2,'','http://content-ind.cricinfo.com/wc2007/content/player/36592.html','http://ind.cricinfo.com/db/PICTURES/DB/082002/038475.player.jpg',1,'PW Borren'),
 (214,'Netherlands','Tim de Leede',3,'','http://content-ind.cricinfo.com/wc2007/content/player/24882.html','http://ind.cricinfo.com/db/PICTURES/DB/012003/041423.player.jpg',1,'TBM de Leede'),
 (215,'Netherlands','Mark Jonkman',2,'','http://content-ind.cricinfo.com/wc2007/content/player/245397.html','',1,'MBS Jonkman'),
 (216,'Netherlands','Alexei Kervezee',1,'','http://content-ind.cricinfo.com/wc2007/content/player/214695.html','http://ind.cricinfo.com/db/PICTURES/CMS/66500/66534.1.jpg',1,'AN Kervezee');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (217,'Netherlands','Mohammad Kashif',2,'','http://content-ind.cricinfo.com/wc2007/content/player/243073.html','',1,'Mohammad Kashif'),
 (218,'Netherlands','Darron Reekers',1,'','http://content-ind.cricinfo.com/wc2007/content/player/38261.html','http://ind.cricinfo.com/db/PICTURES/DB/012002/033027.player.jpg',1,'DJ Reekers'),
 (219,'Netherlands','Edgar Schiferli',2,'','http://content-ind.cricinfo.com/wc2007/content/player/24943.html','http://ind.cricinfo.com/db/PICTURES/DB/012003/041428.player.jpg',1,'E Schiferli'),
 (220,'Netherlands','Jeroen Smits',4,'','http://content-ind.cricinfo.com/wc2007/content/player/24952.html','http://ind.cricinfo.com/db/PICTURES/DB/012003/041430.player.jpg',1,'J Smits'),
 (221,'Netherlands','Billy Stelling',2,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/47232.html','http://ind.cricinfo.com/db/PICTURES/DB/042001/025097.player.jpg',1,'Billy Stelling'),
 (222,'Netherlands','Eric Szwarczynski',1,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/214696.html','http://ind.cricinfo.com/db/PICTURES/CMS/72300/72390.1.jpg',1,'Eric Szwarczynski');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (223,'Netherlands','Ryan ten Doeschate',3,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/47660.html','http://content-ind.cricinfo.com/inline/content/image/216574.html?alt=1',1,'Ryan ten Doeschate'),
 (224,'Netherlands','Daan van Bunge',3,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/24964.html','http://content-ind.cricinfo.com/inline/content/image/24963.html?alt=player',1,'Daan van Bunge'),
 (225,'Netherlands','Bas Zuiderent',1,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/24990.html','http://ind.cricinfo.com/db/PICTURES/DB/012003/041436.player.jpg',1,'Bas Zuiderent'),
 (226,'Scotland','Craig Wright',3,'Captain','http://content-ind.cricinfo.com/wc2007/content/player/25123.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054890.player.jpg',1,'Craig Wright'),
 (227,'Scotland','Ryan Watson',1,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/25428.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054888.player.jpg',1,'Ryan Watson'),
 (228,'Scotland','John Blain',2,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/25087.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054881.player.jpg',1,'John Blain');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (229,'Scotland','Dougie Brown',3,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/9254.html','http://ind.cricinfo.com/db/PICTURES/CMS/70800/70859.1.jpg',1,'Dougie Brown'),
 (230,'Scotland','Gavin Hamilton',1,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/14020.html','http://ind.cricinfo.com/db/PICTURES/CMS/51100/51172.1.jpg',1,'Gavin Hamilton'),
 (231,'Scotland','Majid Haq',3,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/25451.html','http://content-ind.cricinfo.com/wc2007/content/player/25451.html',1,'Majid Haq'),
 (232,'Scotland','Paul Hoffmann',2,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/25432.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054885.player.jpg',1,'Paul Hoffmann'),
 (233,'Scotland','Douglas Lockhart',1,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/25098.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054886.player.jpg',1,'Douglas Lockhart'),
 (234,'Scotland','Ross Lyons',2,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/25475.html','http://ind.cricinfo.com/db/PICTURES/CMS/72300/72396.1.jpg',1,'Ross Lyons');
INSERT INTO `playing_nations_team` (`player_id`,`country_id`,`player_name`,`player_type`,`player_role`,`player_link`,`player_photolink`,`player_status`,`player_welknown_name`) VALUES 
 (235,'Scotland','Neil McCallum',1,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/25430.html','http://ind.cricinfo.com/db/PICTURES/CMS/72500/72518.1.jpg',1,'Neil McCallum'),
 (236,'Scotland','Dewald Nel',2,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/25481.html','http://ind.cricinfo.com/db/PICTURES/CMS/72300/72397.1.jpg',1,'Dewald Nel'),
 (237,'Scotland','Navdeep Poonia',1,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/19276.html','http://ind.cricinfo.com/db/PICTURES/CMS/70800/70860.1.jpg',1,'Navdeep Poonia'),
 (238,'Scotland','Glenn Rogers',2,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/272473.html','http://ind.cricinfo.com/db/PICTURES/CMS/72300/72398.1.jpg',1,'Glenn Rogers'),
 (239,'Scotland','Colin Smith',4,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/25112.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054891.player.jpg',1,'Colin Smith'),
 (240,'Scotland','Fraser Watts',1,NULL,'http://content-ind.cricinfo.com/wc2007/content/player/25120.html','http://ind.cricinfo.com/db/PICTURES/DB/102004/054889.player.jpg',1,'Fraser Watts');
/*!40000 ALTER TABLE `playing_nations_team` ENABLE KEYS */;


--
-- Definition of table `refx`
--

DROP TABLE IF EXISTS `refx`;
CREATE TABLE `refx` (
  `refx_code` varchar(30) NOT NULL default '',
  `refx_label` varchar(45) default NULL,
  `refx_value` smallint(5) unsigned NOT NULL,
  `refx_add_info` varchar(45) default NULL,
  PRIMARY KEY  (`refx_code`,`refx_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `refx`
--

/*!40000 ALTER TABLE `refx` DISABLE KEYS */;
INSERT INTO `refx` (`refx_code`,`refx_label`,`refx_value`,`refx_add_info`) VALUES 
 ('COUNTRY_STATUS','Active',1,NULL),
 ('COUNTRY_STATUS','InActive',2,NULL),
 ('COUNTRY_STATUS','Semi-finalist',3,NULL),
 ('COUNTRY_STATUS','Finalist',4,NULL),
 ('COUNTRY_STATUS','Winner',5,NULL),
 ('COUNTRY_STATUS','Banned',6,NULL),
 ('GENERAL_STATUS','Active',1,NULL),
 ('GENERAL_STATUS','In Active',2,NULL),
 ('MATCH_STATUS','Result',1,NULL),
 ('MATCH_STATUS','Tie',2,NULL),
 ('MATCH_STATUS','Washed off',3,NULL),
 ('MATCH_STATUS','Abandoned',4,NULL),
 ('OUT_TYPE','Did not batted',1,NULL),
 ('OUT_TYPE','Not Out',2,NULL),
 ('OUT_TYPE','Bowled',3,NULL),
 ('OUT_TYPE','LBW',4,NULL),
 ('OUT_TYPE','Caught',5,NULL),
 ('OUT_TYPE','Stumped',6,NULL),
 ('OUT_TYPE','Run Out',7,NULL),
 ('OUT_TYPE','Hit wicket',8,NULL),
 ('OUT_TYPE','Timed out',9,NULL),
 ('OUT_TYPE','Retired Hurt',10,NULL),
 ('PLAYER_TYPE','Batsman',1,NULL),
 ('PLAYER_TYPE','Bowler',2,NULL),
 ('PLAYER_TYPE','All rounder',3,NULL),
 ('PLAYER_TYPE','Wicket keeper',4,NULL),
 ('TOURNAMENT_STATUS','Active',1,'');
INSERT INTO `refx` (`refx_code`,`refx_label`,`refx_value`,`refx_add_info`) VALUES 
 ('TOURNAMENT_STATUS','Finished',2,NULL),
 ('TOURNAMENT_STATUS','In Active',3,NULL),
 ('TOURNAMENT_STATUS','To be played',4,NULL),
 ('YES_NO','Yes',1,NULL),
 ('YES_NO','No',2,NULL);
/*!40000 ALTER TABLE `refx` ENABLE KEYS */;


--
-- Definition of table `rules_table`
--

DROP TABLE IF EXISTS `rules_table`;
CREATE TABLE `rules_table` (
  `tournament_id` smallint(6) NOT NULL default '0',
  `points_for_playing` smallint(6) default NULL,
  `points_runs_scored` smallint(6) default NULL,
  `points_quater_century` smallint(6) default NULL,
  `points_half_century` smallint(6) default NULL,
  `points_century` smallint(6) default NULL,
  `minimum_runs` smallint(6) default NULL,
  `points_for_wicket` smallint(6) default NULL,
  `points_for_3wicket` smallint(6) default NULL,
  `points_for_5wicket` smallint(6) default NULL,
  `points_for_stumping` smallint(6) default NULL,
  `points_for_runOut` smallint(6) default NULL,
  `points_for_catch` smallint(6) default NULL,
  PRIMARY KEY  (`tournament_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rules_table`
--

/*!40000 ALTER TABLE `rules_table` DISABLE KEYS */;
INSERT INTO `rules_table` (`tournament_id`,`points_for_playing`,`points_runs_scored`,`points_quater_century`,`points_half_century`,`points_century`,`minimum_runs`,`points_for_wicket`,`points_for_3wicket`,`points_for_5wicket`,`points_for_stumping`,`points_for_runOut`,`points_for_catch`) VALUES 
 (0,1,1,0,10,25,0,25,10,25,5,5,5);
/*!40000 ALTER TABLE `rules_table` ENABLE KEYS */;


--
-- Definition of table `scorecard`
--

DROP TABLE IF EXISTS `scorecard`;
CREATE TABLE `scorecard` (
  `match_id` int(10) unsigned NOT NULL default '0' COMMENT 'Match id',
  `innings` int(10) unsigned NOT NULL default '0' COMMENT 'Innings 1st or 2nd ',
  `playing_position` int(10) unsigned NOT NULL default '0' COMMENT 'batting order',
  `batsman_id` int(10) unsigned default NULL COMMENT 'batsman player_id',
  `howout` int(10) unsigned default NULL COMMENT 'How batsman got out.',
  `helper_id` int(10) unsigned default NULL COMMENT 'Who helped the bowler to take wicket, player_id',
  `bowler_id` int(10) unsigned default NULL COMMENT 'bowler player_id',
  `runs_scored` int(10) unsigned default NULL COMMENT 'Runs scored by the batsman.',
  PRIMARY KEY  (`match_id`,`innings`,`playing_position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scorecard`
--

/*!40000 ALTER TABLE `scorecard` DISABLE KEYS */;
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (1,1,1,141,5,67,75,2),
 (1,1,2,139,5,67,65,19),
 (1,1,3,146,5,62,65,49),
 (1,1,4,145,5,74,69,63),
 (1,1,5,136,5,67,69,37),
 (1,1,6,138,5,71,65,16),
 (1,1,7,144,6,67,64,1),
 (1,1,8,148,5,61,75,32),
 (1,1,9,150,7,65,NULL,2),
 (1,1,10,143,2,NULL,NULL,1),
 (1,1,11,140,2,NULL,NULL,8),
 (1,2,1,66,5,144,143,6),
 (1,2,2,69,5,136,143,11),
 (1,2,3,62,5,144,150,9),
 (1,2,4,70,5,144,148,37),
 (1,2,5,61,4,NULL,148,36),
 (1,2,6,74,5,139,140,62),
 (1,2,7,67,5,138,148,0),
 (1,2,8,71,3,NULL,138,11),
 (1,2,9,65,5,136,138,11),
 (1,2,10,75,5,138,138,0),
 (1,2,11,64,2,NULL,NULL,0),
 (2,1,1,3,4,NULL,229,46),
 (2,1,2,5,4,NULL,231,60),
 (2,1,3,0,3,NULL,226,113),
 (2,1,4,2,3,NULL,231,15),
 (2,1,5,6,5,232,238,29),
 (2,1,6,8,6,239,232,4),
 (2,1,7,14,2,NULL,NULL,18),
 (2,1,8,7,2,NULL,NULL,40),
 (2,1,9,1,1,NULL,NULL,0),
 (2,1,10,13,1,NULL,NULL,0),
 (2,1,11,11,1,NULL,NULL,0),
 (2,2,1,240,3,NULL,11,9),
 (2,2,2,231,7,11,NULL,16);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (2,2,3,237,3,NULL,13,1),
 (2,2,4,227,5,1,11,6),
 (2,2,5,230,5,3,11,3),
 (2,2,6,229,5,14,6,19),
 (2,2,7,239,3,NULL,7,51),
 (2,2,8,226,4,NULL,13,4),
 (2,2,9,238,7,5,NULL,6),
 (2,2,10,232,2,NULL,NULL,0),
 (2,2,11,228,1,NULL,NULL,0),
 (3,1,1,183,5,170,174,41),
 (3,1,2,194,5,166,167,15),
 (3,1,3,182,6,176,180,19),
 (3,1,4,185,5,166,166,34),
 (3,1,5,181,3,NULL,169,8),
 (3,1,6,193,3,NULL,169,6),
 (3,1,7,191,5,174,166,25),
 (3,1,8,190,2,NULL,NULL,34),
 (3,1,9,184,7,170,NULL,1),
 (3,1,10,189,7,167,NULL,1),
 (3,1,11,192,7,180,NULL,1),
 (3,2,1,176,5,191,190,58),
 (3,2,2,172,5,182,189,4),
 (3,2,3,178,4,NULL,184,6),
 (3,2,4,166,2,NULL,NULL,72),
 (3,2,5,170,2,NULL,NULL,35),
 (3,2,6,171,1,NULL,NULL,0),
 (3,2,7,167,1,NULL,NULL,0),
 (3,2,8,169,1,NULL,NULL,0),
 (3,2,9,173,1,NULL,NULL,0),
 (3,2,10,174,1,NULL,NULL,0),
 (3,2,11,180,1,NULL,NULL,0),
 (4,1,1,134,5,46,50,30),
 (4,1,2,127,5,56,54,22),
 (4,1,3,121,5,50,48,85);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (4,1,4,132,5,58,53,76),
 (4,1,5,133,2,NULL,NULL,55),
 (4,1,6,125,5,58,50,12),
 (4,1,7,129,5,49,54,9),
 (4,1,8,122,2,NULL,NULL,2),
 (4,1,9,131,1,NULL,NULL,0),
 (4,1,10,135,1,NULL,NULL,0),
 (4,1,11,130,1,NULL,NULL,0),
 (4,2,1,57,4,NULL,135,0),
 (4,2,2,56,3,NULL,129,6),
 (4,2,3,54,5,132,130,0),
 (4,2,4,49,5,121,130,14),
 (4,2,5,45,4,NULL,130,0),
 (4,2,6,58,3,NULL,131,4),
 (4,2,7,46,5,132,129,4),
 (4,2,8,48,5,132,129,28),
 (4,2,9,47,5,128,129,6),
 (4,2,10,50,2,NULL,NULL,6),
 (4,2,11,53,4,NULL,131,1),
 (5,1,1,208,5,163,160,0),
 (5,1,2,199,2,NULL,NULL,115),
 (5,1,3,205,5,154,152,21),
 (5,1,4,207,5,164,154,1),
 (5,1,5,198,3,NULL,154,1),
 (5,1,6,206,5,164,162,10),
 (5,1,7,210,4,NULL,152,28),
 (5,1,8,196,7,165,NULL,20),
 (5,1,9,197,6,164,165,0),
 (5,1,10,202,5,164,160,15),
 (5,1,11,209,1,NULL,NULL,0),
 (5,2,1,156,5,207,209,12),
 (5,2,2,163,8,NULL,210,67),
 (5,2,3,153,5,202,196,12),
 (5,2,4,165,5,209,197,14);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (5,2,5,159,2,NULL,NULL,73),
 (5,2,6,154,5,199,197,4),
 (5,2,7,164,7,197,NULL,24),
 (5,2,8,152,4,NULL,198,3),
 (5,2,9,151,5,205,206,1),
 (5,2,10,160,7,196,NULL,0),
 (5,2,11,162,7,207,NULL,1),
 (6,1,1,118,5,220,221,0),
 (6,1,2,106,5,224,213,67),
 (6,1,3,109,2,NULL,NULL,128),
 (6,1,4,107,5,224,211,72),
 (6,1,5,115,2,NULL,NULL,75),
 (6,1,6,117,1,NULL,NULL,0),
 (6,1,7,113,1,NULL,NULL,0),
 (6,1,8,114,1,NULL,NULL,0),
 (6,1,9,110,1,NULL,NULL,0),
 (6,1,10,116,1,NULL,NULL,0),
 (6,1,11,119,1,NULL,NULL,0),
 (6,2,1,225,3,NULL,114,1),
 (6,2,2,218,7,117,NULL,4),
 (6,2,3,216,5,114,116,17),
 (6,2,4,223,7,118,NULL,57),
 (6,2,5,224,4,NULL,110,5),
 (6,2,6,222,4,NULL,106,12),
 (6,2,7,214,3,NULL,113,21),
 (6,2,8,213,7,109,NULL,2),
 (6,2,9,211,5,106,113,5),
 (6,2,10,221,2,NULL,NULL,1),
 (6,2,11,220,1,NULL,NULL,0),
 (7,1,1,83,5,95,100,0),
 (7,1,2,76,3,NULL,100,26),
 (7,1,3,78,5,95,104,5),
 (7,1,4,88,5,100,97,60);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (7,1,5,80,5,95,96,31),
 (7,1,6,82,5,96,97,0),
 (7,1,7,81,5,95,96,3),
 (7,1,8,86,2,NULL,NULL,42),
 (7,1,9,89,2,NULL,NULL,29),
 (7,1,10,77,1,NULL,NULL,0),
 (7,1,11,87,1,NULL,NULL,0),
 (7,2,1,105,5,86,77,0),
 (7,2,2,91,5,83,77,7),
 (7,2,3,99,5,82,89,0),
 (7,2,4,96,2,NULL,NULL,87),
 (7,2,5,98,5,81,87,27),
 (7,2,6,104,2,NULL,NULL,63),
 (7,2,7,95,1,NULL,NULL,0),
 (7,2,8,94,1,NULL,NULL,0),
 (7,2,9,100,1,NULL,NULL,0),
 (7,2,10,97,1,NULL,NULL,0),
 (7,2,11,93,1,NULL,NULL,0),
 (8,1,1,34,5,17,22,66),
 (8,1,2,41,3,NULL,20,2),
 (8,1,3,43,5,18,20,9),
 (8,1,4,31,5,23,17,7),
 (8,1,5,30,4,NULL,22,14),
 (8,1,6,44,5,15,17,47),
 (8,1,7,33,5,18,22,0),
 (8,1,8,35,3,NULL,17,0),
 (8,1,9,32,5,23,20,0),
 (8,1,10,37,2,NULL,NULL,15),
 (8,1,11,39,5,17,20,15),
 (8,2,1,28,5,33,39,51),
 (8,2,2,16,4,NULL,37,2),
 (8,2,3,23,2,NULL,NULL,56),
 (8,2,4,18,4,NULL,39,8),
 (8,2,5,25,6,33,41,53),
 (8,2,6,15,6,33,41,1);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (8,2,7,21,2,NULL,NULL,8),
 (8,2,8,22,1,NULL,NULL,0),
 (8,2,9,20,1,NULL,NULL,0),
 (8,2,10,17,1,NULL,NULL,0),
 (8,2,11,27,1,NULL,NULL,0),
 (9,1,1,69,5,207,202,4),
 (9,1,2,66,5,205,198,24),
 (9,1,3,62,5,198,209,0),
 (9,1,4,70,5,208,196,15),
 (9,1,5,61,5,205,198,1),
 (9,1,6,74,5,207,206,9),
 (9,1,7,67,5,196,209,27),
 (9,1,8,63,5,196,209,2),
 (9,1,9,73,5,199,197,12),
 (9,1,10,65,2,NULL,NULL,8),
 (9,1,11,75,5,203,197,1),
 (9,2,1,199,4,NULL,73,3),
 (9,2,2,208,3,NULL,69,13),
 (9,2,3,205,4,NULL,73,2),
 (9,2,4,207,6,67,74,72),
 (9,2,5,198,5,69,73,0),
 (9,2,6,206,2,NULL,NULL,16),
 (9,2,7,210,5,69,65,4),
 (9,2,8,197,5,62,65,0),
 (9,2,9,196,2,NULL,NULL,9),
 (9,2,10,202,1,NULL,NULL,0),
 (9,2,11,209,1,NULL,NULL,0),
 (10,1,1,3,5,211,214,57),
 (10,1,2,5,5,213,214,59),
 (10,1,3,0,5,223,223,23),
 (10,1,4,2,2,NULL,NULL,93),
 (10,1,5,6,3,NULL,213,123),
 (10,1,6,8,5,217,223,2),
 (10,1,7,14,2,NULL,NULL,12);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (10,1,8,7,1,NULL,NULL,0),
 (10,1,9,1,1,NULL,NULL,0),
 (10,1,10,13,1,NULL,NULL,0),
 (10,1,11,11,1,NULL,NULL,0),
 (10,2,1,225,7,2,NULL,9),
 (10,2,2,218,5,2,1,25),
 (10,2,3,216,4,NULL,1,0),
 (10,2,4,223,4,NULL,13,1),
 (10,2,5,211,4,NULL,11,0),
 (10,2,6,224,4,NULL,11,33),
 (10,2,7,214,5,5,7,14),
 (10,2,8,213,5,8,7,24),
 (10,2,9,220,4,NULL,7,3),
 (10,2,10,212,2,NULL,NULL,8),
 (10,2,11,215,6,3,7,0),
 (11,1,1,83,3,NULL,190,66),
 (11,1,2,76,5,181,194,45),
 (11,1,3,78,5,188,190,28),
 (11,1,4,88,5,190,190,5),
 (11,1,5,80,2,NULL,NULL,62),
 (11,1,6,79,3,NULL,188,29),
 (11,1,7,81,5,182,189,2),
 (11,1,8,86,2,NULL,NULL,23),
 (11,1,9,89,1,NULL,NULL,0),
 (11,1,10,77,1,NULL,NULL,0),
 (11,1,11,87,1,NULL,NULL,0),
 (11,2,1,181,5,78,77,21),
 (11,2,2,183,3,NULL,89,7),
 (11,2,3,182,5,88,89,6),
 (11,2,4,185,3,NULL,79,20),
 (11,2,5,194,4,NULL,87,36),
 (11,2,6,191,6,86,79,58),
 (11,2,7,186,2,NULL,NULL,27),
 (11,2,8,190,7,80,NULL,30);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (11,2,9,188,2,NULL,NULL,7),
 (11,2,10,184,1,NULL,NULL,0),
 (11,2,11,189,1,NULL,NULL,0),
 (12,1,1,43,5,53,51,3),
 (12,1,2,34,6,46,47,89),
 (12,1,3,41,5,51,50,114),
 (12,1,4,33,5,58,47,29),
 (12,1,5,44,5,51,53,83),
 (12,1,6,31,2,NULL,NULL,57),
 (12,1,7,30,2,NULL,NULL,7),
 (12,1,8,32,1,NULL,NULL,0),
 (12,1,9,38,1,NULL,NULL,0),
 (12,1,10,37,1,NULL,NULL,0),
 (12,1,11,39,1,NULL,NULL,0),
 (12,2,1,56,3,NULL,37,0),
 (12,2,2,55,3,NULL,37,9),
 (12,2,3,47,4,NULL,39,13),
 (12,2,4,49,2,NULL,NULL,76),
 (12,2,5,45,4,NULL,38,0),
 (12,2,6,58,3,NULL,38,0),
 (12,2,7,46,5,36,32,21),
 (12,2,8,48,5,43,32,0),
 (12,2,9,50,3,NULL,32,0),
 (12,2,10,53,5,33,31,9),
 (12,2,11,51,4,NULL,38,1),
 (13,1,1,163,3,NULL,143,1),
 (13,1,2,158,3,NULL,150,0),
 (13,1,3,153,3,NULL,150,12),
 (13,1,4,164,7,138,NULL,50),
 (13,1,5,159,5,143,148,16),
 (13,1,6,165,2,NULL,NULL,70),
 (13,1,7,154,2,NULL,NULL,30),
 (13,1,8,151,1,NULL,NULL,0);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (13,1,9,161,1,NULL,NULL,0),
 (13,1,10,160,1,NULL,NULL,0),
 (13,1,11,157,1,NULL,NULL,0),
 (13,2,1,141,5,163,160,40),
 (13,2,2,139,5,163,154,21),
 (13,2,3,146,5,157,157,12),
 (13,2,4,145,5,153,161,28),
 (13,2,5,136,2,NULL,NULL,44),
 (13,2,6,138,2,NULL,NULL,37),
 (13,2,7,148,1,NULL,NULL,0),
 (13,2,8,144,1,NULL,NULL,0),
 (13,2,9,150,1,NULL,NULL,0),
 (13,2,10,143,1,NULL,NULL,0),
 (13,2,11,140,1,NULL,NULL,0),
 (14,1,1,240,5,106,116,24),
 (14,1,2,231,5,115,110,13),
 (14,1,3,227,7,118,NULL,31),
 (14,1,4,230,5,118,110,4),
 (14,1,5,235,3,NULL,116,1),
 (14,1,6,229,2,NULL,NULL,45),
 (14,1,7,239,3,NULL,114,15),
 (14,1,8,228,5,113,110,23),
 (14,1,9,232,7,115,NULL,18),
 (14,1,10,238,1,NULL,NULL,0),
 (14,1,11,236,1,NULL,NULL,0),
 (14,2,1,106,5,238,231,91),
 (14,2,2,118,5,229,238,62),
 (14,2,3,117,5,235,231,21),
 (14,2,4,113,2,NULL,NULL,12),
 (14,2,5,114,2,NULL,NULL,0),
 (14,2,6,109,1,NULL,NULL,0);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (14,2,7,107,1,NULL,NULL,0),
 (14,2,8,115,1,NULL,NULL,0),
 (14,2,9,110,1,NULL,NULL,0),
 (14,2,10,116,1,NULL,NULL,0),
 (14,2,11,108,1,NULL,NULL,0),
 (15,1,1,105,5,166,167,0),
 (15,1,2,91,7,171,NULL,60),
 (15,1,3,99,5,166,166,85),
 (15,1,4,96,5,170,175,63),
 (15,1,5,98,5,166,174,71),
 (15,1,6,104,3,NULL,167,3),
 (15,1,7,95,5,180,174,6),
 (15,1,8,94,2,NULL,NULL,14),
 (15,1,9,100,2,NULL,NULL,0),
 (15,1,10,97,1,NULL,NULL,0),
 (15,1,11,101,1,NULL,NULL,0),
 (15,2,1,176,7,105,NULL,4),
 (15,2,2,172,4,NULL,101,1),
 (15,2,3,178,5,94,94,71),
 (15,2,4,166,5,94,101,7),
 (15,2,5,170,5,91,100,2),
 (15,2,6,171,7,100,NULL,21),
 (15,2,7,167,5,104,97,42),
 (15,2,8,169,3,NULL,94,12),
 (15,2,9,175,7,105,NULL,6),
 (15,2,10,174,5,100,100,4),
 (15,2,11,180,2,NULL,NULL,1),
 (16,1,1,134,5,18,22,26),
 (16,1,2,127,5,15,17,109),
 (16,1,3,121,5,18,25,46),
 (16,1,4,132,5,28,27,56),
 (16,1,5,133,2,NULL,NULL,52),
 (16,1,6,122,2,NULL,NULL,5);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (16,1,7,125,1,NULL,NULL,0),
 (16,1,8,131,1,NULL,NULL,0),
 (16,1,9,135,1,NULL,NULL,0),
 (16,1,10,130,1,NULL,NULL,0),
 (16,1,11,129,1,NULL,NULL,0),
 (16,2,1,28,5,132,130,6),
 (16,2,2,16,4,NULL,135,0),
 (16,2,3,23,5,125,129,6),
 (16,2,4,18,5,127,130,12),
 (16,2,5,25,3,NULL,131,4),
 (16,2,6,15,7,121,NULL,18),
 (16,2,7,21,2,NULL,NULL,45),
 (16,2,8,20,5,134,122,7),
 (16,2,9,22,5,129,125,7),
 (16,2,10,17,5,132,130,0),
 (16,2,11,27,7,125,NULL,0),
 (17,1,1,67,5,164,154,15),
 (17,1,2,66,5,159,160,160),
 (17,1,3,74,5,153,165,21),
 (17,1,4,61,5,165,161,37),
 (17,1,5,70,5,152,152,3),
 (17,1,6,62,7,160,NULL,28),
 (17,1,7,72,3,NULL,152,16),
 (17,1,8,73,5,151,152,5),
 (17,1,9,65,5,159,154,32),
 (17,1,10,75,3,NULL,154,10),
 (17,1,11,64,2,NULL,NULL,6),
 (17,2,1,163,5,66,75,0),
 (17,2,2,153,5,61,75,3),
 (17,2,3,158,5,61,73,9),
 (17,2,4,164,5,62,64,13),
 (17,2,5,159,7,67,NULL,18),
 (17,2,6,154,3,NULL,72,27);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (17,2,7,165,5,75,64,11),
 (17,2,8,152,3,NULL,72,9),
 (17,2,9,151,2,NULL,NULL,4),
 (17,2,10,161,3,NULL,72,0),
 (17,2,11,160,5,61,70,1),
 (18,1,1,237,5,220,221,0),
 (18,1,2,231,3,NULL,218,6),
 (18,1,3,227,5,214,214,16),
 (18,1,4,230,4,NULL,221,4),
 (18,1,5,229,4,NULL,221,0),
 (18,1,6,235,5,221,215,24),
 (18,1,7,239,3,NULL,215,19),
 (18,1,8,226,6,220,217,1),
 (18,1,9,228,2,NULL,NULL,18),
 (18,1,10,238,5,220,217,26),
 (18,1,11,232,5,223,224,7),
 (18,2,1,225,2,NULL,NULL,43),
 (18,2,2,218,5,226,228,9),
 (18,2,3,222,5,239,228,12),
 (18,2,4,223,2,NULL,NULL,70),
 (18,2,5,224,1,NULL,NULL,0),
 (18,2,6,214,1,NULL,NULL,0),
 (18,2,7,215,1,NULL,NULL,0),
 (18,2,8,221,1,NULL,NULL,0),
 (18,2,9,213,1,NULL,NULL,0),
 (18,2,10,220,1,NULL,NULL,0),
 (18,2,11,217,1,NULL,NULL,0),
 (19,1,1,105,5,181,181,101),
 (19,1,2,91,5,185,195,66),
 (19,1,3,103,4,NULL,195,47),
 (19,1,4,96,5,182,194,28),
 (19,1,5,98,5,194,181,10);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (19,1,6,104,2,NULL,NULL,35),
 (19,1,7,95,2,NULL,NULL,52),
 (19,1,8,94,1,NULL,NULL,0),
 (19,1,9,102,1,NULL,NULL,0),
 (19,1,10,93,1,NULL,NULL,0),
 (19,1,11,101,1,NULL,NULL,0),
 (19,2,1,181,5,101,101,52),
 (19,2,2,183,5,95,94,40),
 (19,2,3,182,3,NULL,94,37),
 (19,2,4,185,3,NULL,96,50),
 (19,2,5,194,7,105,NULL,9),
 (19,2,6,191,4,NULL,94,0),
 (19,2,7,190,9,NULL,NULL,17),
 (19,2,8,184,3,NULL,93,10),
 (19,2,9,189,2,NULL,NULL,9),
 (19,2,10,195,3,NULL,93,2),
 (19,2,11,192,3,NULL,93,0),
 (20,1,1,134,4,NULL,31,64),
 (20,1,2,127,5,32,37,6),
 (20,1,3,121,5,33,32,7),
 (20,1,4,132,5,39,34,15),
 (20,1,5,133,5,33,37,59),
 (20,1,6,125,5,33,39,38),
 (20,1,7,122,2,NULL,NULL,19),
 (20,1,8,135,2,NULL,NULL,19),
 (20,1,9,131,1,NULL,NULL,0),
 (20,1,10,130,1,NULL,NULL,0),
 (20,1,11,126,1,NULL,NULL,0),
 (20,2,1,43,5,135,135,18),
 (20,2,2,34,5,131,135,7),
 (20,2,3,41,5,121,131,48),
 (20,2,4,31,3,NULL,126,0);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (20,2,5,30,5,131,127,60),
 (20,2,6,44,7,122,NULL,6),
 (20,2,7,33,4,NULL,131,0),
 (20,2,8,32,5,122,130,10),
 (20,2,9,35,2,NULL,NULL,17),
 (20,2,10,37,5,130,131,1),
 (20,2,11,39,5,135,125,10),
 (21,1,1,199,5,147,150,41),
 (21,1,2,208,5,141,143,0),
 (21,1,3,205,5,144,143,18),
 (21,1,4,207,5,144,137,11),
 (21,1,5,198,5,144,141,28),
 (21,1,6,206,5,146,141,17),
 (21,1,7,210,3,NULL,138,18),
 (21,1,8,197,2,NULL,NULL,20),
 (21,1,9,203,5,144,138,0),
 (21,1,10,202,2,NULL,NULL,8),
 (21,1,11,209,1,NULL,NULL,0),
 (21,2,1,141,5,210,202,18),
 (21,2,2,139,2,NULL,NULL,102),
 (21,2,3,146,5,206,197,36),
 (21,2,4,145,2,NULL,NULL,27),
 (21,2,5,136,1,NULL,NULL,0),
 (21,2,6,138,1,NULL,NULL,0),
 (21,2,7,148,1,NULL,NULL,0),
 (21,2,8,144,1,NULL,NULL,0),
 (21,2,9,137,1,NULL,NULL,0),
 (21,2,10,150,1,NULL,NULL,0),
 (21,2,11,143,1,NULL,NULL,0),
 (22,1,1,3,5,107,116,42),
 (22,1,2,5,5,107,109,101),
 (22,1,3,0,5,118,108,91);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (22,1,4,2,7,114,NULL,92),
 (22,1,5,12,3,NULL,110,18),
 (22,1,6,8,5,109,110,5),
 (22,1,7,14,2,NULL,NULL,14),
 (22,1,8,7,1,NULL,NULL,0),
 (22,1,9,1,1,NULL,NULL,0),
 (22,1,10,13,1,NULL,NULL,0),
 (22,1,11,11,1,NULL,NULL,0),
 (22,2,1,106,5,3,7,74),
 (22,2,2,118,7,14,NULL,92),
 (22,2,3,109,5,2,7,48),
 (22,2,4,107,6,3,7,17),
 (22,2,5,117,5,5,11,1),
 (22,2,6,115,3,NULL,13,22),
 (22,2,7,113,4,NULL,13,1),
 (22,2,8,114,3,NULL,14,7),
 (22,2,9,110,2,NULL,NULL,8),
 (22,2,10,116,3,NULL,1,0),
 (22,2,11,108,3,NULL,1,7),
 (23,1,1,176,5,80,77,13),
 (23,1,2,178,3,NULL,77,4),
 (23,1,3,179,5,76,85,14),
 (23,1,4,166,3,NULL,82,76),
 (23,1,5,170,3,NULL,80,0),
 (23,1,6,171,7,79,NULL,10),
 (23,1,7,167,4,NULL,82,4),
 (23,1,8,169,3,NULL,80,17),
 (23,1,9,175,7,86,NULL,10),
 (23,1,10,174,7,76,NULL,3),
 (23,1,11,180,2,NULL,NULL,4),
 (23,2,1,83,3,NULL,166,75),
 (23,2,2,76,5,171,174,1),
 (23,2,3,78,5,168,167,16);
INSERT INTO `scorecard` (`match_id`,`innings`,`playing_position`,`batsman_id`,`howout`,`helper_id`,`bowler_id`,`runs_scored`) VALUES 
 (23,2,4,88,2,NULL,NULL,56),
 (23,2,5,80,2,NULL,NULL,18),
 (23,2,6,82,1,NULL,NULL,0),
 (23,2,7,79,1,NULL,NULL,0),
 (23,2,8,86,1,NULL,NULL,0),
 (23,2,9,77,1,NULL,NULL,0),
 (23,2,10,87,1,NULL,NULL,0),
 (23,2,11,85,1,NULL,NULL,0),
 (24,1,1,55,5,22,20,0),
 (24,1,2,56,5,15,25,22),
 (24,1,3,47,5,15,20,2),
 (24,1,4,49,5,18,27,0),
 (24,1,5,45,4,NULL,17,11),
 (24,1,6,46,5,28,17,23),
 (24,1,7,48,3,NULL,25,16),
 (24,1,8,58,5,28,22,9),
 (24,1,9,50,3,NULL,17,0),
 (24,1,10,54,2,NULL,NULL,0),
 (24,1,11,53,1,NULL,NULL,0),
 (24,2,1,28,5,50,54,1),
 (24,2,2,16,5,58,54,12),
 (24,2,3,18,4,NULL,54,7),
 (24,2,4,25,2,NULL,NULL,26),
 (24,2,5,21,2,NULL,NULL,29),
 (24,2,6,23,1,NULL,NULL,0),
 (24,2,7,15,1,NULL,NULL,0),
 (24,2,8,22,1,NULL,NULL,0),
 (24,2,9,20,1,NULL,NULL,0),
 (24,2,10,17,1,NULL,NULL,0),
 (24,2,11,27,1,NULL,NULL,0);
/*!40000 ALTER TABLE `scorecard` ENABLE KEYS */;


--
-- Definition of table `team_contribution`
--

DROP TABLE IF EXISTS `team_contribution`;
CREATE TABLE `team_contribution` (
  `match_id` int(10) unsigned NOT NULL auto_increment,
  `country_id` varchar(30) NOT NULL,
  `runs_scored` int(10) unsigned default NULL,
  `wicket_lost` int(10) unsigned default NULL,
  `batted_first` int(10) unsigned default NULL,
  `overs_played` float(5,2) default NULL,
  PRIMARY KEY  (`match_id`,`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team_contribution`
--

/*!40000 ALTER TABLE `team_contribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_contribution` ENABLE KEYS */;


--
-- Definition of table `tournament_changes`
--

DROP TABLE IF EXISTS `tournament_changes`;
CREATE TABLE `tournament_changes` (
  `tournament_id` int(10) unsigned NOT NULL default '0',
  `tournament_stage` int(10) unsigned NOT NULL default '0',
  `changes_permitted` int(10) unsigned default NULL,
  `stage_description` varchar(45) default NULL,
  `stage_effective_date` datetime NOT NULL,
  PRIMARY KEY  (`tournament_id`,`tournament_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament_changes`
--

/*!40000 ALTER TABLE `tournament_changes` DISABLE KEYS */;
INSERT INTO `tournament_changes` (`tournament_id`,`tournament_stage`,`changes_permitted`,`stage_description`,`stage_effective_date`) VALUES 
 (0,0,100,'League Matches','2007-03-13 00:00:00'),
 (0,1,100,'Super 8 to Final','2007-03-27 00:00:00');
/*!40000 ALTER TABLE `tournament_changes` ENABLE KEYS */;


--
-- Definition of table `tournament_matches`
--

DROP TABLE IF EXISTS `tournament_matches`;
CREATE TABLE `tournament_matches` (
  `match_id` smallint(6) NOT NULL auto_increment,
  `tournament_id` int(11) NOT NULL default '0',
  `match_date` datetime NOT NULL default '2007-01-01 00:00:00',
  `match_venue` varchar(128) default 'WESTINDIES',
  `country_id1` varchar(30) NOT NULL default '""',
  `country_id2` varchar(30) NOT NULL default '""',
  `match_type` varchar(20) default 'ODI',
  `match_result` varchar(20) default NULL,
  `match_winner` varchar(30) default NULL,
  `match_tournament_status` varchar(128) default NULL,
  `comments` varchar(255) default NULL,
  `first_batting_team` varchar(30) default NULL,
  PRIMARY KEY  (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament_matches`
--

/*!40000 ALTER TABLE `tournament_matches` DISABLE KEYS */;
INSERT INTO `tournament_matches` (`match_id`,`tournament_id`,`match_date`,`match_venue`,`country_id1`,`country_id2`,`match_type`,`match_result`,`match_winner`,`match_tournament_status`,`comments`,`first_batting_team`) VALUES 
 (1,0,'2007-03-13 00:00:00','Sabina Park, Jamaica','West Indies','Pakistan','1','1','West Indies',NULL,NULL,'West Indies'),
 (2,0,'2007-03-14 00:00:00','Warner Park, St Kitts','Australia','Scotland','1','1','Australia',NULL,NULL,'Australia'),
 (3,0,'2007-03-14 00:00:00','Beausejour Stadium, St Lucia','Canada','Kenya','1','1','Kenya',NULL,NULL,'Canada'),
 (4,0,'2007-03-15 00:00:00','Queen\'s Park Oval, Trinidad','Bermuda','Sri Lanka','1','1','Sri Lanka',NULL,NULL,'Sri Lanka'),
 (5,0,'2007-03-15 00:00:00','Sabina Park, Jamaica','Ireland','Zimbabwe','1','2','',NULL,NULL,'Ireland'),
 (6,0,'2007-03-16 00:00:00','Warner Park, St Kitts','Netherlands','South Africa','1','1','South Africa',NULL,NULL,'South Africa'),
 (7,0,'2007-03-16 00:00:00','Beausejour Stadium, St Lucia','England','New Zealand','1','1','New Zealand',NULL,NULL,'England'),
 (8,0,'2007-03-17 00:00:00','Queen\'s Park Oval, Trinidad','Bangladesh','India','1','1','Bangladesh',NULL,NULL,'India');
INSERT INTO `tournament_matches` (`match_id`,`tournament_id`,`match_date`,`match_venue`,`country_id1`,`country_id2`,`match_type`,`match_result`,`match_winner`,`match_tournament_status`,`comments`,`first_batting_team`) VALUES 
 (9,0,'2007-03-17 00:00:00','Sabina Park, Jamaica','Ireland','Pakistan','1','1','Ireland',NULL,NULL,'Pakistan'),
 (10,0,'2007-03-18 00:00:00','Warner Park, St Kitts','Australia','Netherlands','1','1','Australia',NULL,NULL,'Australia'),
 (11,0,'2007-03-18 00:00:00','Beausejour Stadium, St Lucia','Canada','England','1','1','England',NULL,NULL,'England'),
 (12,0,'2007-03-19 00:00:00','Queen\'s Park Oval, Trinidad','Bermuda','India','1','1','India',NULL,NULL,'India'),
 (13,0,'2007-03-19 00:00:00','Sabina Park, Jamaica','West Indies','Zimbabwe','1','1','West Indies',NULL,NULL,'Zimbabwe'),
 (14,0,'2007-03-20 00:00:00','Warner Park, St Kitts','Scotland','South Africa','1','1','South Africa',NULL,NULL,'Scotland'),
 (15,0,'2007-03-20 00:00:00','Beausejour Stadium, St Lucia','Kenya','New Zealand','1','1','New Zealand',NULL,NULL,'New Zealand'),
 (16,0,'2007-03-21 00:00:00','Queen\'s Park Oval, Trinidad','Bangladesh','Sri Lanka','1','1','Sri Lanka',NULL,NULL,'Sri Lanka');
INSERT INTO `tournament_matches` (`match_id`,`tournament_id`,`match_date`,`match_venue`,`country_id1`,`country_id2`,`match_type`,`match_result`,`match_winner`,`match_tournament_status`,`comments`,`first_batting_team`) VALUES 
 (17,0,'2007-03-21 00:00:00','Sabina Park, Jamaica','Pakistan','Zimbabwe','1','1','Pakistan',NULL,NULL,'Pakistan'),
 (18,0,'2007-03-22 00:00:00','Warner Park, St Kitts','Netherlands','Scotland','1','1','Netherlands',NULL,NULL,'Scotland'),
 (19,0,'2007-03-22 00:00:00','Beausejour Stadium, St Lucia','Canada','New Zealand','1','1','New Zealand',NULL,NULL,'New Zealand'),
 (20,0,'2007-03-23 00:00:00','Queen\'s Park Oval, Trinidad','India','Sri Lanka','1','1','Sri Lanka',NULL,NULL,'Sri Lanka'),
 (21,0,'2007-03-23 00:00:00','Sabina Park, Jamaica','Ireland','West Indies','1','1','West Indies',NULL,NULL,'Ireland'),
 (22,0,'2007-03-24 00:00:00','Warner Park, St Kitts','Australia','South Africa','1','1','Australia',NULL,NULL,'Australia'),
 (23,0,'2007-03-24 00:00:00','Beausejour Stadium, St Lucia','England','Kenya','1','1','England',NULL,NULL,'Kenya'),
 (24,0,'2007-03-25 00:00:00','Queen\'s Park Oval, Trinidad','Bangladesh','Bermuda','1','1','Bangladesh',NULL,NULL,'Bermuda');
/*!40000 ALTER TABLE `tournament_matches` ENABLE KEYS */;


--
-- Definition of table `tournament_nation`
--

DROP TABLE IF EXISTS `tournament_nation`;
CREATE TABLE `tournament_nation` (
  `tournament_id` smallint(6) NOT NULL default '0',
  `country_id` varchar(30) NOT NULL default '""',
  `country_status_in_tournament` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`tournament_id`,`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament_nation`
--

/*!40000 ALTER TABLE `tournament_nation` DISABLE KEYS */;
INSERT INTO `tournament_nation` (`tournament_id`,`country_id`,`country_status_in_tournament`) VALUES 
 (0,'Australia',1),
 (0,'Bangladesh',1),
 (0,'Bermuda',2),
 (0,'Canada',2),
 (0,'England',1),
 (0,'India',2),
 (0,'Ireland',1),
 (0,'Kenya',2),
 (0,'Netherlands',2),
 (0,'New Zealand',1),
 (0,'Pakistan',2),
 (0,'Scotland',2),
 (0,'South Africa',1),
 (0,'Sri Lanka',1),
 (0,'West Indies',1),
 (0,'Zimbabwe',2);
/*!40000 ALTER TABLE `tournament_nation` ENABLE KEYS */;


--
-- Definition of table `tournament_players`
--

DROP TABLE IF EXISTS `tournament_players`;
CREATE TABLE `tournament_players` (
  `tournament_id` smallint(6) NOT NULL default '0',
  `player_id` smallint(6) NOT NULL default '0',
  `player_value` int(10) unsigned default NULL,
  PRIMARY KEY  (`tournament_id`,`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament_players`
--

/*!40000 ALTER TABLE `tournament_players` DISABLE KEYS */;
INSERT INTO `tournament_players` (`tournament_id`,`player_id`,`player_value`) VALUES 
 (0,0,150),
 (0,1,125),
 (0,2,135),
 (0,3,140),
 (0,4,120),
 (0,5,135),
 (0,6,125),
 (0,7,120),
 (0,8,135),
 (0,9,120),
 (0,10,110),
 (0,11,140),
 (0,12,135),
 (0,13,120),
 (0,14,130),
 (0,15,125),
 (0,16,120),
 (0,17,115),
 (0,18,110),
 (0,19,120),
 (0,20,100),
 (0,21,120),
 (0,22,115),
 (0,23,90),
 (0,24,100),
 (0,25,100),
 (0,26,110),
 (0,27,90),
 (0,28,85),
 (0,29,100),
 (0,30,150),
 (0,31,150),
 (0,32,130),
 (0,33,135),
 (0,34,140),
 (0,35,130),
 (0,36,120),
 (0,37,135),
 (0,38,130),
 (0,39,135),
 (0,40,125),
 (0,41,125),
 (0,42,115),
 (0,43,110),
 (0,44,135),
 (0,45,110),
 (0,46,90),
 (0,47,80),
 (0,48,85),
 (0,49,90),
 (0,50,80),
 (0,51,80),
 (0,52,70),
 (0,53,70),
 (0,54,80),
 (0,55,65),
 (0,56,65),
 (0,57,75),
 (0,58,75),
 (0,59,75),
 (0,61,150),
 (0,62,140),
 (0,63,115),
 (0,64,115),
 (0,65,110),
 (0,66,115),
 (0,67,130),
 (0,68,120),
 (0,69,120),
 (0,70,140),
 (0,71,125),
 (0,72,135),
 (0,73,125),
 (0,74,125);
INSERT INTO `tournament_players` (`tournament_id`,`player_id`,`player_value`) VALUES 
 (0,75,125),
 (0,76,140),
 (0,77,135),
 (0,78,125),
 (0,79,110),
 (0,80,135),
 (0,81,130),
 (0,82,135),
 (0,83,100),
 (0,84,100),
 (0,85,125),
 (0,86,110),
 (0,87,115),
 (0,88,130),
 (0,89,125),
 (0,90,130),
 (0,91,150),
 (0,92,110),
 (0,93,100),
 (0,94,135),
 (0,95,135),
 (0,96,135),
 (0,97,140),
 (0,98,130),
 (0,99,120),
 (0,100,110),
 (0,101,100),
 (0,102,120),
 (0,103,120),
 (0,104,120),
 (0,105,125),
 (0,106,140),
 (0,107,145),
 (0,108,140),
 (0,109,140),
 (0,110,135),
 (0,111,130),
 (0,112,115),
 (0,113,120),
 (0,114,140),
 (0,115,135),
 (0,116,110),
 (0,117,110),
 (0,118,125),
 (0,119,130),
 (0,120,120),
 (0,121,140),
 (0,122,130),
 (0,123,140),
 (0,124,125),
 (0,125,120),
 (0,126,125),
 (0,127,145),
 (0,128,110),
 (0,129,115),
 (0,130,125),
 (0,131,140),
 (0,132,135),
 (0,133,110),
 (0,134,110),
 (0,135,135),
 (0,136,145),
 (0,137,120),
 (0,138,120),
 (0,139,135),
 (0,140,125),
 (0,141,140),
 (0,142,100),
 (0,143,110);
INSERT INTO `tournament_players` (`tournament_id`,`player_id`,`player_value`) VALUES 
 (0,144,110),
 (0,145,125),
 (0,146,130),
 (0,147,100),
 (0,148,110),
 (0,149,110),
 (0,150,115),
 (0,151,100),
 (0,152,80),
 (0,153,80),
 (0,154,85),
 (0,155,80),
 (0,156,70),
 (0,157,65),
 (0,158,65),
 (0,159,85),
 (0,160,75),
 (0,161,75),
 (0,162,70),
 (0,163,70),
 (0,164,80),
 (0,165,75),
 (0,166,115),
 (0,167,110),
 (0,168,70),
 (0,169,70),
 (0,170,80),
 (0,171,80),
 (0,172,80),
 (0,173,80),
 (0,174,80),
 (0,175,75),
 (0,176,75),
 (0,177,70),
 (0,178,80),
 (0,179,80),
 (0,180,60),
 (0,181,110),
 (0,182,100),
 (0,183,90),
 (0,184,70),
 (0,185,90),
 (0,186,80),
 (0,187,80),
 (0,188,80),
 (0,189,90),
 (0,190,90),
 (0,191,80),
 (0,192,70),
 (0,193,60),
 (0,194,70),
 (0,195,70),
 (0,196,100),
 (0,197,90),
 (0,198,90),
 (0,199,100),
 (0,200,65),
 (0,201,75),
 (0,202,65),
 (0,203,65),
 (0,204,70),
 (0,205,90),
 (0,206,80),
 (0,207,70),
 (0,208,70),
 (0,209,65),
 (0,210,75),
 (0,211,80),
 (0,212,60),
 (0,213,70),
 (0,214,90);
INSERT INTO `tournament_players` (`tournament_id`,`player_id`,`player_value`) VALUES 
 (0,215,80),
 (0,216,70),
 (0,217,60),
 (0,218,90),
 (0,219,80),
 (0,220,70),
 (0,221,70),
 (0,222,70),
 (0,223,95),
 (0,224,75),
 (0,225,75),
 (0,226,100),
 (0,227,100),
 (0,228,80),
 (0,229,90),
 (0,230,85),
 (0,231,65),
 (0,232,70),
 (0,233,70),
 (0,234,70),
 (0,235,80),
 (0,236,75),
 (0,237,75),
 (0,238,65),
 (0,239,70),
 (0,240,70);
/*!40000 ALTER TABLE `tournament_players` ENABLE KEYS */;


--
-- Definition of table `tournaments`
--

DROP TABLE IF EXISTS `tournaments`;
CREATE TABLE `tournaments` (
  `tournament_id` int(10) unsigned NOT NULL default '0',
  `tournament_name` varchar(128) NOT NULL default '""',
  `tournament_description` varchar(255) default '""',
  `tournament_status` varchar(20) NOT NULL default '""',
  `current_stage` smallint(5) unsigned NOT NULL default '0',
  `tournament_value` smallint(6) unsigned NOT NULL default '0',
  `next_effective_date` datetime NOT NULL,
  `last_points_updated_date` datetime default NULL,
  PRIMARY KEY  (`tournament_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournaments`
--

/*!40000 ALTER TABLE `tournaments` DISABLE KEYS */;
INSERT INTO `tournaments` (`tournament_id`,`tournament_name`,`tournament_description`,`tournament_status`,`current_stage`,`tournament_value`,`next_effective_date`,`last_points_updated_date`) VALUES 
 (0,'WORLD CUP 2007','World Cup 2007 West Indies','4',1,1400,'2007-03-27 00:00:00','2007-03-25 00:00:00');
/*!40000 ALTER TABLE `tournaments` ENABLE KEYS */;


--
-- Definition of table `user_authentication`
--

DROP TABLE IF EXISTS `user_authentication`;
CREATE TABLE `user_authentication` (
  `user_id` smallint(6) unsigned NOT NULL default '0',
  `user_name` varchar(128) NOT NULL default '""',
  `password` varchar(20) NOT NULL default '""',
  `user_type` varchar(20) NOT NULL default 'PLAYER',
  `description` varchar(45) NOT NULL,
  `login_name` varchar(45) NOT NULL,
  `default_user_team` varchar(45) default NULL,
  `default_tournament` varchar(45) default NULL,
  `email` varchar(100) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_authentication`
--

/*!40000 ALTER TABLE `user_authentication` DISABLE KEYS */;
INSERT INTO `user_authentication` (`user_id`,`user_name`,`password`,`user_type`,`description`,`login_name`,`default_user_team`,`default_tournament`,`email`) VALUES 
 (1,'amol','ll4n\\GfYMQUxA','player','','amol.pisal',NULL,NULL,'amol.pisal@yahoo.com'),
 (31,'Manoj Samudra','lljKXa3EbU4Sk','player','','manoj.samudra','The Mavericks',NULL,'manoj.samudra@trigyn.com'),
 (106,'Dhanesh yadav','llITapzkidyuo','player','','dhanesh.yadav@trigyn.com','Dhanesh yadav',NULL,'yadav22_miet@rediffmail.com'),
 (223,'Gaurang','llyfzwc.0b1BA','player','','gaurang_99','Fantastic Eleven',NULL,'gaurang.vyas@trigyn.com'),
 (239,'shweta','llPgb42o4a8GU','player','PM','shweta vyas','Myteam11',NULL,'shweta.vyas@trigyn.com'),
 (242,'Jatan Porecha','llWr658vNqnLI','player','','jatanp','JP_SUP_8_11',NULL,'jatan.porecha@trigyn.com'),
 (261,'Narendra','llvcpxXrMlm0Q','player','SYS ADMIN','narendrag','NARU',NULL,'narendra.gaware@trigyn.com'),
 (369,'Ashwin','llqn4zlVdLeds','player','I LUV CRICKET','ashwin.utagikar','ashwin11',NULL,'ashwin.utagikar@trigyn.com'),
 (561,'Prashant Tulapurkar','llD\\wmHhqZKU2','player','','ptulapurkar','Myteam2',NULL,'prashant.tulapurkar@trigyn.com');
INSERT INTO `user_authentication` (`user_id`,`user_name`,`password`,`user_type`,`description`,`login_name`,`default_user_team`,`default_tournament`,`email`) VALUES 
 (691,'Nurul Siddik','llN.jMhuoYmr6','admin','Mein hoon naa','narul.siddik','WILLOW XI',NULL,'narul.siddik@trigyn.com'),
 (714,'Hemant','llS8mDGRzFosA','player','Hi ha ha','hemantvb','Hemant\'s Team',NULL,'hemantvb@gmail.com'),
 (757,'amit','llREJa8IkLKzc','player','i m the BEST','amit.shedge@trigyn.com','The Rock',NULL,'amit.shedge@trigyn.com'),
 (781,'Abhi','llvofAF1OZsAU','player','','Abhi_Rules','Maratha Warriaers',NULL,'abhishek.vichare@trigyn.com'),
 (783,'Amit shedge','llQCBxO4.89io','player','jo jita wahi sikander','Super_Boy','Super_Boy',NULL,'amit.sawant@trigyn.com'),
 (784,'prasad','llInBoCmaued2','player','rx100 the Great................','prasad.mondkar','rx100',NULL,'prasadm83@gmail.com'),
 (790,'Shailesh','llorCIQ7VHNb2','player','Taari karu kay usaki jisane Muze banaya','Poyekar','Gravity',NULL,'poyekar@gmail.com'),
 (798,'Raj','llOn0c38R5hVQ','player','','Raj',NULL,NULL,'rajendra.phalke@trigyn.com');
INSERT INTO `user_authentication` (`user_id`,`user_name`,`password`,`user_type`,`description`,`login_name`,`default_user_team`,`default_tournament`,`email`) VALUES 
 (799,'Sushilkumar Pandey','llcjJHTQ0XRIs','player','','sushilkumar.pandey','MyTeam-Sushil',NULL,'sushilkumar.pandey@trigyn.com'),
 (804,'yogesh','ll865wjxaZ4Jg','player','Bond...James bond...','yogesh.jamkhindikar','Bond 11',NULL,'yogesh_jam@rediffmail.com'),
 (810,'Gayathri','llHLLM0BGXGs.','player','','gayathri.mohan','GM-11',NULL,'gayathri_m_in@yahoo.com'),
 (811,'Santosh Kumar','ll4tmOYN4H1Vs','player','','santosh.kumar','Daku\'s Eleven',NULL,'santosh.kumar@trigyn.com'),
 (816,'Hira','llR\\PUB1HQgCg','player','','Hira.kanal','Hira',NULL,'hiranand.kanal@trigyn.com'),
 (824,'Vivek','lldtyQXj7Ti9Y','player','Vivek\'s Team','Vivek','My Team',NULL,'vivek.kedare@trigyn.com'),
 (983,'Shamsher Khan','llu4C26HS4fLU','player','every ball goes to boundary line when i ball','shamsher.khan',NULL,NULL,'shamsher.khan@trigyn.com'),
 (1008,'Naresh','llkrkCffhRgzA','player','batsman','Naresh','Naresh 2007',NULL,'naresh.mumbai@yahoo.com'),
 (1057,'Jayesh Mehta','llGN58\\JyBHDw','player',':)','Jayesh.Mehta','India1',NULL,'jayesh.mehta@trigyn.com');
INSERT INTO `user_authentication` (`user_id`,`user_name`,`password`,`user_type`,`description`,`login_name`,`default_user_team`,`default_tournament`,`email`) VALUES 
 (1060,'samual','ller3cZ.TBrck','player','','samual.almeida','sam',NULL,'samual97@rediffmail.com'),
 (1062,'Nagaraju','ll.njDNjWUFbE','player','Raj','nagaraju.merugu','Lotus',NULL,'nagaraju.merugu@trigyn.com'),
 (5143,'pushkar','llkZ4DnH6CBcU','player','tarif k kabil nahi','push.prabhu','Push\'s 11',NULL,'pushkar.prabhu@trigyn.com'),
 (5145,'deep mayekar','llxat7wWtLzz.','player','','deep.mayekar','Best Of 2007',NULL,'deep.mayekar@trigyn.com'),
 (9000,'dharmesh','ll\\1rQfvb9fyw','player','Normally, Sachin and Rahul get my advice.','dharmesh','dharmesh',NULL,'gujjuboy@gmail.com'),
 (9001,'Raj Alexandar','llOn0c38R5hVQ','player','','raj.alexandar','WC Superstars',NULL,'raj.alex@gmail.com'),
 (9002,'Gopal Shah','llBLtTjkP5YmQ','player','','gopal.shah',NULL,NULL,'shahgopal75@yahoo.com'),
 (9003,'ashish','llnrstCUfX3Gk','player','meri taarif jaanke kyaa karoge','devilseye007','destroyers',NULL,'ashh12345@yahoo.com'),
 (9015,'I am','ll3u.8maCqssU','player','Great','me.me',NULL,NULL,'new@new.com');
INSERT INTO `user_authentication` (`user_id`,`user_name`,`password`,`user_type`,`description`,`login_name`,`default_user_team`,`default_tournament`,`email`) VALUES 
 (9101,'hitesh','llE\\\\cJD8Ot.o','player','kuch bhi nahi','hitesh.rathod','indiabest',NULL,'pintu.rathod@gmail.com'),
 (9966,'vipul','llf.u00GcFqNo','player','cricket master','vipul.varshney','Vipul Varshney',NULL,'varshney.vipul@gmail.com'),
 (9995,'testing','ll3u.8maCqssU','player','','test.user',NULL,NULL,'new@new.com'),
 (9999,'Sandeep','llyyb8prSD8W2','player','','Sandeep','SandyXI',NULL,'sandeep_mehta78@yahoo.com');
/*!40000 ALTER TABLE `user_authentication` ENABLE KEYS */;


--
-- Definition of table `user_team`
--

DROP TABLE IF EXISTS `user_team`;
CREATE TABLE `user_team` (
  `user_team_id` varchar(30) NOT NULL default '""',
  `user_id` smallint(6) default NULL,
  `tournament_id` smallint(6) default NULL,
  `user_team_points` smallint(6) default NULL,
  `user_team_descr` varchar(45) default NULL,
  `number_of_changes` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_team`
--

/*!40000 ALTER TABLE `user_team` DISABLE KEYS */;
INSERT INTO `user_team` (`user_team_id`,`user_id`,`tournament_id`,`user_team_points`,`user_team_descr`,`number_of_changes`) VALUES 
 ('ashwin11',369,0,0,'BEST OF WC',11),
 ('Best Of 2007',5145,0,0,'',11),
 ('Bond 11',804,0,0,'',0),
 ('Daku\'s Eleven',811,0,0,'',0),
 ('Dazzling Eleven',223,0,0,'',0),
 ('destroyers',9003,0,0,'The greatest team the world has ever see',0),
 ('Dhanesh',106,0,0,'',11),
 ('Dhanesh yadav',106,0,0,'',11),
 ('dharmesh',9000,0,0,'dharmesh team',0),
 ('dharmshXI',9000,0,0,'dharmesh elevan',0),
 ('Fantastic Eleven',223,0,0,'',0),
 ('GM-11',810,0,0,'',0),
 ('Gopals',9001,0,0,'',0),
 ('Gravity',790,0,0,'Stay on Earth',0),
 ('Great India',790,0,0,'Love India Proud India',0),
 ('Greate India',790,0,0,'Love India Proud India',0),
 ('Hemant\'s SA-EN-NZ',714,0,0,'Hemant\'s Team for SA-EN-NZ',0),
 ('Hemant\'s Team',714,0,0,'My Team',11),
 ('Hira',816,0,0,'',11),
 ('India1',1057,0,0,'India1',0),
 ('indiabest',9101,0,0,'',9),
 ('JP-11',242,0,0,'JP\'S 11',0),
 ('JP_SUP_8_11',242,0,0,'JP_SUP_8_11',0),
 ('Lotus',1062,0,0,'Nothing offical about it',8);
INSERT INTO `user_team` (`user_team_id`,`user_id`,`tournament_id`,`user_team_points`,`user_team_descr`,`number_of_changes`) VALUES 
 ('Maratha Warriaers',781,0,0,'Maratha Marta Hai ya Marta Hai ',0),
 ('Movers n Shakers',31,0,0,'',0),
 ('My Team',824,0,0,'My Team',0),
 ('myteam',561,0,0,'',0),
 ('MyTeam-Sushil',799,0,0,'MyTeam-Sushil',0),
 ('Myteam11',239,0,0,'s',0),
 ('Myteam2',561,0,0,'',0),
 ('Naresh 2007',1008,0,0,'',0),
 ('NARU',261,0,0,'',0),
 ('Push\'s 11',5143,0,0,'meri wali team',0),
 ('rx100',784,0,0,'we r the best',10),
 ('sam',1060,0,0,'',11),
 ('SAM\'s',811,0,0,'',0),
 ('SandyXI',9999,0,0,'',0),
 ('Super_Boy',783,0,0,'jo jita wahi sikander',0),
 ('The Mavericks',31,0,0,'',9),
 ('The Rock',757,0,0,'if u smell ,whats the rock is cooking',0),
 ('Vipul Varshney',9966,0,0,'Best time',0),
 ('WC Superstars',9001,0,0,'',0),
 ('WILLOW XI',691,0,0,'My team',0),
 ('world 11',9001,0,0,'',0);
/*!40000 ALTER TABLE `user_team` ENABLE KEYS */;


--
-- Definition of table `user_team_details`
--

DROP TABLE IF EXISTS `user_team_details`;
CREATE TABLE `user_team_details` (
  `user_team_id` varchar(40) NOT NULL default '""',
  `player1` int(11) default NULL,
  `player2` int(11) default NULL,
  `player3` int(11) default NULL,
  `player4` int(11) default NULL,
  `player5` int(11) default NULL,
  `player6` int(11) default NULL,
  `player7` int(11) default NULL,
  `player8` int(11) default NULL,
  `player9` int(11) default NULL,
  `player10` int(11) default NULL,
  `player11` int(11) default NULL,
  `effective_date` datetime NOT NULL default '1900-01-01 00:00:00',
  `number_of_changes` int(10) unsigned NOT NULL default '0',
  `team_points` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_team_id`,`effective_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_team_details`
--

/*!40000 ALTER TABLE `user_team_details` DISABLE KEYS */;
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('ashwin11',123,45,199,159,198,155,132,131,53,196,151,'2007-03-15 00:00:00',0,501),
 ('ashwin11',78,98,106,218,82,224,220,87,102,114,212,'2007-03-16 00:00:00',11,232),
 ('ashwin11',78,98,106,218,82,224,220,87,102,114,212,'2007-03-17 00:00:00',0,0),
 ('ashwin11',186,88,0,218,12,223,3,87,221,1,192,'2007-03-18 00:00:00',9,296),
 ('ashwin11',34,136,139,156,141,155,144,38,143,162,52,'2007-03-19 00:00:00',11,326),
 ('ashwin11',106,240,171,91,109,104,176,114,97,174,238,'2007-03-20 00:00:00',11,388),
 ('ashwin11',106,240,171,91,109,104,176,114,97,174,238,'2007-03-21 00:00:00',0,0),
 ('ashwin11',106,240,171,91,109,104,176,114,97,174,238,'2007-03-22 00:00:00',0,140),
 ('ashwin11',199,34,121,148,138,210,207,130,209,143,37,'2007-03-23 00:00:00',11,311),
 ('ashwin11',199,34,121,148,138,210,207,130,209,143,37,'2007-03-24 00:00:00',0,0),
 ('ashwin11',199,34,121,148,138,210,207,130,209,143,37,'2007-03-25 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('ashwin11',199,34,121,148,138,210,207,130,209,143,37,'2007-03-27 00:00:00',0,0),
 ('Best Of 2007',0,5,171,233,6,12,239,10,169,187,228,'2007-03-14 00:00:00',0,400),
 ('Best Of 2007',0,5,134,233,6,154,132,135,152,151,53,'2007-03-15 00:00:00',7,302),
 ('Best Of 2007',0,5,107,222,83,104,95,114,221,217,212,'2007-03-16 00:00:00',9,280),
 ('Best Of 2007',31,5,43,222,83,104,33,37,29,203,204,'2007-03-17 00:00:00',7,81),
 ('Best Of 2007',31,5,43,222,83,104,33,37,29,203,204,'2007-03-18 00:00:00',0,152),
 ('Best Of 2007',31,5,43,222,83,104,33,37,29,203,204,'2007-03-19 00:00:00',0,188),
 ('Best Of 2007',5,230,117,171,109,104,115,238,108,100,168,'2007-03-20 00:00:00',9,168),
 ('Best Of 2007',134,121,19,163,74,18,132,135,25,160,152,'2007-03-21 00:00:00',11,395),
 ('Best Of 2007',105,91,98,183,104,188,95,100,92,238,187,'2007-03-22 00:00:00',11,402),
 ('Best Of 2007',43,31,206,147,138,40,33,39,128,202,204,'2007-03-23 00:00:00',11,216);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Best Of 2007',43,31,206,147,138,40,33,39,128,202,204,'2007-03-24 00:00:00',0,0),
 ('Best Of 2007',43,31,206,147,138,40,33,39,128,202,204,'2007-03-25 00:00:00',0,0),
 ('Best Of 2007',43,31,206,147,138,40,33,39,128,202,204,'2007-03-27 00:00:00',0,0),
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-16 00:00:00',0,105),
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-17 00:00:00',0,295),
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-18 00:00:00',0,85),
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-19 00:00:00',0,26),
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-20 00:00:00',0,40),
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-21 00:00:00',0,323),
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-22 00:00:00',0,63),
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-23 00:00:00',0,70);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-24 00:00:00',0,43),
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-25 00:00:00',0,43),
 ('Bond 11',21,66,78,28,104,198,23,11,39,238,64,'2007-03-27 00:00:00',0,0),
 ('Daku\'s Eleven',2,5,8,139,12,14,144,143,140,137,10,'2007-03-27 00:00:00',0,0),
 ('Dazzling Eleven',62,49,69,193,141,72,67,73,52,143,53,'2007-03-13 00:00:00',0,153),
 ('Dazzling Eleven',5,0,171,193,6,190,4,10,9,13,180,'2007-03-14 00:00:00',10,430),
 ('Dazzling Eleven',163,134,127,159,154,198,132,130,135,151,161,'2007-03-15 00:00:00',11,524),
 ('Dazzling Eleven',78,80,105,103,214,104,220,212,120,92,27,'2007-03-16 00:00:00',11,166),
 ('Dazzling Eleven',34,43,41,69,20,198,23,27,29,71,65,'2007-03-17 00:00:00',10,484),
 ('Dazzling Eleven',183,5,90,78,14,56,3,13,89,184,213,'2007-03-18 00:00:00',11,336),
 ('Dazzling Eleven',34,31,163,43,138,141,33,52,53,160,150,'2007-03-19 00:00:00',11,450);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Dazzling Eleven',105,103,118,106,166,229,172,180,92,100,116,'2007-03-20 00:00:00',11,421),
 ('Dazzling Eleven',16,134,133,159,20,154,132,22,129,73,160,'2007-03-21 00:00:00',11,450),
 ('Dazzling Eleven',105,133,134,230,224,229,132,100,97,129,189,'2007-03-22 00:00:00',7,184),
 ('Dazzling Eleven',34,133,134,206,56,198,132,97,129,130,197,'2007-03-23 00:00:00',6,323),
 ('Dazzling Eleven',34,133,134,206,56,198,132,108,129,130,197,'2007-03-24 00:00:00',1,33),
 ('Dazzling Eleven',34,133,134,206,56,198,132,108,129,130,197,'2007-03-25 00:00:00',0,23),
 ('Dazzling Eleven',139,0,5,2,12,7,3,150,11,13,202,'2007-03-27 00:00:00',0,0),
 ('destroyers',0,24,178,165,7,96,3,11,97,180,217,'2007-03-21 00:00:00',0,42),
 ('destroyers',91,181,183,240,96,190,95,94,97,184,238,'2007-03-22 00:00:00',9,500),
 ('destroyers',127,34,208,205,141,198,132,131,202,150,209,'2007-03-23 00:00:00',11,361);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('destroyers',0,178,88,171,6,167,3,11,169,174,175,'2007-03-24 00:00:00',11,357),
 ('destroyers',28,21,16,49,20,50,46,53,25,22,27,'2007-03-25 00:00:00',11,272),
 ('destroyers',0,136,146,148,7,138,3,11,143,150,13,'2007-03-27 00:00:00',0,0),
 ('Dhanesh',78,107,103,216,82,109,220,94,108,212,217,'2007-03-16 00:00:00',0,289),
 ('Dhanesh',78,107,103,216,82,109,220,94,108,212,217,'2007-03-17 00:00:00',0,0),
 ('Dhanesh',78,107,103,216,82,109,220,94,108,212,217,'2007-03-18 00:00:00',0,54),
 ('Dhanesh',78,107,103,216,82,109,220,94,108,212,217,'2007-03-19 00:00:00',0,0),
 ('Dhanesh',99,107,178,227,104,109,176,97,108,168,169,'2007-03-20 00:00:00',8,266),
 ('Dhanesh',121,133,21,28,74,153,164,131,64,22,27,'2007-03-21 00:00:00',11,365),
 ('Dhanesh',99,103,105,227,96,104,220,94,97,184,212,'2007-03-22 00:00:00',11,410),
 ('Dhanesh',31,44,146,201,141,210,33,131,197,202,203,'2007-03-23 00:00:00',11,366);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Dhanesh',31,44,146,201,141,210,33,131,197,202,203,'2007-03-24 00:00:00',0,0),
 ('Dhanesh',31,44,146,201,141,210,33,131,197,202,203,'2007-03-25 00:00:00',0,0),
 ('Dhanesh',31,44,146,201,141,210,33,131,197,202,203,'2007-03-27 00:00:00',0,0),
 ('Dhanesh yadav',105,107,117,216,82,109,239,94,108,212,213,'2007-03-16 00:00:00',0,312),
 ('Dhanesh yadav',105,107,117,216,82,109,239,94,108,212,213,'2007-03-17 00:00:00',0,0),
 ('Dhanesh yadav',105,107,117,216,82,109,239,94,108,212,213,'2007-03-18 00:00:00',0,65),
 ('Dhanesh yadav',105,107,117,216,82,109,239,94,108,212,213,'2007-03-19 00:00:00',0,0),
 ('Dhanesh yadav',105,107,117,171,109,226,176,97,108,168,169,'2007-03-20 00:00:00',6,107),
 ('Dhanesh yadav',69,70,127,134,20,153,23,22,27,135,160,'2007-03-21 00:00:00',11,352),
 ('Dhanesh yadav',91,98,99,230,104,226,220,94,97,189,212,'2007-03-22 00:00:00',11,248),
 ('Dhanesh yadav',127,133,139,205,145,210,132,37,150,202,204,'2007-03-23 00:00:00',11,439);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Dhanesh yadav',127,133,139,205,145,210,132,37,150,202,204,'2007-03-24 00:00:00',0,0),
 ('Dhanesh yadav',127,133,139,205,145,210,132,37,150,202,204,'2007-03-25 00:00:00',0,0),
 ('Dhanesh yadav',127,133,139,205,145,210,132,37,150,202,204,'2007-03-27 00:00:00',0,0),
 ('dharmesh',43,80,156,171,138,104,132,37,1,184,151,'2007-03-13 00:00:00',0,112),
 ('dharmesh',16,134,57,171,7,14,132,1,135,184,196,'2007-03-14 00:00:00',7,124),
 ('dharmesh',45,57,134,127,154,198,132,151,135,52,196,'2007-03-15 00:00:00',6,324),
 ('dharmesh',80,105,211,99,214,113,86,212,100,84,114,'2007-03-16 00:00:00',11,273),
 ('dharmesh',80,105,211,99,214,113,86,212,100,84,114,'2007-03-17 00:00:00',0,0),
 ('dharmesh',80,105,211,99,214,113,86,212,100,84,114,'2007-03-18 00:00:00',0,187),
 ('dharmesh',80,105,211,99,214,113,86,212,100,84,114,'2007-03-19 00:00:00',0,0),
 ('dharmesh',118,99,105,98,113,226,172,168,100,114,228,'2007-03-20 00:00:00',6,403);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('dharmesh',134,127,28,66,154,20,23,151,130,129,64,'2007-03-21 00:00:00',11,707),
 ('dharmesh',91,98,105,211,104,229,239,100,102,213,228,'2007-03-22 00:00:00',11,363),
 ('dharmesh',41,43,134,148,138,198,207,37,130,150,202,'2007-03-23 00:00:00',11,379),
 ('dharmesh',41,43,134,148,138,198,207,37,130,150,202,'2007-03-24 00:00:00',0,0),
 ('dharmesh',41,43,134,148,138,198,207,37,130,150,202,'2007-03-25 00:00:00',0,0),
 ('dharmesh',141,0,2,148,138,6,3,150,13,1,143,'2007-03-27 00:00:00',0,0),
 ('dharmshXI',80,211,106,99,83,104,86,100,114,219,217,'2007-03-16 00:00:00',0,412),
 ('dharmshXI',80,211,106,99,83,104,86,100,114,219,217,'2007-03-17 00:00:00',0,0),
 ('dharmshXI',80,211,106,99,83,104,86,100,114,219,217,'2007-03-18 00:00:00',0,196),
 ('dharmshXI',80,211,106,99,83,104,86,100,114,219,217,'2007-03-19 00:00:00',0,0),
 ('dharmshXI',171,99,106,233,96,104,115,100,114,228,169,'2007-03-20 00:00:00',6,448);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('dharmshXI',133,156,69,16,153,20,67,131,63,152,135,'2007-03-21 00:00:00',11,254),
 ('dharmshXI',98,218,227,235,96,104,95,94,215,228,236,'2007-03-22 00:00:00',11,452),
 ('dharmshXI',127,44,122,148,145,198,33,129,202,204,203,'2007-03-23 00:00:00',11,178),
 ('dharmshXI',127,44,122,148,145,198,33,129,202,204,203,'2007-03-24 00:00:00',0,0),
 ('dharmshXI',127,44,122,148,145,198,33,129,202,204,203,'2007-03-25 00:00:00',0,0),
 ('dharmshXI',136,0,8,148,145,7,144,137,1,11,143,'2007-03-27 00:00:00',0,0),
 ('Fantastic Eleven',181,45,70,139,50,74,182,71,65,195,53,'2007-03-13 00:00:00',0,260),
 ('Fantastic Eleven',45,2,8,181,166,167,182,9,1,168,195,'2007-03-14 00:00:00',7,235),
 ('Fantastic Eleven',134,127,45,121,58,210,132,53,130,131,52,'2007-03-15 00:00:00',10,491),
 ('Fantastic Eleven',106,107,76,88,82,224,86,213,221,53,92,'2007-03-16 00:00:00',10,414),
 ('Fantastic Eleven',24,34,43,62,20,198,23,37,197,29,25,'2007-03-17 00:00:00',11,493);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Fantastic Eleven',5,216,90,78,190,224,220,11,13,89,87,'2007-03-18 00:00:00',11,423),
 ('Fantastic Eleven',31,34,43,159,154,54,164,150,137,37,152,'2007-03-19 00:00:00',11,438),
 ('Fantastic Eleven',230,171,99,237,166,229,172,108,114,94,97,'2007-03-20 00:00:00',11,357),
 ('Fantastic Eleven',15,19,127,121,20,17,23,27,129,160,152,'2007-03-21 00:00:00',11,456),
 ('Fantastic Eleven',105,218,121,127,104,96,239,228,129,213,184,'2007-03-22 00:00:00',8,373),
 ('Fantastic Eleven',34,121,127,200,141,198,207,129,37,202,209,'2007-03-23 00:00:00',8,280),
 ('Fantastic Eleven',34,121,127,200,113,82,207,37,129,202,209,'2007-03-24 00:00:00',2,53),
 ('Fantastic Eleven',34,121,127,200,113,82,207,37,129,202,209,'2007-03-25 00:00:00',0,0),
 ('Fantastic Eleven',141,139,5,0,7,12,3,150,137,11,209,'2007-03-27 00:00:00',0,0),
 ('Gopals',134,88,133,149,7,104,86,202,130,137,203,'2007-03-25 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Gopals',134,88,133,149,7,104,86,202,130,137,203,'2007-03-27 00:00:00',0,0),
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-16 00:00:00',0,220),
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-17 00:00:00',0,0),
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-18 00:00:00',0,276),
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-19 00:00:00',0,0),
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-20 00:00:00',0,0),
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-21 00:00:00',0,0),
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-22 00:00:00',0,125),
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-23 00:00:00',0,0),
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-24 00:00:00',0,166),
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-25 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Gravity',80,211,216,222,83,224,86,84,89,93,92,'2007-03-27 00:00:00',0,0),
 ('Hemant\'s SA-EN-NZ',225,78,218,99,109,82,95,114,213,100,212,'2007-03-16 00:00:00',0,325),
 ('Hemant\'s SA-EN-NZ',225,78,218,99,109,82,95,114,213,100,212,'2007-03-17 00:00:00',0,0),
 ('Hemant\'s SA-EN-NZ',225,78,218,99,109,82,95,114,213,100,212,'2007-03-18 00:00:00',0,134),
 ('Hemant\'s SA-EN-NZ',78,99,218,225,82,109,95,100,114,212,213,'2007-03-19 00:00:00',0,0),
 ('Hemant\'s SA-EN-NZ',78,99,218,225,82,109,95,100,114,212,213,'2007-03-20 00:00:00',0,191),
 ('Hemant\'s SA-EN-NZ',78,99,218,225,82,109,95,100,114,212,213,'2007-03-21 00:00:00',0,0),
 ('Hemant\'s SA-EN-NZ',78,99,218,225,82,109,95,100,114,212,213,'2007-03-22 00:00:00',0,148),
 ('Hemant\'s SA-EN-NZ',78,99,218,225,82,109,95,100,114,212,213,'2007-03-23 00:00:00',0,0),
 ('Hemant\'s SA-EN-NZ',78,99,218,225,82,109,95,100,114,212,213,'2007-03-24 00:00:00',0,160);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Hemant\'s SA-EN-NZ',78,99,218,225,82,109,95,100,114,212,213,'2007-03-25 00:00:00',0,0),
 ('Hemant\'s SA-EN-NZ',78,99,218,225,82,109,95,100,114,212,213,'2007-03-27 00:00:00',0,0),
 ('Hemant\'s Team',0,2,170,177,6,231,4,1,9,13,236,'2007-03-14 00:00:00',0,390),
 ('Hemant\'s Team',0,2,170,177,6,231,4,1,9,13,236,'2007-03-15 00:00:00',0,0),
 ('Hemant\'s Team',0,2,170,177,6,231,4,1,9,13,236,'2007-03-16 00:00:00',0,0),
 ('Hemant\'s Team',0,2,170,177,6,231,4,1,9,13,236,'2007-03-17 00:00:00',0,0),
 ('Hemant\'s Team',0,2,170,177,6,231,4,1,9,13,236,'2007-03-18 00:00:00',0,374),
 ('Hemant\'s Team',0,2,170,177,6,231,4,1,9,13,236,'2007-03-19 00:00:00',0,0),
 ('Hemant\'s Team',0,2,170,177,6,231,4,1,9,13,236,'2007-03-20 00:00:00',0,73),
 ('Hemant\'s Team',0,2,170,177,6,231,4,1,9,13,236,'2007-03-21 00:00:00',0,0),
 ('Hemant\'s Team',0,2,170,177,6,231,4,1,9,13,236,'2007-03-22 00:00:00',0,7);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Hemant\'s Team',44,201,34,127,40,210,125,204,135,143,209,'2007-03-23 00:00:00',11,292),
 ('Hemant\'s Team',44,201,34,127,40,210,125,204,135,143,209,'2007-03-24 00:00:00',0,0),
 ('Hemant\'s Team',44,201,34,127,40,210,125,204,135,143,209,'2007-03-25 00:00:00',0,0),
 ('Hemant\'s Team',44,201,34,127,40,210,125,204,135,143,209,'2007-03-27 00:00:00',0,0),
 ('Hira',5,173,8,183,12,14,3,9,238,228,232,'2007-03-14 00:00:00',0,264),
 ('Hira',122,55,127,134,54,48,132,131,129,130,53,'2007-03-15 00:00:00',11,548),
 ('Hira',122,55,127,134,54,48,132,131,129,130,53,'2007-03-16 00:00:00',0,0),
 ('Hira',122,55,127,134,54,48,132,131,129,130,53,'2007-03-17 00:00:00',0,0),
 ('Hira',122,55,127,134,54,48,132,131,129,130,53,'2007-03-18 00:00:00',0,0),
 ('Hira',122,55,127,134,54,48,132,131,129,130,53,'2007-03-19 00:00:00',0,51),
 ('Hira',171,98,177,106,109,231,115,120,236,94,174,'2007-03-20 00:00:00',11,423);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Hira',134,127,66,28,154,20,132,130,64,27,152,'2007-03-21 00:00:00',11,862),
 ('Hira',240,194,99,98,104,96,95,238,189,100,97,'2007-03-22 00:00:00',11,246),
 ('Hira',206,44,133,41,198,210,132,32,130,203,38,'2007-03-23 00:00:00',11,291),
 ('Hira',206,44,133,41,198,210,132,32,130,203,38,'2007-03-24 00:00:00',0,0),
 ('Hira',206,44,133,41,198,210,132,32,130,203,38,'2007-03-25 00:00:00',0,0),
 ('Hira',206,44,133,41,198,210,132,32,130,203,38,'2007-03-27 00:00:00',0,0),
 ('indiabest',121,122,156,158,155,210,132,126,135,151,131,'2007-03-15 00:00:00',0,352),
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-16 00:00:00',9,34),
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-17 00:00:00',0,237),
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-18 00:00:00',0,27),
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-19 00:00:00',0,170);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-20 00:00:00',0,76),
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-21 00:00:00',0,38),
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-22 00:00:00',0,128),
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-23 00:00:00',0,133),
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-24 00:00:00',0,1),
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-25 00:00:00',0,38),
 ('indiabest',28,34,91,43,155,210,33,27,39,87,215,'2007-03-27 00:00:00',0,0),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-13 00:00:00',0,52),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-14 00:00:00',0,108),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-15 00:00:00',0,121),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-16 00:00:00',0,6);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-17 00:00:00',0,21),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-18 00:00:00',0,75),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-19 00:00:00',0,152),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-20 00:00:00',0,34),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-21 00:00:00',0,57),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-22 00:00:00',0,0),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-23 00:00:00',0,217),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-24 00:00:00',0,214),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-25 00:00:00',0,0),
 ('JP-11',5,122,156,171,82,210,33,38,131,180,143,'2007-03-27 00:00:00',0,0),
 ('JP_SUP_8_11',146,148,5,0,7,138,3,11,140,143,13,'2007-03-27 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Lotus',34,123,2,178,231,56,164,150,143,35,131,'2007-03-13 00:00:00',0,80),
 ('Lotus',2,5,123,178,56,231,164,35,131,10,9,'2007-03-14 00:00:00',3,166),
 ('Lotus',2,5,123,178,56,231,164,35,131,10,9,'2007-03-15 00:00:00',0,108),
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-16 00:00:00',8,201),
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-17 00:00:00',0,0),
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-18 00:00:00',0,60),
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-19 00:00:00',0,62),
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-20 00:00:00',0,275),
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-21 00:00:00',0,19),
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-22 00:00:00',0,104),
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-23 00:00:00',0,0),
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-24 00:00:00',0,155);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-25 00:00:00',0,23),
 ('Lotus',98,106,78,117,56,231,164,119,93,77,92,'2007-03-27 00:00:00',0,0),
 ('Maratha Warriaers',8,16,80,99,20,104,164,87,114,157,162,'2007-03-14 00:00:00',0,5),
 ('Maratha Warriaers',8,16,80,99,20,104,164,87,114,157,162,'2007-03-15 00:00:00',0,72),
 ('Maratha Warriaers',8,16,80,99,20,104,164,87,114,157,162,'2007-03-16 00:00:00',0,189),
 ('Maratha Warriaers',21,16,80,99,20,104,23,87,114,202,209,'2007-03-17 00:00:00',4,312),
 ('Maratha Warriaers',21,16,80,99,20,104,23,87,114,202,209,'2007-03-18 00:00:00',0,104),
 ('Maratha Warriaers',21,16,80,99,20,104,23,87,114,202,209,'2007-03-19 00:00:00',0,0),
 ('Maratha Warriaers',16,21,133,70,20,74,23,22,75,152,160,'2007-03-20 00:00:00',7,0),
 ('Maratha Warriaers',16,21,133,70,20,74,23,22,75,152,160,'2007-03-21 00:00:00',0,407),
 ('Maratha Warriaers',16,21,133,70,20,74,23,22,75,152,160,'2007-03-22 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Maratha Warriaers',44,41,31,199,145,210,33,143,202,129,209,'2007-03-23 00:00:00',11,278),
 ('Maratha Warriaers',2,0,8,178,167,166,86,169,174,180,11,'2007-03-24 00:00:00',11,447),
 ('Maratha Warriaers',2,0,8,178,167,166,86,169,174,180,11,'2007-03-25 00:00:00',0,0),
 ('Maratha Warriaers',0,2,5,148,7,138,3,1,11,143,150,'2007-03-27 00:00:00',0,0),
 ('Movers n Shakers',5,118,76,107,96,231,3,215,238,232,151,'2007-03-20 00:00:00',0,272),
 ('Movers n Shakers',5,118,76,107,96,231,3,215,238,232,151,'2007-03-21 00:00:00',0,10),
 ('Movers n Shakers',5,118,76,107,96,231,3,215,238,232,151,'2007-03-22 00:00:00',0,147),
 ('Movers n Shakers',5,118,76,107,96,231,3,215,238,232,151,'2007-03-23 00:00:00',0,0),
 ('Movers n Shakers',5,118,76,107,96,231,3,215,238,232,151,'2007-03-24 00:00:00',0,343),
 ('Movers n Shakers',5,118,76,107,96,231,3,215,238,232,151,'2007-03-25 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Movers n Shakers',5,118,76,107,96,231,3,215,238,232,151,'2007-03-27 00:00:00',0,0),
 ('My Team',0,2,5,181,179,188,3,13,174,189,228,'2007-03-14 00:00:00',0,412),
 ('My Team',0,45,123,127,58,56,207,196,52,131,135,'2007-03-15 00:00:00',10,191),
 ('My Team',78,88,106,107,104,224,220,97,215,87,212,'2007-03-16 00:00:00',11,466),
 ('My Team',30,206,199,15,20,40,33,25,26,65,209,'2007-03-17 00:00:00',11,409),
 ('My Team',0,80,199,206,142,83,3,13,25,65,209,'2007-03-18 00:00:00',6,278),
 ('My Team',34,136,199,206,142,141,33,25,35,157,209,'2007-03-19 00:00:00',6,252),
 ('My Team',106,107,199,206,96,109,239,97,100,232,209,'2007-03-20 00:00:00',8,305),
 ('My Team',208,121,134,206,17,20,132,73,25,129,65,'2007-03-21 00:00:00',10,320),
 ('My Team',98,134,206,44,231,96,239,97,94,189,100,'2007-03-22 00:00:00',9,193),
 ('My Team',43,44,121,134,141,198,207,129,130,196,209,'2007-03-23 00:00:00',9,261);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('My Team',80,88,178,2,82,83,3,87,175,169,174,'2007-03-24 00:00:00',11,503),
 ('My Team',49,21,15,178,17,20,23,22,169,25,53,'2007-03-25 00:00:00',9,289),
 ('My Team',0,2,136,141,7,138,3,11,13,143,209,'2007-03-27 00:00:00',0,0),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-13 00:00:00',0,248),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-14 00:00:00',0,0),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-15 00:00:00',0,0),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-16 00:00:00',0,0),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-17 00:00:00',0,104),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-18 00:00:00',0,0),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-19 00:00:00',0,108),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-20 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-21 00:00:00',0,224),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-22 00:00:00',0,0),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-23 00:00:00',0,140),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-24 00:00:00',0,0),
 ('myteam',146,62,177,233,72,138,144,73,64,150,234,'2007-03-25 00:00:00',0,0),
 ('myteam',98,107,2,134,96,198,3,131,1,92,108,'2007-03-27 00:00:00',0,0),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-13 00:00:00',0,0),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-14 00:00:00',0,359),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-15 00:00:00',0,0),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-16 00:00:00',0,0),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-17 00:00:00',0,0),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-18 00:00:00',0,426);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-19 00:00:00',0,0),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-20 00:00:00',0,19),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-21 00:00:00',0,0),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-22 00:00:00',0,59),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-23 00:00:00',0,0),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-24 00:00:00',0,374),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-25 00:00:00',0,0),
 ('Myteam2',5,2,186,183,14,188,3,11,10,232,189,'2007-03-27 00:00:00',0,0),
 ('Naresh 2007',158,34,123,201,72,142,3,143,131,27,157,'2007-03-15 00:00:00',0,51),
 ('Naresh 2007',158,34,123,201,72,142,3,143,131,27,157,'2007-03-16 00:00:00',0,0),
 ('Naresh 2007',158,34,123,201,72,142,3,143,131,27,157,'2007-03-17 00:00:00',0,78),
 ('Naresh 2007',158,34,123,201,72,142,3,143,131,27,157,'2007-03-18 00:00:00',0,73);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Naresh 2007',158,34,123,201,72,142,3,143,131,27,157,'2007-03-19 00:00:00',0,163),
 ('Naresh 2007',107,235,98,170,109,104,115,114,180,101,232,'2007-03-20 00:00:00',11,222),
 ('Naresh 2007',107,235,98,170,109,104,115,114,180,101,232,'2007-03-21 00:00:00',0,0),
 ('Naresh 2007',91,98,181,227,96,188,95,100,101,215,232,'2007-03-22 00:00:00',8,435),
 ('Naresh 2007',30,31,121,139,141,210,33,202,203,204,209,'2007-03-23 00:00:00',11,398),
 ('Naresh 2007',30,31,121,139,141,210,33,202,203,204,209,'2007-03-24 00:00:00',0,0),
 ('Naresh 2007',30,31,121,139,141,210,33,202,203,204,209,'2007-03-25 00:00:00',0,0),
 ('Naresh 2007',0,2,139,141,7,145,3,10,13,143,150,'2007-03-27 00:00:00',0,0),
 ('NARU',62,70,139,200,74,141,207,71,137,157,209,'2007-03-13 00:00:00',0,176),
 ('NARU',62,70,139,200,74,141,207,71,137,157,209,'2007-03-14 00:00:00',0,0),
 ('NARU',55,121,127,134,153,210,132,131,135,151,160,'2007-03-15 00:00:00',11,454);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('NARU',55,121,127,134,153,210,132,131,135,151,160,'2007-03-16 00:00:00',0,0),
 ('NARU',70,31,43,44,40,74,33,202,209,204,203,'2007-03-17 00:00:00',11,251),
 ('NARU',70,31,43,44,40,74,33,202,209,204,203,'2007-03-18 00:00:00',0,0),
 ('NARU',31,34,44,163,40,145,33,160,161,162,151,'2007-03-19 00:00:00',7,416),
 ('NARU',106,107,99,98,104,109,115,238,234,169,180,'2007-03-20 00:00:00',11,358),
 ('NARU',127,159,121,28,20,74,132,162,135,22,157,'2007-03-21 00:00:00',11,409),
 ('NARU',91,98,99,218,96,214,95,195,232,238,97,'2007-03-22 00:00:00',11,364),
 ('NARU',31,127,41,44,141,210,132,202,203,196,209,'2007-03-23 00:00:00',11,264),
 ('NARU',31,127,41,44,141,210,132,202,203,196,209,'2007-03-24 00:00:00',0,0),
 ('NARU',31,127,41,44,141,210,132,202,203,196,209,'2007-03-25 00:00:00',0,0),
 ('NARU',5,0,2,205,14,145,3,11,1,143,137,'2007-03-27 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Push\'s 11',8,70,117,230,48,56,125,88,94,10,228,'2007-03-13 00:00:00',0,38),
 ('Push\'s 11',8,133,117,230,113,138,86,10,1,65,180,'2007-03-14 00:00:00',7,46),
 ('Push\'s 11',49,121,127,156,56,154,132,130,131,135,157,'2007-03-15 00:00:00',11,494),
 ('Push\'s 11',88,117,106,222,104,109,115,108,213,212,215,'2007-03-16 00:00:00',11,580),
 ('Push\'s 11',88,117,106,222,104,109,115,108,213,212,215,'2007-03-17 00:00:00',0,0),
 ('Push\'s 11',88,117,106,222,104,109,115,108,213,212,215,'2007-03-18 00:00:00',0,76),
 ('Push\'s 11',88,117,106,222,104,109,115,108,213,212,215,'2007-03-19 00:00:00',0,0),
 ('Push\'s 11',107,240,230,171,166,109,115,108,100,238,92,'2007-03-20 00:00:00',8,211),
 ('Push\'s 11',133,24,156,19,18,155,132,129,130,65,75,'2007-03-21 00:00:00',11,379),
 ('Push\'s 11',99,98,211,216,104,96,95,100,221,195,97,'2007-03-22 00:00:00',11,313),
 ('Push\'s 11',0,133,43,134,12,109,132,130,180,212,217,'2007-03-23 00:00:00',11,211);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Push\'s 11',0,133,43,134,12,109,132,130,180,212,217,'2007-03-24 00:00:00',0,205),
 ('Push\'s 11',0,133,43,134,12,109,132,130,180,212,217,'2007-03-25 00:00:00',0,0),
 ('Push\'s 11',0,139,148,149,12,145,3,1,10,143,11,'2007-03-27 00:00:00',0,0),
 ('rx100',0,31,15,91,56,82,3,202,27,238,157,'2007-03-17 00:00:00',0,42),
 ('rx100',0,31,15,91,56,82,3,202,27,238,157,'2007-03-18 00:00:00',0,97),
 ('rx100',0,31,15,91,56,82,3,202,27,238,157,'2007-03-19 00:00:00',0,125),
 ('rx100',0,31,15,91,56,82,3,202,27,238,157,'2007-03-20 00:00:00',0,107),
 ('rx100',62,121,28,163,20,72,132,130,75,157,152,'2007-03-21 00:00:00',10,538),
 ('rx100',62,121,28,163,20,72,132,130,75,157,152,'2007-03-22 00:00:00',0,0),
 ('rx100',127,43,200,205,210,138,132,131,39,150,203,'2007-03-23 00:00:00',10,325),
 ('rx100',127,43,200,205,210,138,132,131,39,150,203,'2007-03-24 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('rx100',127,43,200,205,210,138,132,131,39,150,203,'2007-03-25 00:00:00',0,0),
 ('rx100',127,43,200,205,210,138,132,131,39,150,203,'2007-03-27 00:00:00',0,0),
 ('sam',8,0,178,171,188,179,3,11,131,152,189,'2007-03-14 00:00:00',0,332),
 ('sam',8,0,178,171,188,179,3,11,131,152,189,'2007-03-15 00:00:00',0,105),
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-16 00:00:00',11,400),
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-17 00:00:00',0,0),
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-18 00:00:00',0,71),
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-19 00:00:00',0,0),
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-20 00:00:00',0,204),
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-21 00:00:00',0,0),
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-22 00:00:00',0,248),
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-23 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-24 00:00:00',0,192),
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-25 00:00:00',0,0),
 ('sam',105,106,90,216,82,96,115,108,212,217,213,'2007-03-27 00:00:00',0,0),
 ('SAM\'s',146,139,69,148,141,231,239,150,137,75,180,'2007-03-13 00:00:00',0,337),
 ('SAM\'s',146,139,69,148,141,231,239,150,137,75,180,'2007-03-14 00:00:00',0,165),
 ('SAM\'s',146,139,69,148,141,231,239,150,137,75,180,'2007-03-15 00:00:00',0,0),
 ('SAM\'s',146,139,69,148,141,231,239,150,137,75,180,'2007-03-16 00:00:00',0,0),
 ('SAM\'s',146,139,69,148,141,231,239,150,137,75,180,'2007-03-17 00:00:00',0,42),
 ('SAM\'s',146,139,69,148,141,231,239,150,137,75,180,'2007-03-18 00:00:00',0,0),
 ('SAM\'s',146,139,69,148,141,231,239,150,137,75,180,'2007-03-19 00:00:00',0,153),
 ('SAM\'s',193,105,91,194,96,188,95,184,97,94,195,'2007-03-20 00:00:00',11,269);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('SAM\'s',127,134,121,122,20,153,132,162,161,160,157,'2007-03-21 00:00:00',11,417),
 ('SAM\'s',127,134,121,122,20,153,132,162,161,160,157,'2007-03-22 00:00:00',0,0),
 ('SAM\'s',30,31,34,41,229,231,33,37,157,203,238,'2007-03-23 00:00:00',10,248),
 ('SAM\'s',30,31,34,41,229,231,33,37,157,203,238,'2007-03-24 00:00:00',0,0),
 ('SAM\'s',30,31,34,41,229,231,33,37,157,203,238,'2007-03-25 00:00:00',0,0),
 ('SAM\'s',0,136,141,199,12,210,3,1,11,13,150,'2007-03-27 00:00:00',0,0),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-13 00:00:00',0,388),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-14 00:00:00',0,141),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-15 00:00:00',0,0),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-16 00:00:00',0,0),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-17 00:00:00',0,77);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-18 00:00:00',0,63),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-19 00:00:00',0,163),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-20 00:00:00',0,71),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-21 00:00:00',0,88),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-22 00:00:00',0,76),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-23 00:00:00',0,102),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-24 00:00:00',0,29),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-25 00:00:00',0,0),
 ('SandyXI',69,136,148,194,74,141,239,75,150,174,184,'2007-03-27 00:00:00',0,0),
 ('Super_Boy',0,2,148,141,12,138,3,1,150,137,143,'2007-03-27 00:00:00',0,0),
 ('The Mavericks',41,80,211,28,40,224,67,97,42,75,202,'2007-03-16 00:00:00',0,130);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('The Mavericks',41,80,211,28,40,224,67,97,42,75,202,'2007-03-17 00:00:00',0,176),
 ('The Mavericks',41,80,211,28,40,224,67,97,42,75,202,'2007-03-18 00:00:00',0,118),
 ('The Mavericks',41,80,211,28,40,224,67,97,42,75,202,'2007-03-19 00:00:00',0,150),
 ('The Mavericks',107,105,127,158,109,229,164,100,152,97,174,'2007-03-20 00:00:00',10,206),
 ('The Mavericks',105,107,127,158,109,229,164,124,100,152,174,'2007-03-21 00:00:00',1,279),
 ('The Mavericks',105,91,211,98,96,214,220,100,232,215,97,'2007-03-22 00:00:00',9,390),
 ('The Mavericks',105,91,211,98,96,214,220,100,232,215,97,'2007-03-23 00:00:00',0,0),
 ('The Mavericks',105,91,211,98,96,214,220,100,232,215,97,'2007-03-24 00:00:00',0,0),
 ('The Mavericks',105,91,211,98,96,214,220,100,232,215,97,'2007-03-25 00:00:00',0,0),
 ('The Mavericks',105,91,211,98,96,214,220,100,232,215,97,'2007-03-27 00:00:00',0,0);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('The Rock',199,44,24,16,20,18,33,39,22,204,202,'2007-03-17 00:00:00',0,384),
 ('The Rock',199,44,24,16,20,18,33,39,22,204,202,'2007-03-18 00:00:00',0,0),
 ('The Rock',199,44,24,16,20,18,33,39,22,204,202,'2007-03-19 00:00:00',0,155),
 ('The Rock',199,44,24,16,20,18,33,39,22,204,202,'2007-03-20 00:00:00',0,0),
 ('The Rock',199,44,24,16,20,18,33,39,22,204,202,'2007-03-21 00:00:00',0,65),
 ('The Rock',199,44,24,16,20,18,33,39,22,204,202,'2007-03-22 00:00:00',0,0),
 ('The Rock',199,44,24,16,20,18,33,39,22,204,202,'2007-03-23 00:00:00',0,140),
 ('The Rock',199,44,24,16,20,18,33,39,22,204,202,'2007-03-24 00:00:00',0,0),
 ('The Rock',199,44,24,16,20,18,33,39,22,204,202,'2007-03-25 00:00:00',0,108),
 ('The Rock',199,44,24,16,20,18,33,39,22,204,202,'2007-03-27 00:00:00',0,0),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-15 00:00:00',0,0),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-16 00:00:00',0,49);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-17 00:00:00',0,69),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-18 00:00:00',0,286),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-19 00:00:00',0,207),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-20 00:00:00',0,122),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-21 00:00:00',0,0),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-22 00:00:00',0,7),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-23 00:00:00',0,203),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-24 00:00:00',0,244),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-25 00:00:00',0,0),
 ('Vipul Varshney',216,2,41,139,7,231,33,11,175,212,114,'2007-03-27 00:00:00',0,0),
 ('WILLOW XI',70,139,146,177,74,179,144,73,143,150,180,'2007-03-13 00:00:00',0,288);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('WILLOW XI',2,5,8,177,14,179,3,1,13,180,184,'2007-03-14 00:00:00',8,288),
 ('WILLOW XI',121,134,199,205,82,210,132,129,202,126,101,'2007-03-15 00:00:00',11,612),
 ('WILLOW XI',112,105,80,216,82,109,86,217,85,100,202,'2007-03-16 00:00:00',9,330),
 ('WILLOW XI',43,34,69,28,74,20,33,65,37,202,209,'2007-03-17 00:00:00',10,563),
 ('WILLOW XI',5,88,43,78,82,56,3,87,84,184,53,'2007-03-18 00:00:00',10,220),
 ('WILLOW XI',5,88,43,78,82,56,3,87,84,184,53,'2007-03-19 00:00:00',0,50),
 ('WILLOW XI',98,106,177,230,96,109,115,102,116,180,238,'2007-03-20 00:00:00',11,369),
 ('WILLOW XI',28,69,121,134,17,20,132,129,135,162,238,'2007-03-21 00:00:00',10,264),
 ('WILLOW XI',98,99,121,183,96,231,132,100,213,97,238,'2007-03-22 00:00:00',8,141),
 ('WILLOW XI',146,206,121,44,210,138,132,174,130,150,209,'2007-03-23 00:00:00',9,234),
 ('WILLOW XI',5,88,78,28,7,113,3,27,87,174,180,'2007-03-24 00:00:00',10,402);
INSERT INTO `user_team_details` (`user_team_id`,`player1`,`player2`,`player3`,`player4`,`player5`,`player6`,`player7`,`player8`,`player9`,`player10`,`player11`,`effective_date`,`number_of_changes`,`team_points`) VALUES 
 ('WILLOW XI',49,28,78,88,7,20,23,27,87,25,180,'2007-03-25 00:00:00',4,168),
 ('WILLOW XI',5,146,2,139,12,138,3,13,143,1,150,'2007-03-27 00:00:00',0,0);
/*!40000 ALTER TABLE `user_team_details` ENABLE KEYS */;


--
-- Definition of table `user_team_details_1`
--

DROP TABLE IF EXISTS `user_team_details_1`;
CREATE TABLE `user_team_details_1` (
  `user_team_id` varchar(40) default NULL,
  `country_id` int(11) default NULL,
  `country_status` smallint(5) unsigned default NULL,
  `team_points` int(10) unsigned NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_team_details_1`
--

/*!40000 ALTER TABLE `user_team_details_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_team_details_1` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
