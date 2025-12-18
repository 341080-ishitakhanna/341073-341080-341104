-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema TCS_Clone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TCS_Clone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TCS_Clone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `TCS_Clone` ;

-- -----------------------------------------------------
-- Table `TCS_Clone`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TCS_Clone`.`Clients` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(100) NOT NULL,
  `industry` VARCHAR(100) NULL DEFAULT NULL,
  `country` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `TCS_Clone`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TCS_Clone`.`Departments` (
  `dept_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `location` VARCHAR(100) NULL DEFAULT 'Mumbai',
  PRIMARY KEY (`dept_id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `TCS_Clone`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TCS_Clone`.`Employees` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `designation` VARCHAR(100) NOT NULL,
  `hire_date` DATE NULL DEFAULT curdate(),
  `salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `dept_id` INT NULL DEFAULT NULL,
  `is_bench` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`emp_id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `dept_id` (`dept_id` ASC) VISIBLE,
  CONSTRAINT `employees_ibfk_1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `TCS_Clone`.`Departments` (`dept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `TCS_Clone`.`Projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TCS_Clone`.`Projects` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `client_id` INT NOT NULL,
  `budget` DECIMAL(15,2) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `status` ENUM('Planning', 'Active', 'Completed', 'On Hold') NULL DEFAULT 'Planning',
  PRIMARY KEY (`project_id`),
  INDEX `client_id` (`client_id` ASC) VISIBLE,
  CONSTRAINT `projects_ibfk_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `TCS_Clone`.`Clients` (`client_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `TCS_Clone`.`Project_Allocations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TCS_Clone`.`Project_Allocations` (
  `allocation_id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NOT NULL,
  `emp_id` INT NOT NULL,
  `role_on_project` VARCHAR(100) NULL DEFAULT NULL,
  `allocation_date` DATE NULL DEFAULT curdate(),
  `billing_rate_per_hour` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`allocation_id`),
  INDEX `project_id` (`project_id` ASC) VISIBLE,
  INDEX `emp_id` (`emp_id` ASC) VISIBLE,
  CONSTRAINT `project_allocations_ibfk_1`
    FOREIGN KEY (`project_id`)
    REFERENCES `TCS_Clone`.`Projects` (`project_id`),
  CONSTRAINT `project_allocations_ibfk_2`
    FOREIGN KEY (`emp_id`)
    REFERENCES `TCS_Clone`.`Employees` (`emp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
