SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
  UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
  FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE,
  SQL_MODE = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema stms
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema stms
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stms` DEFAULT CHARACTER SET utf8;
USE `stms`;
-- -----------------------------------------------------
-- Table `stms`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stms`.`team` (
  `TeamId` INT(11) NOT NULL,
  `tName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TeamId`)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `stms`.`coach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stms`.`coach` (
  `CoachId` INT(11) NOT NULL,
  `TeamId` INT(11) NOT NULL,
  `cName` VARCHAR(45) NOT NULL,
  `Department` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CoachId`),
  INDEX `fk_Coach_Team1_idx` (`TeamId` ASC),
  CONSTRAINT `fk_Coach_Team1` FOREIGN KEY (`TeamId`) REFERENCES `stms`.`team` (`TeamId`) ON UPDATE CASCADE
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `stms`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stms`.`player` (
  `PlayerID` INT(11) NOT NULL,
  `TeamId` INT(11) NOT NULL,
  `pName` VARCHAR(45) NOT NULL,
  `Nationality` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PlayerID`),
  INDEX `fk_Player_Team1_idx` (`TeamId` ASC),
  CONSTRAINT `fk_Player_Team1` FOREIGN KEY (`TeamId`) REFERENCES `stms`.`team` (`TeamId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `stms`.`contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stms`.`contract` (
  `ContractId` INT(11) NOT NULL,
  `PlayerID` INT(11) NOT NULL,
  `Start_date` DATE NOT NULL,
  `End_date` DATE NOT NULL,
  `Salary` INT(11) NOT NULL,
  PRIMARY KEY (`ContractId`, `PlayerID`),
  INDEX `fk_Contract_Player1_idx` (`PlayerID` ASC),
  CONSTRAINT `PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `stms`.`player` (`PlayerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `stms`.`match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stms`.`match` (
  `MatchId` INT(11) NOT NULL,
  `TeamId` INT(11) NOT NULL,
  `mDate` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(45) NOT NULL,
  `Opposing_team` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MatchId`),
  INDEX `fk_Match_Team1_idx` (`TeamId` ASC),
  CONSTRAINT `fk_Match_Team1` FOREIGN KEY (`TeamId`) REFERENCES `stms`.`team` (`TeamId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `stms`.`mperformance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stms`.`mperformance` (
  `MatchId` INT(11) NOT NULL,
  `PlayerID` INT(11) NOT NULL,
  `mStatus` VARCHAR(45) NOT NULL,
  `Player_Rating` INT(11) NOT NULL,
  PRIMARY KEY (`MatchId`, `PlayerID`),
  INDEX `fk_Match_has_Player_Player1_idx` (`PlayerID` ASC),
  INDEX `fk_Match_has_Player_Match1_idx` (`MatchId` ASC),
  CONSTRAINT `fk_Match_has_Player_Match1` FOREIGN KEY (`MatchId`) REFERENCES `stms`.`match` (`MatchId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Match_has_Player_Player1` FOREIGN KEY (`PlayerID`) REFERENCES `stms`.`player` (`PlayerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `stms`.`position_value`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stms`.`position_value` (
  `PlayerID` INT(11) NOT NULL,
  `Position` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PlayerID`, `Position`),
  CONSTRAINT `fk_Position_Value_Player` FOREIGN KEY (`PlayerID`) REFERENCES `stms`.`player` (`PlayerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `stms`.`training_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stms`.`training_session` (
  `SessionID` INT(11) NOT NULL,
  `CoachId` INT(11) NOT NULL,
  `sDate` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SessionID`),
  INDEX `fk_Training_session_Coach1_idx` (`CoachId` ASC),
  CONSTRAINT `fk_Training_session_Coach1` FOREIGN KEY (`CoachId`) REFERENCES `stms`.`coach` (`CoachId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `stms`.`sperformance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stms`.`sperformance` (
  `SessionID` INT(11) NOT NULL,
  `PlayerID` INT(11) NOT NULL,
  `sStatus` VARCHAR(45) NOT NULL,
  `Player_Rating` INT(11) NOT NULL,
  PRIMARY KEY (`SessionID`, `PlayerID`),
  INDEX `fk_Training_session_has_Player_Player1_idx` (`PlayerID` ASC),
  INDEX `fk_Training_session_has_Player_Training_session1_idx` (`SessionID` ASC),
  CONSTRAINT `fk_Training_session_has_Player_Player1` FOREIGN KEY (`PlayerID`) REFERENCES `stms`.`player` (`PlayerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Training_session_has_Player_Training_session1` FOREIGN KEY (`SessionID`) REFERENCES `stms`.`training_session` (`SessionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;