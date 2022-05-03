DROP DATABASE IF EXISTS `cars_rdbms_pseudo_keys`;
CREATE SCHEMA IF NOT EXISTS `cars_rdbms_pseudo_keys` DEFAULT CHARACTER SET utf8 ;
USE `cars_rdbms_pseudo_keys`;

CREATE TABLE `make` (
  `make_id` INT(11) NOT NULL AUTO_INCREMENT,
  `make` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`make_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `model` (
  `model_id` INT(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(30) NOT NULL,
  `make_id` INT(11) NOT NULL,
  PRIMARY KEY (`model_id`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `trim`(
  `trim_id` INT(11) NOT NULL AUTO_INCREMENT,
  `trim` varchar(35) NOT NULL,
  `model_id` INT(11) NOT NULL,
  PRIMARY KEY (`trim_id`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `engine`(
  `engine_id` INT(11) NOT NULL AUTO_INCREMENT,
  `engine` varchar(50) NOT NULL,
  `fueltype`varchar(13) NOT NULL,
  `model_id` INT(11) NOT NULL,
  PRIMARY KEY (`engine_id`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `color`(
  `color_id` INT(11) NOT NULL AUTO_INCREMENT,
  `extcolor` varchar(50) NOT NULL,
  `intcolor` varchar(50) NOT NULL,
  `make_id` INT(11) NOT NULL,
  PRIMARY KEY (`color_id`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `bodystyle` (
  `bodystyle_id` int(11) NOT NULL AUTO_INCREMENT,
  `bodystyle` varchar(30) NOT NULL,
  PRIMARY KEY (`bodystyle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE `transmission` (
  `transmission_id` int(11) NOT NULL AUTO_INCREMENT,
  `transmission` varchar(10) NOT NULL,
  PRIMARY KEY (`transmission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `vehicles` (
  `make_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `trim_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `transmission_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `engine_id` int(11) NOT NULL,
  `vehicletype` varchar(4) NOT NULL,
  `bodystyle_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `vin` char(17) NOT NULL,
  `modelcode` varchar(11) DEFAULT NULL,
  `stocknum` varchar(6) NOT NULL,
  PRIMARY KEY (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

