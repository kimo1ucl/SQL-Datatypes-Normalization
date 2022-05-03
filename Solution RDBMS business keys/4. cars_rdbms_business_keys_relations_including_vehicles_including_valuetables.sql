-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cars_rdbms_business_keys
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cars_rdbms_business_keys
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cars_rdbms_business_keys` DEFAULT CHARACTER SET utf8 ;
USE `cars_rdbms_business_keys` ;

-- -----------------------------------------------------
-- Table `cars_rdbms_business_keys`.`bodystyle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_rdbms_business_keys`.`bodystyle` (
  `bodystyle` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`bodystyle`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_rdbms_business_keys`.`make`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_rdbms_business_keys`.`make` (
  `make` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`make`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_rdbms_business_keys`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_rdbms_business_keys`.`model` (
  `model` VARCHAR(30) NOT NULL,
  `make` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`make`, `model`),
  CONSTRAINT `fk_model_make`
    FOREIGN KEY (`make`)
    REFERENCES `cars_rdbms_business_keys`.`make` (`make`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_rdbms_business_keys`.`engine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_rdbms_business_keys`.`engine` (
  `engine` VARCHAR(50) NOT NULL,
  `fueltype` VARCHAR(13) NOT NULL,
  `model` VARCHAR(30) NOT NULL,
  `make` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`make`, `model`, `engine`),
  CONSTRAINT `fk_engine_model`
    FOREIGN KEY (`make` , `model`)
    REFERENCES `cars_rdbms_business_keys`.`model` (`make` , `model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_rdbms_business_keys`.`extcolor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_rdbms_business_keys`.`extcolor` (
  `extcolor` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`extcolor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_rdbms_business_keys`.`intcolor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_rdbms_business_keys`.`intcolor` (
  `intcolor` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`intcolor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_rdbms_business_keys`.`transmission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_rdbms_business_keys`.`transmission` (
  `transmission` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`transmission`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_rdbms_business_keys`.`trim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_rdbms_business_keys`.`trim` (
  `trim` VARCHAR(30) NOT NULL,
  `model` VARCHAR(30) NOT NULL,
  `make` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`make`, `model`, `trim`),
  CONSTRAINT `fk_trim_model`
    FOREIGN KEY (`make` , `model`)
    REFERENCES `cars_rdbms_business_keys`.`model` (`make` , `model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_rdbms_business_keys`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_rdbms_business_keys`.`vehicle` (
  `make` VARCHAR(15) NOT NULL,
  `model` VARCHAR(30) NOT NULL,
  `year` INT(11) NOT NULL,
  `trim` VARCHAR(35) NOT NULL,
  `extcolor` VARCHAR(50) NULL DEFAULT NULL,
  `intcolor` VARCHAR(50) NULL DEFAULT NULL,
  `transmission` VARCHAR(10) NULL DEFAULT NULL,
  `price` INT(11) NOT NULL,
  `engine` VARCHAR(50) NOT NULL,
  `fueltype` VARCHAR(13) NOT NULL,
  `vehicletype` VARCHAR(4) NOT NULL,
  `bodystyle` VARCHAR(30) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `vin` CHAR(17) NOT NULL,
  `modelcode` VARCHAR(11) NULL DEFAULT NULL,
  `msrp` VARCHAR(5) NOT NULL,
  `stocknum` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`vin`),
  INDEX `fk_vehicle_make1_idx` (`make` ASC) ,
  INDEX `fk_vehicle_engine1` (`make` ASC, `model` ASC, `engine` ASC) ,
  INDEX `fk_vehicle_trim1` (`make` ASC, `model` ASC, `trim` ASC) ,
  INDEX `fk_vehicle_extcolor1_idx` (`extcolor` ASC) ,
  INDEX `fk_vehicle_bodystyle1_idx` (`bodystyle` ASC) ,
  INDEX `fk_vehicle_transmission1_idx` (`transmission` ASC) ,
  CONSTRAINT `fk_vehicle_engine1`
    FOREIGN KEY (`make` , `model` , `engine`)
    REFERENCES `cars_rdbms_business_keys`.`engine` (`make` , `model` , `engine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_make1`
    FOREIGN KEY (`make`)
    REFERENCES `cars_rdbms_business_keys`.`make` (`make`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_model1`
    FOREIGN KEY (`make` , `model`)
    REFERENCES `cars_rdbms_business_keys`.`model` (`make` , `model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_trim1`
    FOREIGN KEY (`make` , `model` , `trim`)
    REFERENCES `cars_rdbms_business_keys`.`trim` (`make` , `model` , `trim`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_extcolor1`
    FOREIGN KEY (`extcolor`)
    REFERENCES `cars_rdbms_business_keys`.`extcolor` (`extcolor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_intcolor1`
    FOREIGN KEY (`extcolor`)
    REFERENCES `cars_rdbms_business_keys`.`intcolor` (`intcolor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_bodystyle1`
    FOREIGN KEY (`bodystyle`)
    REFERENCES `cars_rdbms_business_keys`.`bodystyle` (`bodystyle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_transmission1`
    FOREIGN KEY (`transmission`)
    REFERENCES `cars_rdbms_business_keys`.`transmission` (`transmission`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
