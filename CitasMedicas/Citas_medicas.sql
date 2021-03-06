-- MySQL Script generated by MySQL Workbench
-- Fri Jun 25 12:57:10 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema citas_medicas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema citas_medicas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `citas_medicas` DEFAULT CHARACTER SET utf8mb4 ;
USE `citas_medicas` ;

-- -----------------------------------------------------
-- Table `citas_medicas`.`manuales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citas_medicas`.`manuales` (
  `codigo` CHAR(2) NOT NULL,
  `nombre` CHAR(50) NULL DEFAULT NULL,
  `base` FLOAT NULL DEFAULT NULL,
  `anno` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `citas_medicas`.`eps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citas_medicas`.`eps` (
  `codigo` CHAR(6) NOT NULL,
  `nombre` VARCHAR(80) NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` CHAR(30) NULL DEFAULT NULL,
  `contacto` VARCHAR(50) NULL DEFAULT NULL,
  `tipoentidad` CHAR(10) NULL DEFAULT NULL,
  `manual` CHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `FK_manual_eps_idx` (`manual` ASC) VISIBLE,
  CONSTRAINT `FK_manual_eps`
    FOREIGN KEY (`manual`)
    REFERENCES `citas_medicas`.`manuales` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `citas_medicas`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citas_medicas`.`usuarios` (
  `idusuarios` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` CHAR(30) NULL DEFAULT NULL,
  `email` VARCHAR(80) NULL DEFAULT NULL,
  `password` VARCHAR(256) NULL DEFAULT NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `citas_medicas`.`especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citas_medicas`.`especialidades` (
  `codigo` CHAR(3) NOT NULL,
  `nombre` CHAR(60) NULL DEFAULT NULL,
  `nivel` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `citas_medicas`.`medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citas_medicas`.`medicos` (
  `idmedicos` INT(11) NOT NULL AUTO_INCREMENT,
  `documento` CHAR(15) NULL DEFAULT NULL,
  `regmedico` CHAR(20) NULL DEFAULT NULL,
  `nombres` CHAR(40) NULL DEFAULT NULL,
  `apellidos` CHAR(40) NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` CHAR(30) NULL DEFAULT NULL,
  `especialidad` CHAR(3) NULL DEFAULT NULL,
  `firma` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idmedicos`),
  INDEX `FK_especialidad_medicos_idx` (`especialidad` ASC) VISIBLE,
  CONSTRAINT `FK_especialidad_medicos`
    FOREIGN KEY (`especialidad`)
    REFERENCES `citas_medicas`.`especialidades` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `citas_medicas`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citas_medicas`.`pacientes` (
  `documento` CHAR(20) NOT NULL,
  `tipodoc` CHAR(2) NULL DEFAULT NULL,
  `papellido` CHAR(20) NULL DEFAULT NULL,
  `sapellido` CHAR(20) NULL DEFAULT NULL,
  `pnombre` CHAR(20) NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` CHAR(30) NULL DEFAULT NULL,
  `eps` CHAR(6) NULL DEFAULT NULL,
  `genero` CHAR(1) NULL DEFAULT NULL,
  `discapacidad` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`documento`),
  INDEX `FK_eps_pacientes_idx` (`eps` ASC) VISIBLE,
  CONSTRAINT `FK_eps_pacientes`
    FOREIGN KEY (`eps`)
    REFERENCES `citas_medicas`.`eps` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `citas_medicas`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citas_medicas`.`servicios` (
  `codigo` CHAR(10) NOT NULL,
  `nombre` VARCHAR(300) NULL DEFAULT NULL,
  `estado` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `citas_medicas`.`citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citas_medicas`.`citas` (
  `idcitas` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL DEFAULT NULL,
  `hora` CHAR(5) NULL DEFAULT NULL,
  `medico` INT(11) NULL DEFAULT NULL,
  `eps` CHAR(6) NULL DEFAULT NULL,
  `paciente` CHAR(20) NULL DEFAULT NULL,
  `servicio` CHAR(10) NULL DEFAULT NULL,
  `estado` TINYINT(4) NULL DEFAULT NULL,
  `idusuario` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idcitas`),
  INDEX `FK_idusuario_citas_idx` (`idusuario` ASC) VISIBLE,
  INDEX `FK_servicio_citas_idx` (`servicio` ASC) VISIBLE,
  INDEX `FK_medico_citas_idx` (`medico` ASC) VISIBLE,
  INDEX `FK_eps_citas_idx` (`eps` ASC) VISIBLE,
  INDEX `FK_paciente_citas_idx` (`paciente` ASC) VISIBLE,
  CONSTRAINT `FK_eps_citas`
    FOREIGN KEY (`eps`)
    REFERENCES `citas_medicas`.`eps` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_idusuario_citas`
    FOREIGN KEY (`idusuario`)
    REFERENCES `citas_medicas`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_medico_citas`
    FOREIGN KEY (`medico`)
    REFERENCES `citas_medicas`.`medicos` (`idmedicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_paciente_citas`
    FOREIGN KEY (`paciente`)
    REFERENCES `citas_medicas`.`pacientes` (`documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_servicio_citas`
    FOREIGN KEY (`servicio`)
    REFERENCES `citas_medicas`.`servicios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `citas_medicas`.`pacientes_fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citas_medicas`.`pacientes_fotos` (
  `documento` CHAR(20) NOT NULL,
  `foto` BLOB NULL DEFAULT NULL,
  PRIMARY KEY (`documento`),
  CONSTRAINT `FK_documento_pacientes_fotos`
    FOREIGN KEY (`documento`)
    REFERENCES `citas_medicas`.`pacientes` (`documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `citas_medicas`.`tarifas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citas_medicas`.`tarifas` (
  `idtarifas` INT(11) NOT NULL AUTO_INCREMENT,
  `codmanual` CHAR(2) NULL DEFAULT NULL,
  `codservicio` CHAR(10) NULL DEFAULT NULL,
  `valor` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idtarifas`),
  INDEX `FK_codservicio_tarifas_idx` (`codservicio` ASC) VISIBLE,
  INDEX `FK_codmanual_tarifas_idx` (`codmanual` ASC) VISIBLE,
  CONSTRAINT `FK_codmanual_tarifas`
    FOREIGN KEY (`codmanual`)
    REFERENCES `citas_medicas`.`manuales` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_codservicio_tarifas`
    FOREIGN KEY (`codservicio`)
    REFERENCES `citas_medicas`.`servicios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
