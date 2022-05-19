CREATE DATABASE prova01;

USE prova01;


-- TABELA tab_funcionario
DROP TABLE IF EXISTS `tab_funcionario`;
SELECT * FROM `prova01`.`tab_funcionario`;
INSERT INTO `prova01`.`tab_funcionario` (`nome`,`estado_civil`) VALUES ('Fulano','Solteiro');
INSERT INTO `prova01`.`tab_funcionario` (`nome`,`estado_civil`) VALUES ('Cicrano','Casado');
ALTER TABLE `prova01`.`tab_funcionario` DROP COLUMN `id`;
ALTER TABLE `prova01`.`tab_funcionario` ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`id`);
CREATE TABLE IF NOT EXISTS `prova01`.`tab_funcionario` (
    `id` INT AUTO_INCREMENT,
    `nome` VARCHAR(155) NOT NULL,
    `estado_civil` VARCHAR(25) NOT NULL,
    -- `nome_conjuge` VARCHAR(155),
    -- `data_nascimento` DATE NOT NULL,
    -- `sexo` CHAR(1) NOT NULL,
    -- `escolaridade` VARCHAR(55) NOT NULL,
    -- `naturalidade` VARCHAR(55) NOT NULL,
    -- `nome_mae` VARCHAR(155),
    -- `nome_pai` VARCHAR(155),
    PRIMARY KEY(`id`)
);



-- TABELA tab_empresa
DROP TABLE IF EXISTS `tab_empresa`;
SELECT * FROM `prova01`.`tab_empresa`;
INSERT INTO `prova01`.`tab_empresa` (`nome`, `cnpj`, `cep`) VALUES ('empresaX','01230','23405');
INSERT INTO `prova01`.`tab_empresa` (`nome`, `cnpj`, `cep`) VALUES ('empresaY','0657','12487');
UPDATE `prova01`.`tab_empresa` SET `nome` = 'empresaX' WHERE `tab_empresa`.`nome` = 'empresaZ';
ALTER TABLE `prova01`.`tab_empresa` DROP COLUMN `empresa_cod`;
ALTER TABLE `prova01`.`tab_empresa` ADD COLUMN `empresa_cod` INT NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`empresa_cod`);
CREATE TABLE IF NOT EXISTS `prova01`.`tab_empresa` (
    `empresa_cod` INT AUTO_INCREMENT,
    `nome` VARCHAR(155) NOT NULL,
    `cnpj` VARCHAR(20) NOT NULL,
    `cep` VARCHAR(8) NOT NULL,
    PRIMARY KEY(`empresa_cod`)
);



-- TABELA tab_funcao
DROP TABLE IF EXISTS `tab_funcao`;
SELECT * FROM `prova01`.`tab_funcao`;
INSERT INTO `prova01`.`tab_funcao` (`nome`, `empresa_cod`, `salario_base`) VALUES ('funcaoX', 1, 1500.0);
INSERT INTO `prova01`.`tab_funcao` (`nome`, `empresa_cod`, `salario_base`) VALUES ('funcaoX', 2, 2500.0);
UPDATE `prova01`.`tab_funcao` SET `nome` = 'funcaoY' WHERE `tab_funcao`.`nome` = 'funcaoX';
ALTER TABLE `prova01`.`tab_funcao` DROP COLUMN `funcao_cod`;
ALTER TABLE `prova01`.`tab_funcao` ADD COLUMN `funcao_cod` INT NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`funcao_cod`);
CREATE TABLE IF NOT EXISTS `prova01`.`tab_funcao` (
    `funcao_cod` INT AUTO_INCREMENT,
    `nome` VARCHAR(155) NOT NULL,
    `empresa_cod` INT NOT NULL,
    `salario_base` DOUBLE(10,2) NOT NULL,
    PRIMARY KEY(`funcao_cod`),
    CONSTRAINT `fk_empresa_cod_tab_empresa`
        FOREIGN KEY (`empresa_cod`)
        REFERENCES `prova01`.`tab_empresa` (`empresa_cod`)
);



