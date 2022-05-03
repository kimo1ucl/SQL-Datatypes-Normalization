DROP DATABASE IF EXISTS `cars_rdbms_business_keys`;
CREATE DATABASE `cars_rdbms_business_keys` DEFAULT CHARACTER SET utf8;

USE `cars_rdbms_business_keys`;
/* DDL related table begins here */
CREATE TABLE `make`(
  `make` varchar(15) NOT NULL,
  PRIMARY KEY (`make`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE `model`(
 `model` varchar(30) NOT NULL,
 `make` varchar(15) NOT NULL,
 PRIMARY KEY (`make`,`model`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `trim`(
 `trim` varchar(30) NOT NULL,
 `model` varchar(30) NOT NULL,
 PRIMARY KEY (`model`,`trim`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `engine`(
  `engine` varchar(50) NOT NULL,
  `fueltype` varchar(13) NOT NULL,
  `model` varchar(30) NOT NULL,
   PRIMARY KEY (`model`,`engine`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* DDL value lists begins here */
CREATE TABLE `bodystyle`(
	`bodystyle` varchar(30) NOT NULL,
    PRIMARY KEY (`bodystyle`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `transmission`(
	`transmission` varchar(10) NOT NULL,
    PRIMARY KEY (`transmission`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `extcolor`(
  `extcolor` varchar(50) NOT NULL,
  PRIMARY KEY (`extcolor`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `intcolor`(
  `intcolor` varchar(50) NOT NULL,
  PRIMARY KEY (`intcolor`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* DDL for the final table holding physical car objects*/
CREATE TABLE `vehicle` (
  `make` varchar(15) NOT NULL,
  `model` varchar(30) NOT NULL,
  `year` int(11) NOT NULL,
  `trim` varchar(35) NOT NULL,
  `extcolor` varchar(50) DEFAULT NULL,
  `intcolor` varchar(50) DEFAULT NULL,
  `trans` varchar(10) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `engine` varchar(50) NOT NULL,
  `fueltype` varchar(13) NOT NULL,
  `vehicletype` varchar(4) NOT NULL,
  `bodystyle` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `vin` char(17) NOT NULL,
  `modelcode` varchar(11) DEFAULT NULL,
  `msrp` varchar(5) NOT NULL,
  `stocknum` varchar(6) NOT NULL,
  PRIMARY KEY (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
