-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema proyectoweb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectoweb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectoweb` DEFAULT CHARACTER SET utf8mb3 ;
USE `proyectoweb` ;

-- -----------------------------------------------------
-- Table `proyectoweb`.`estado_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`estado_usuario` (
  `idEstado_Usuario` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idEstado_Usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyectoweb`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`rol` (
  `idRol` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyectoweb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `idRol` VARCHAR(8) NOT NULL DEFAULT 'UNSET',
  `idEstado` VARCHAR(8) NOT NULL DEFAULT 'REG',
  `nombres` VARCHAR(32) NOT NULL,
  `apellidos` VARCHAR(32) NOT NULL,
  `codigo` VARCHAR(8) NOT NULL,
  `correo_pucp` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(32) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultimo_login` DATETIME NULL DEFAULT NULL,
  `cant_eventos_inscritos` INT NOT NULL DEFAULT '0',
  `motivo_rechazo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `password_UNIQUE` (`contraseña` ASC) VISIBLE,
  UNIQUE INDEX `correo_pucp_UNIQUE` (`correo_pucp` ASC) VISIBLE,
  INDEX `fk_Usuarios_Estado_Usuario1_idx` (`idEstado` ASC) VISIBLE,
  INDEX `fk_Usuarios_Rol1_idx` (`idRol` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Estado_Usuario1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `proyectoweb`.`estado_usuario` (`idEstado_Usuario`),
  CONSTRAINT `fk_Usuarios_Rol1`
    FOREIGN KEY (`idRol`)
    REFERENCES `proyectoweb`.`rol` (`idRol`))
ENGINE = InnoDB
AUTO_INCREMENT = 108
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyectoweb`.`actividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`actividad` (
  `idActividad` VARCHAR(8) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `banner` LONGBLOB NULL DEFAULT NULL,
  `miniatura` LONGBLOB NULL DEFAULT NULL,
  `idEncargado` INT NOT NULL,
  PRIMARY KEY (`idActividad`),
  INDEX `fk_Lista_Actividades_Usuarios1_idx` (`idEncargado` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_Actividades_Usuarios1`
    FOREIGN KEY (`idEncargado`)
    REFERENCES `proyectoweb`.`usuarios` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyectoweb`.`estado_evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`estado_evento` (
  `Id_Estado` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Id_Estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyectoweb`.`evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`evento` (
  `idEvento` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `subTitulo` VARCHAR(100) NOT NULL,
  `hora` TIME NOT NULL,
  `fecha` DATE NOT NULL,
  `lugar` VARCHAR(32) NOT NULL,
  `imagen` LONGBLOB NULL DEFAULT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  `idEstado` VARCHAR(8) NOT NULL,
  `idActividad` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`idEvento`),
  INDEX `fk_Evento_Estado_Evento1_idx` (`idEstado` ASC) VISIBLE,
  INDEX `fk_Evento_Actividad1_idx` (`idActividad` ASC) VISIBLE,
  CONSTRAINT `fk_Evento_Actividad1`
    FOREIGN KEY (`idActividad`)
    REFERENCES `proyectoweb`.`actividad` (`idActividad`),
  CONSTRAINT `fk_Evento_Estado_Evento1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `proyectoweb`.`estado_evento` (`Id_Estado`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyectoweb`.`fotos_album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`fotos_album` (
  `Id Recuerdo` VARCHAR(45) NOT NULL,
  `idEvento` INT NOT NULL,
  `Foto` LONGBLOB NULL DEFAULT NULL,
  `Descricipcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Id Recuerdo`, `idEvento`),
  INDEX `fk_Foto_Album_Evento1_idx` (`idEvento` ASC) VISIBLE,
  CONSTRAINT `fk_Foto_Album_Evento1`
    FOREIGN KEY (`idEvento`)
    REFERENCES `proyectoweb`.`evento` (`idEvento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyectoweb`.`rol_inscrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`rol_inscrito` (
  `idRol_Inscrito` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idRol_Inscrito`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyectoweb`.`inscripcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`inscripcion` (
  `idEvento` INT NOT NULL,
  `Usuario` INT NOT NULL,
  `idRol` VARCHAR(8) NOT NULL DEFAULT 'UNSET',
  `aceptado` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`idEvento`, `Usuario`),
  INDEX `fk_Lista_Eventos_has_Usuarios_Usuarios1_idx` (`Usuario` ASC) VISIBLE,
  INDEX `fk_Lista_Eventos_has_Usuarios_Lista_Eventos1_idx` (`idEvento` ASC) VISIBLE,
  INDEX `fk_Inscripciones_Rol_Inscrito1_idx` (`idRol` ASC) VISIBLE,
  CONSTRAINT `fk_Inscripciones_Rol_Inscrito1`
    FOREIGN KEY (`idRol`)
    REFERENCES `proyectoweb`.`rol_inscrito` (`idRol_Inscrito`),
  CONSTRAINT `fk_Lista_Eventos_has_Usuarios_Lista_Eventos1`
    FOREIGN KEY (`idEvento`)
    REFERENCES `proyectoweb`.`evento` (`idEvento`),
  CONSTRAINT `fk_Lista_Eventos_has_Usuarios_Usuarios1`
    FOREIGN KEY (`Usuario`)
    REFERENCES `proyectoweb`.`usuarios` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyectoweb`.`registro_donaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`registro_donaciones` (
  `idRegistro_Donaciones` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  `comprobante` LONGBLOB NULL DEFAULT NULL,
  `monto` DOUBLE NOT NULL DEFAULT '0',
  `comprobado` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`idRegistro_Donaciones`),
  INDEX `fk_Registro_Donaciones_Usuarios1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Donaciones_Usuarios1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyectoweb`.`usuarios` (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyectoweb`.`token_generado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`token_generado` (
  `idTokens` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  `token` INT NOT NULL,
  PRIMARY KEY (`idTokens`),
  INDEX `fk_Tokens generados_Usuarios1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Tokens generados_Usuarios1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyectoweb`.`usuarios` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
