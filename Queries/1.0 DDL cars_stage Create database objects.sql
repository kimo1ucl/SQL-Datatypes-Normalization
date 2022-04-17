#https://dev.mysql.com/doc/refman/8.0/en/data-types.html
DROP DATABASE IF EXISTS cars_stage;
CREATE DATABASE cars_stage CHARACTER SET utf8 COLLATE utf8_general_ci;
USE cars_stage;
CREATE TABLE `ext_american_cars` (
  `data-make` varchar(255) DEFAULT NULL,
  `data-model` varchar(255) DEFAULT NULL,
  `data-year` varchar(255) DEFAULT NULL,
  `data-trim` varchar(255) DEFAULT NULL,
  `data-extcolor` varchar(255) DEFAULT NULL,
  `data-intcolor` varchar(255) DEFAULT NULL,
  `data-trans` varchar(255) DEFAULT NULL,
  `data-price` varchar(255) DEFAULT NULL,
  `data-engine` varchar(255) DEFAULT NULL,
  `data-fueltype` varchar(255) DEFAULT NULL,
  `data-vehicletype` varchar(255) DEFAULT NULL,
  `data-bodystyle` varchar(255) DEFAULT NULL,
  `data-name` varchar(255) DEFAULT NULL,
  `data-vin` varchar(255) DEFAULT NULL,
  `data-modelcode` varchar(255) DEFAULT NULL,
  `data-msrp` varchar(255) DEFAULT NULL,
  `data-stocknum` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
