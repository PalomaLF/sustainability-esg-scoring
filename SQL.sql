-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema esg_scores
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esg_scores` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `esg_scores` ;

-- -----------------------------------------------------
-- Table `esg_scores`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esg_scores`.`countries` (
  `country` VARCHAR(100) NULL,
  `iso_3` VARCHAR(3) NOT NULL,
  `continent` VARCHAR(100) NULL,
  `region` VARCHAR(100) NULL,
  PRIMARY KEY (`iso_3`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esg_scores`.`country_global_score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esg_scores`.`country_global_score` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `countries_iso_3` VARCHAR(3) NOT NULL,
  `country` VARCHAR(100) NULL,
  `year` INT(4) NULL,
  `population` INT NULL,
  `sdg_score` FLOAT NULL,
  PRIMARY KEY (`id`, `countries_iso_3`),
  INDEX `fk_global_country_esg_countries_idx` (`countries_iso_3` ASC) VISIBLE,
  CONSTRAINT `fk_global_country_esg_countries`
    FOREIGN KEY (`countries_iso_3`)
    REFERENCES `esg_scores`.`countries` (`iso_3`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esg_scores`.`country_goals_scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esg_scores`.`country_goals_scores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `countries_iso_3` VARCHAR(3) NOT NULL,
  `country` VARCHAR(100) NULL,
  `year` INT(4) NULL,
  `population` INT(100) NULL,
  `goal_1` FLOAT NULL,
  `goal_2` FLOAT NULL,
  `goal_3` FLOAT NULL,
  `goal_4` FLOAT NULL,
  `goal_5` FLOAT NULL,
  `goal_6` FLOAT NULL,
  `goal_7` FLOAT NULL,
  `goal_8` FLOAT NULL,
  `goal_9` FLOAT NULL,
  `goal_10` FLOAT NULL,
  `goal_11` FLOAT NULL,
  `goal_12` FLOAT NULL,
  `goal_13` FLOAT NULL,
  `goal_14` FLOAT NULL,
  `goal_15` FLOAT NULL,
  `goal_16` FLOAT NULL,
  `goal_17` FLOAT NULL,
  PRIMARY KEY (`id`, `countries_iso_3`),
  INDEX `fk_country_goals_scores_countries1_idx` (`countries_iso_3` ASC) VISIBLE,
  CONSTRAINT `fk_country_goals_scores_countries1`
    FOREIGN KEY (`countries_iso_3`)
    REFERENCES `esg_scores`.`countries` (`iso_3`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esg_scores`.`company_ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esg_scores`.`company_ratings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `countries_iso_3` VARCHAR(3) NOT NULL,
  `companies` VARCHAR(100) NULL,
  `symbols` VARCHAR(50) NULL,
  `ratings` FLOAT NULL,
  `risk` VARCHAR(100) NULL,
  `industry` VARCHAR(100) NULL,
  `environment_score` FLOAT NULL,
  `social_score` FLOAT NULL,
  `governance_score` FLOAT NULL,
  PRIMARY KEY (`id`, `countries_iso_3`),
  INDEX `fk_company_ratings_countries1_idx` (`countries_iso_3` ASC) VISIBLE,
  CONSTRAINT `fk_company_ratings_countries1`
    FOREIGN KEY (`countries_iso_3`)
    REFERENCES `esg_scores`.`countries` (`iso_3`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
