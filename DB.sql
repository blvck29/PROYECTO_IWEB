-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyectoweb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectoweb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectoweb` DEFAULT CHARACTER SET utf8 ;
USE `proyectoweb` ;

-- -----------------------------------------------------
-- Table `proyectoweb`.`Estado_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Estado_Usuario` (
  `idEstado_Usuario` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idEstado_Usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoweb`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Rol` (
  `idRol` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoweb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `idRol` VARCHAR(8) NOT NULL DEFAULT 'user',
  `idEstado` VARCHAR(8) NOT NULL DEFAULT 'due',
  `nombres` VARCHAR(32) NOT NULL,
  `apellidos` VARCHAR(32) NOT NULL,
  `correo_pucp` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(32) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultimo_login` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cant_eventos_inscritos` INT NOT NULL DEFAULT 0,
  `motivo_rechazo` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `password_UNIQUE` (`contraseña` ASC) VISIBLE,
  UNIQUE INDEX `correo_pucp_UNIQUE` (`correo_pucp` ASC) VISIBLE,
  INDEX `fk_Usuarios_Estado_Usuario1_idx` (`idEstado` ASC) VISIBLE,
  INDEX `fk_Usuarios_Rol1_idx` (`idRol` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Estado_Usuario1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `proyectoweb`.`Estado_Usuario` (`idEstado_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_Rol1`
    FOREIGN KEY (`idRol`)
    REFERENCES `proyectoweb`.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `proyectoweb`.`Actividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Actividad` (
  `idActividad` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `banner` LONGBLOB NOT NULL,
  `miniatura` LONGBLOB NOT NULL,
  `idEncargado` INT NOT NULL,
  PRIMARY KEY (`idActividad`),
  INDEX `fk_Lista_Actividades_Usuarios1_idx` (`idEncargado` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_Actividades_Usuarios1`
    FOREIGN KEY (`idEncargado`)
    REFERENCES `proyectoweb`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoweb`.`Estado_Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Estado_Evento` (
  `Id_Estado` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Id_Estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoweb`.`Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Evento` (
  `idEvento` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `sub-titulo` VARCHAR(100) NOT NULL,
  `hora` DATETIME NOT NULL,
  `fecha` DATE NOT NULL,
  `lugar` VARCHAR(32) NOT NULL,
  `imagen` LONGBLOB NOT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  `id_Estado` VARCHAR(8) NOT NULL,
  `idActividad` INT NOT NULL,
  `idEncargado` INT NOT NULL,
  `acepta_inscritos` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idEvento`),
  INDEX `fk_Lista_Eventos_Lista_Actividades1_idx` (`idActividad` ASC) VISIBLE,
  INDEX `fk_Lista_Eventos_Usuarios1_idx` (`idEncargado` ASC) VISIBLE,
  INDEX `fk_Evento_Estado_Evento1_idx` (`id_Estado` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_Eventos_Lista_Actividades1`
    FOREIGN KEY (`idActividad`)
    REFERENCES `proyectoweb`.`Actividad` (`idActividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lista_Eventos_Usuarios1`
    FOREIGN KEY (`idEncargado`)
    REFERENCES `proyectoweb`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_Estado_Evento1`
    FOREIGN KEY (`id_Estado`)
    REFERENCES `proyectoweb`.`Estado_Evento` (`Id_Estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoweb`.`Rol_Inscrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Rol_Inscrito` (
  `idRol_Inscrito` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idRol_Inscrito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoweb`.`Inscripcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Inscripcion` (
  `idEvento` INT NOT NULL,
  `Usuario` INT NOT NULL,
  `idRol` VARCHAR(8) NULL,
  `aceptado` TINYINT NULL,
  PRIMARY KEY (`idEvento`, `Usuario`),
  INDEX `fk_Lista_Eventos_has_Usuarios_Usuarios1_idx` (`Usuario` ASC) VISIBLE,
  INDEX `fk_Lista_Eventos_has_Usuarios_Lista_Eventos1_idx` (`idEvento` ASC) VISIBLE,
  INDEX `fk_Inscripciones_Rol_Inscrito1_idx` (`idRol` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_Eventos_has_Usuarios_Lista_Eventos1`
    FOREIGN KEY (`idEvento`)
    REFERENCES `proyectoweb`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lista_Eventos_has_Usuarios_Usuarios1`
    FOREIGN KEY (`Usuario`)
    REFERENCES `proyectoweb`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inscripciones_Rol_Inscrito1`
    FOREIGN KEY (`idRol`)
    REFERENCES `proyectoweb`.`Rol_Inscrito` (`idRol_Inscrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoweb`.`Registro_Donaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Registro_Donaciones` (
  `idRegistro_Donaciones` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `comprobante` LONGBLOB NOT NULL,
  `monto` DOUBLE NOT NULL DEFAULT 0.00,
  `comprobado` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idRegistro_Donaciones`),
  INDEX `fk_Registro_Donaciones_Usuarios1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Donaciones_Usuarios1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyectoweb`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoweb`.`Registro_Donaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Registro_Donaciones` (
  `idRegistro_Donaciones` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `comprobante` LONGBLOB NOT NULL,
  `monto` DOUBLE NOT NULL DEFAULT 0.00,
  `comprobado` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idRegistro_Donaciones`),
  INDEX `fk_Registro_Donaciones_Usuarios1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Donaciones_Usuarios1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyectoweb`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoweb`.`Token_Generado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Token_Generado` (
  `idTokens` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  `token` INT NOT NULL,
  PRIMARY KEY (`idTokens`),
  INDEX `fk_Tokens generados_Usuarios1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Tokens generados_Usuarios1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyectoweb`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoweb`.`Fotos_Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoweb`.`Fotos_Album` (
  `Id Recuerdo` VARCHAR(45) NOT NULL,
  `idEvento` INT NOT NULL,
  `Foto` LONGBLOB NOT NULL,
  `Descricipcion` VARCHAR(45) NULL,
  PRIMARY KEY (`Id Recuerdo`, `idEvento`),
  INDEX `fk_Foto_Album_Evento1_idx` (`idEvento` ASC) VISIBLE,
  CONSTRAINT `fk_Foto_Album_Evento1`
    FOREIGN KEY (`idEvento`)
    REFERENCES `proyectoweb`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
