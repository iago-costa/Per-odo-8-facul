CREATE DATABASE IF NOT EXISTS `prova04`;


-- -----------------------------------------------------
-- Table `prova04`.`imposto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prova04`.`imposto`;
CREATE TABLE IF NOT EXISTS `prova04`.`imposto` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `nome` VARCHAR(45) NULL,
    `descricao` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
);
INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('ICMS', 'Imposto01');
INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('IPI', 'Imposto02');
INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('ISS', 'Imposto03');
INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('PIS', 'Imposto04');

INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('COFINS', 'Imposto01');
INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('IR', 'Imposto02');
INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('CSLL', 'Imposto03');
INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('INSS', 'Imposto04');

INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('IRPJ', 'Imposto01');
INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('ISSQN', 'Imposto02');
INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('PISCOFINS', 'Imposto03');
INSERT INTO `prova04`.`imposto` (`nome`, `descricao`) VALUES ('ICMSST', 'Imposto04');
SELECT * FROM `prova04`.`imposto`;


-- -----------------------------------------------------
-- Table `prova04`.`imposto_federal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prova04`.`imposto_federal`;
CREATE TABLE IF NOT EXISTS `prova04`.`imposto_federal` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `cod_imposto` VARCHAR(45) NULL,
    `valor` DOUBLE NULL,
    `id_imposto` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_imposto_federal_imposto` FOREIGN KEY (`id_imposto`) REFERENCES `prova04`.`imposto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO `prova04`.`imposto_federal` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0001', 23.00, 1);
INSERT INTO `prova04`.`imposto_federal` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0002', 43.00, 2);
INSERT INTO `prova04`.`imposto_federal` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0003', 73.00, 3);
INSERT INTO `prova04`.`imposto_federal` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0004', 103.00, 4);
SELECT * FROM `prova04`.`imposto_federal`;


-- -----------------------------------------------------
-- Table `prova04`.`impostos_estadual`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prova04`.`imposto_estadual`;
CREATE TABLE IF NOT EXISTS `prova04`.`imposto_estadual` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `cod_imposto` VARCHAR(45) NULL,
    `valor` DOUBLE NULL,
    `id_imposto` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_imposto_estadual_imposto` FOREIGN KEY (`id_imposto`) REFERENCES `prova04`.`imposto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO `prova04`.`imposto_estadual` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0001', 15.00, 5);
INSERT INTO `prova04`.`imposto_estadual` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0002', 35.00, 6);
INSERT INTO `prova04`.`imposto_estadual` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0003', 55.00, 7);
INSERT INTO `prova04`.`imposto_estadual` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0004', 75.00, 8);
SELECT * FROM `prova04`.`imposto_estadual`;


-- -----------------------------------------------------
-- Table `prova04`.`impostos_municipal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prova04`.`imposto_municipal`;
CREATE TABLE IF NOT EXISTS `prova04`.`imposto_municipal` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `cod_imposto` VARCHAR(45) NULL,
    `valor` DOUBLE NULL,
    `id_imposto` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_imposto_municipal_imposto` FOREIGN KEY (`id_imposto`) REFERENCES `prova04`.`imposto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO `prova04`.`imposto_municipal` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0001', 10.00, 9);
INSERT INTO `prova04`.`imposto_municipal` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0002', 20.00, 10);
INSERT INTO `prova04`.`imposto_municipal` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0003', 30.00, 11);
INSERT INTO `prova04`.`imposto_municipal` (`cod_imposto`, `valor`, `id_imposto`) VALUES ('0004', 40.00, 12);
SELECT * FROM `prova04`.`imposto_municipal`;


-- -----------------------------------------------------
-- Table `prova04`.`conta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prova04`.`conta`;
CREATE TABLE IF NOT EXISTS `prova04`.`conta` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `nome` VARCHAR(45) NULL,
    `descricao` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
);
INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta01', 'conta01 descricao');
INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta02', 'conta02 descricao');
INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta03', 'conta03 descricao');
INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta04', 'conta04 descricao');

INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta05', 'conta01 descricao');
INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta06', 'conta02 descricao');
INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta07', 'conta03 descricao');
INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta08', 'conta04 descricao');

INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta09', 'conta01 descricao');
INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta10', 'conta02 descricao');
INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta11', 'conta03 descricao');
INSERT INTO `prova04`.`conta` (`nome`, `descricao`) VALUES ('conta12', 'conta04 descricao');
SELECT * FROM `prova04`.`conta`;


-- -----------------------------------------------------
-- Table `prova04`.`conta_a_receber`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prova04`.`conta_a_receber`;
CREATE TABLE IF NOT EXISTS `prova04`.`conta_a_receber` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `cod_conta` VARCHAR(45) NULL,
    `valor` DOUBLE NULL,
    `id_conta` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_conta_a_receber_imposto` FOREIGN KEY (`id_conta`) REFERENCES `prova04`.`conta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO `prova04`.`conta_a_receber` (`cod_conta`, `valor`, `id_conta`) VALUES ('0001', 15.00, 1);
