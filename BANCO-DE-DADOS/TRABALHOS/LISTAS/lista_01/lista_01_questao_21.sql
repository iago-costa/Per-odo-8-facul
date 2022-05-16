-- MySQL Script generated by MySQL Workbench
-- Sun May 15 21:37:12 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Aluno` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `matricula` INT NOT NULL,
  `telefone` VARCHAR(45) NULL,
  `enderecoRua` VARCHAR(45) NULL,
  `enderecoNumero` VARCHAR(45) NULL,
  `enderecoComplemento` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `Alunoscol` VARCHAR(45) NULL,
  `Escola_cnpj` INT NOT NULL,
  `Turma_codigo` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_Alunos_Escolas_idx` (`Escola_cnpj` ASC) VISIBLE,
  INDEX `fk_Alunos_Turmas1_idx` (`Turma_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_Escolas`
    FOREIGN KEY (`Escola_cnpj`)
    REFERENCES `mydb`.`Escola` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alunos_Turmas1`
    FOREIGN KEY (`Turma_codigo`)
    REFERENCES `mydb`.`Turma` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Disciplina` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Disciplina` (
  `codigo` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NULL,
  `carga_horaria` VARCHAR(45) NULL,
  `ementa` VARCHAR(45) NULL,
  `Professor_matricula` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_Disciplinas_Professores1_idx` (`Professor_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Disciplinas_Professores1`
    FOREIGN KEY (`Professor_matricula`)
    REFERENCES `mydb`.`Professor` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Escola`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Escola` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Escola` (
  `cnpj` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`cnpj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Professor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `matricula` INT NOT NULL,
  `cpf` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `Escola_cnpj` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_Professores_Escolas1_idx` (`Escola_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_Professores_Escolas1`
    FOREIGN KEY (`Escola_cnpj`)
    REFERENCES `mydb`.`Escola` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Turma` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Turma` (
  `codigo` VARCHAR(45) NOT NULL,
  `sala` VARCHAR(45) NULL,
  `turno` VARCHAR(45) NULL,
  `Disciplina_codigo` VARCHAR(45) NOT NULL,
  `data_inicio` DATE NULL,
  `data_fim` DATE NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_Turmas_Disciplinas1_idx` (`Disciplina_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_Turmas_Disciplinas1`
    FOREIGN KEY (`Disciplina_codigo`)
    REFERENCES `mydb`.`Disciplina` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
