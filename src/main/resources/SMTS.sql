-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema STMS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema STMS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `STMS` DEFAULT CHARACTER SET utf8 ;
USE `STMS` ;

-- -----------------------------------------------------
-- Table `STMS`.`Team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STMS`.`Team` (
  `TeamId` INT NOT NULL,
  `tName` VARCHAR(45) NULL,
  PRIMARY KEY (`TeamId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STMS`.`Player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STMS`.`Player` (
  `PlayerID` INT NOT NULL,
  `Team_TeamId` INT NOT NULL,
  `pName` VARCHAR(45) NULL,
  `Nationality` VARCHAR(45) NULL,
  PRIMARY KEY (`PlayerID`),
  INDEX `fk_Player_Team1_idx` (`Team_TeamId` ASC) ,
  CONSTRAINT `fk_Player_Team1`
    FOREIGN KEY (`Team_TeamId`)
    REFERENCES `STMS`.`Team` (`TeamId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STMS`.`Position_Value`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STMS`.`Position_Value` (
  `Player_PlayerID` INT NOT NULL,
  `Position` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Player_PlayerID`, `Position`),
  CONSTRAINT `fk_Position_Value_Player`
    FOREIGN KEY (`Player_PlayerID`)
    REFERENCES `STMS`.`Player` (`PlayerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STMS`.`Match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STMS`.`Match` (
  `MatchId` INT NOT NULL,
  `Team_TeamId` INT NOT NULL,
  `mDate` VARCHAR(45) NULL,
  `Location` VARCHAR(45) NULL,
  `Opposing_team` VARCHAR(45) NULL,
  PRIMARY KEY (`MatchId`),
  INDEX `fk_Match_Team1_idx` (`Team_TeamId` ASC) ,
  CONSTRAINT `fk_Match_Team1`
    FOREIGN KEY (`Team_TeamId`)
    REFERENCES `STMS`.`Team` (`TeamId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STMS`.`Coach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STMS`.`Coach` (
  `CoachId` INT NOT NULL,
  `Team_TeamId` INT NOT NULL,
  `Department` VARCHAR(45) NULL,
  PRIMARY KEY (`CoachId`),
  INDEX `fk_Coach_Team1_idx` (`Team_TeamId` ASC) ,
  CONSTRAINT `fk_Coach_Team1`
    FOREIGN KEY (`Team_TeamId`)
    REFERENCES `STMS`.`Team` (`TeamId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STMS`.`Training_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STMS`.`Training_session` (
  `SessionID` INT NOT NULL,
  `Coach_CoachId` INT NOT NULL,
  `sDate` VARCHAR(45) NULL,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`SessionID`),
  INDEX `fk_Training_session_Coach1_idx` (`Coach_CoachId` ASC) ,
  CONSTRAINT `fk_Training_session_Coach1`
    FOREIGN KEY (`Coach_CoachId`)
    REFERENCES `STMS`.`Coach` (`CoachId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STMS`.`Contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STMS`.`Contract` (
  `ContractId` INT NOT NULL,
  `Player_PlayerID` INT NOT NULL,
  `Start_date` DATE NULL,
  `End_date` DATE NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`ContractId`, `Player_PlayerID`),
  INDEX `fk_Contract_Player1_idx` (`Player_PlayerID` ASC) ,
  CONSTRAINT `fk_Contract_Player1`
    FOREIGN KEY (`Player_PlayerID`)
    REFERENCES `STMS`.`Player` (`PlayerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STMS`.`mPerformance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STMS`.`mPerformance` (
  `Match_MatchId` INT NOT NULL,
  `Player_PlayerID` INT NOT NULL,
  `mStatus` VARCHAR(45) NULL,
  PRIMARY KEY (`Match_MatchId`, `Player_PlayerID`),
  INDEX `fk_Match_has_Player_Player1_idx` (`Player_PlayerID` ASC) ,
  INDEX `fk_Match_has_Player_Match1_idx` (`Match_MatchId` ASC) ,
  CONSTRAINT `fk_Match_has_Player_Match1`
    FOREIGN KEY (`Match_MatchId`)
    REFERENCES `STMS`.`Match` (`MatchId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Match_has_Player_Player1`
    FOREIGN KEY (`Player_PlayerID`)
    REFERENCES `STMS`.`Player` (`PlayerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STMS`.`sPerformance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STMS`.`sPerformance` (
  `Training_session_SessionID` INT NOT NULL,
  `Player_PlayerID` INT NOT NULL,
  `sStatus` VARCHAR(45) NULL,
  PRIMARY KEY (`Training_session_SessionID`, `Player_PlayerID`),
  INDEX `fk_Training_session_has_Player_Player1_idx` (`Player_PlayerID` ASC) ,
  INDEX `fk_Training_session_has_Player_Training_session1_idx` (`Training_session_SessionID` ASC) ,
  CONSTRAINT `fk_Training_session_has_Player_Training_session1`
    FOREIGN KEY (`Training_session_SessionID`)
    REFERENCES `STMS`.`Training_session` (`SessionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Training_session_has_Player_Player1`
    FOREIGN KEY (`Player_PlayerID`)
    REFERENCES `STMS`.`Player` (`PlayerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