INSERT INTO `prova04`.`conta_a_receber` (`cod_conta`, `valor`, `id_conta`) VALUES ('0002', 35.00, 2);
INSERT INTO `prova04`.`conta_a_receber` (`cod_conta`, `valor`, `id_conta`) VALUES ('0003', 55.00, 3);
INSERT INTO `prova04`.`conta_a_receber` (`cod_conta`, `valor`, `id_conta`) VALUES ('0004', 75.00, 4);
SELECT * FROM `prova04`.`conta_a_receber`;


-- -----------------------------------------------------
-- Table `prova04`.`conta_a_pagar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prova04`.`conta_a_pagar`;
CREATE TABLE IF NOT EXISTS `prova04`.`conta_a_pagar` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `cod_conta` VARCHAR(45) NULL,
    `valor` DOUBLE NULL,
    `id_conta` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_conta_a_pagar_imposto` FOREIGN KEY (`id_conta`) REFERENCES `prova04`.`conta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO `prova04`.`conta_a_pagar` (`cod_conta`, `valor`, `id_conta`) VALUES ('0001', 25.00, 5);
INSERT INTO `prova04`.`conta_a_pagar` (`cod_conta`, `valor`, `id_conta`) VALUES ('0002', 65.00, 6);
INSERT INTO `prova04`.`conta_a_pagar` (`cod_conta`, `valor`, `id_conta`) VALUES ('0003', 15.00, 7);
INSERT INTO `prova04`.`conta_a_pagar` (`cod_conta`, `valor`, `id_conta`) VALUES ('0004', 95.00, 8);
SELECT * FROM `prova04`.`conta_a_pagar`;

-- -----------------------------------------------------
-- Table `prova04`.`conta_paga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prova04`.`conta_paga`;
CREATE TABLE IF NOT EXISTS `prova04`.`conta_paga` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `cod_conta` VARCHAR(45) NULL,
    `valor` DOUBLE NULL,
    `id_conta` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_conta_paga_imposto` FOREIGN KEY (`id_conta`) REFERENCES `prova04`.`conta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO `prova04`.`conta_paga` (`cod_conta`, `valor`, `id_conta`) VALUES ('0001', 85.00, 9);
INSERT INTO `prova04`.`conta_paga` (`cod_conta`, `valor`, `id_conta`) VALUES ('0002', 75.00, 10);
INSERT INTO `prova04`.`conta_paga` (`cod_conta`, `valor`, `id_conta`) VALUES ('0003', 65.00, 11);
INSERT INTO `prova04`.`conta_paga` (`cod_conta`, `valor`, `id_conta`) VALUES ('0004', 35.00, 12);
SELECT * FROM `prova04`.`conta_paga`;




-- SUM(valor) ; COUNT(*) ; AVG(valor) ; MIN(valor) ; MAX(valor) ;