-- TABELA tab_trabalho
DROP TABLE IF EXISTS `tab_trabalho`;
SELECT * FROM `prova01`.`tab_trabalho`;
INSERT INTO `prova01`.`tab_funcao` (`empresa_cod`, `funcao_cod`, `local_trabalho_id`, `funcionario_id`, `data_admissao`) VALUES (1, 1, 1, 1, '2022/05/10');
INSERT INTO `prova01`.`tab_funcao` (`empresa_cod`, `funcao_cod`, `local_trabalho_id`, `funcionario_id`, `data_admissao`) VALUES (1, 1, 1, 1, '2022/05/15');
UPDATE `prova01`.`tab_funcao` SET `data_admissao` = '2022/09/11' WHERE `tab_funcao`.`nome` = '2022/05/10';
ALTER TABLE `prova01`.`tab_trabalho` DROP COLUMN `data_admissao`;
ALTER TABLE `prova01`.`tab_trabalho` ADD COLUMN `data_admissao` DATE NOT NULL;
CREATE TABLE IF NOT EXISTS `prova01`.`tab_trabalho` (
    `empresa_cod` INT,
    `funcao_cod` INT,
    `local_trabalho_id` INT,
    `funcionario_id` INT,
    `data_admissao` DATETIME NOT NULL,
    CONSTRAINT `fk_empresa_cod_tab_empresa`
        FOREIGN KEY (`empresa_cod`)
        REFERENCES `prova01`.`tab_empresa` (`empresa_cod`),
    CONSTRAINT `fk_funcao_cod_tab_funcao`
        FOREIGN KEY (`funcao_cod`)
        REFERENCES `prova01`.`tab_funcao` (`funcao_cod`),
    CONSTRAINT `fk_local_trabalho_id_tab_local_trabalho`
        FOREIGN KEY (`local_trabalho_id`)
        REFERENCES `prova01`.`tab_empresa` (`local_trabalho_id`),
    CONSTRAINT `fk_funcionario_id_tab_funcionario`
        FOREIGN KEY (`funcionario_id`)
        REFERENCES `prova01`.`tab_empresa` (`funcionario_id`)
);



-- TABELA tab_documentos
DROP TABLE IF EXISTS `tab_documentos`;
SELECT * FROM `prova01`.`tab_documentos`;
INSERT INTO `prova01`.`tab_funcao` (`cpf`, `pis`, `rg`) VALUES ('945839', '938324', '23467');
INSERT INTO `prova01`.`tab_funcao` (`cpf`, `pis`, `rg`) VALUES ('000', '0000', '00000');
UPDATE `prova01`.`tab_funcao` SET `rg` = '3674567' WHERE `tab_funcao`.`rg` = '23467';
ALTER TABLE `prova01`.`tab_documentos` DROP COLUMN `cpf`;
ALTER TABLE `prova01`.`tab_documentos` ADD COLUMN `cpf` INT NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`cpf`);
CREATE TABLE IF NOT EXISTS `prova01`.`tab_documentos` (
    `cpf` VARCHAR(14),
    `pis` VARCHAR(14) NOT NULL,
    `rg` VARCHAR(13) NOT NULL,
    `funcionario_id` INT,
    PRIMARY KEY(`cpf`),
    CONSTRAINT `fk_funcionario_id_tab_funcionario`
        FOREIGN KEY (`funcionario_id`)
        REFERENCES `prova01`.`tab_empresa` (`funcionario_id`)
);



-- TABELA tab_dependentes
DROP TABLE IF EXISTS `tab_dependentes`;
SELECT * FROM `prova01`.`tab_dependentes`;
INSERT INTO `prova01`.`tab_funcao` (`dependente1`, `funcionario_id`, `salario_base`) VALUES ('dependente1', 1);
INSERT INTO `prova01`.`tab_funcao` (`dependente1`, `funcionario_id`, `salario_base`) VALUES ('dependente2', 2);
UPDATE `prova01`.`tab_funcao` SET `nome` = 'funcaoY' WHERE `tab_funcao`.`nome` = 'funcaoX';
ALTER TABLE `prova01`.`tab_dependentes` DROP COLUMN `dependente1`;
ALTER TABLE `prova01`.`tab_dependentes` ADD COLUMN `dependente1` VARCHAR(255);
CREATE TABLE IF NOT EXISTS `prova01`.`tab_dependentes` (
    `dependente1` VARCHAR(155),
    `funcionario_id` INT,
    CONSTRAINT `fk_funcionario_id_tab_funcionario`
        FOREIGN KEY (`funcionario_id`)
        REFERENCES `prova01`.`tab_empresa` (`funcionario_id`)
);



-- TABELA tab_local_trabalho
DROP TABLE IF EXISTS `tab_local_trabalho`;
SELECT * FROM `prova01`.`tab_local_trabalho`;
INSERT INTO `prova01`.`tab_funcao` (`cc`, `local`, `cep`) VALUES (1, 'localTeste', 'cepTeste');
INSERT INTO `prova01`.`tab_funcao` (`cc`, `local`, `cep`) VALUES (2, 'localTeste2', 'cepTeste2');
UPDATE `prova01`.`tab_funcao` SET `cc` = 4 WHERE `tab_funcao`.`cc` = 2;
ALTER TABLE `prova01`.`tab_local_trabalho` DROP COLUMN `id`;
ALTER TABLE `prova01`.`tab_local_trabalho` ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`id`);
CREATE TABLE IF NOT EXISTS `prova01`.`tab_local_trabalho` (
    `id` INT AUTO_INCREMENT,
    `cc` INT NOT NULL,
    `local` VARCHAR(155) NOT NULL,
    `cep` VARCHAR(8) NOT NULL,
    PRIMARY KEY(`id`)
);