-- SELECT SUM(`valor`) FROM `prova04`.`imposto_federal` ;
-- SELECT AVG(`valor`) FROM `prova04`.`imposto_federal`;
-- SELECT MIN(`valor`) FROM `prova04`.`imposto_federal`;
-- SELECT MAX(`valor`) FROM `prova04`.`imposto_federal`;
-- SELECT COUNT(*) FROM `prova04`.`imposto_federal`;

-- SELECT SUM(`valor`) FROM `prova04`.`imposto_estadual` ;
-- SELECT AVG(`valor`) FROM `prova04`.`imposto_estadual`;
-- SELECT MIN(`valor`) FROM `prova04`.`imposto_estadual`;
-- SELECT MAX(`valor`) FROM `prova04`.`imposto_estadual`;
-- SELECT COUNT(*) FROM `prova04`.`imposto_estadual`;

-- SELECT SUM(`valor`) FROM `prova04`.`imposto_municipal` ;
-- SELECT AVG(`valor`) FROM `prova04`.`imposto_municipal`;
-- SELECT MIN(`valor`) FROM `prova04`.`imposto_municipal`;
-- SELECT MAX(`valor`) FROM `prova04`.`imposto_municipal`;
-- SELECT COUNT(*) FROM `prova04`.`imposto_municipal`;


-- SELECT SUM(`valor`) FROM `prova04`.`conta_a_receber` ;
-- SELECT AVG(`valor`) FROM `prova04`.`conta_a_receber`;
-- SELECT MIN(`valor`) FROM `prova04`.`conta_a_receber`;
-- SELECT MAX(`valor`) FROM `prova04`.`conta_a_receber`;
-- SELECT COUNT(*) FROM `prova04`.`conta_a_receber`;

-- SELECT SUM(`valor`) FROM `prova04`.`conta_a_pagar` ;
-- SELECT AVG(`valor`) FROM `prova04`.`conta_a_pagar`;
-- SELECT MIN(`valor`) FROM `prova04`.`conta_a_pagar`;
-- SELECT MAX(`valor`) FROM `prova04`.`conta_a_pagar`;
-- SELECT COUNT(*) FROM `prova04`.`conta_a_pagar`;

-- SELECT SUM(`valor`) FROM `prova04`.`conta_paga` ;
-- SELECT AVG(`valor`) FROM `prova04`.`conta_paga`;
-- SELECT MIN(`valor`) FROM `prova04`.`conta_paga`;
-- SELECT MAX(`valor`) FROM `prova04`.`conta_paga`;
-- SELECT COUNT(*) FROM `prova04`.`conta_paga`;


-- SELECT SUM(`valor`) FROM `prova04`.`conta_a_receber` GROUP BY `id_conta` ORDER BY `id_conta` ASC;
-- SELECT AVG(`valor`) FROM `prova04`.`conta_a_receber` GROUP BY `id_conta` ORDER BY `id_conta` DESC;
-- SELECT MIN(`valor`) FROM `prova04`.`conta_a_receber` WHERE(`valor`)>20 GROUP BY `id_conta` HAVING MIN(`valor`)>35 ORDER BY `valor` DESC;
-- SELECT MAX(`valor`) FROM `prova04`.`conta_a_receber`;
-- SELECT COUNT(*) FROM `prova04`.`conta_a_receber`;

-- SELECT SUM(`valor`) FROM `prova04`.`conta_a_pagar` ;
-- SELECT AVG(`valor`) FROM `prova04`.`conta_a_pagar`;
-- SELECT MIN(`valor`) FROM `prova04`.`conta_a_pagar`;
-- SELECT MAX(`valor`) FROM `prova04`.`conta_a_pagar`;
-- SELECT COUNT(*) FROM `prova04`.`conta_a_pagar`;

-- SELECT SUM(`valor`) FROM `prova04`.`conta_paga` ;
-- SELECT AVG(`valor`) FROM `prova04`.`conta_paga`;
-- SELECT MIN(`valor`) FROM `prova04`.`conta_paga`;
-- SELECT MAX(`valor`) FROM `prova04`.`conta_paga`;
-- SELECT COUNT(*) FROM `prova04`.`conta_paga`;