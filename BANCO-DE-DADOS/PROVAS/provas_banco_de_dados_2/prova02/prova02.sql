
CREATE DATABASE `prova02`;
USE `prova02`;
SHOW DATABASES;

DROP TABLE IF EXISTS `prova02`.`tab_funcionario`;
DROP TABLE IF EXISTS `prova02`.`tab_cliente`;
DROP TABLE IF EXISTS `prova02`.`tab_retirada`;
DROP TABLE IF EXISTS `prova02`.`tab_pessoa`;
DROP TABLE IF EXISTS `prova02`.`tab_medicamento`;

-- Tabela Pessoa
-- DROP TABLE IF EXISTS `prova02`.`tab_pessoa`;
CREATE TABLE IF NOT EXISTS `prova02`.`tab_pessoa` (
    `id_pessoa` INT AUTO_INCREMENT NOT NULL,
    `endereco` VARCHAR(45),
    `telefone` VARCHAR(45),
    `cpf` VARCHAR(45),
    `nome` VARCHAR(45),
    `email` VARCHAR(45),
    PRIMARY KEY(`id_pessoa`)
);
INSERT INTO `prova02`.`tab_pessoa` (`endereco`, `telefone`, `cpf`, `nome`, `email`) VALUES ('rua X', '0000', '555', 'Cicrano', 'cicrano@gmail.com');
INSERT INTO `prova02`.`tab_pessoa` (`endereco`, `telefone`, `cpf`, `nome`, `email`) VALUES ('rua Y', '1111', '333', 'Fulano', 'fulano@gmail.com');
INSERT INTO `prova02`.`tab_pessoa` (`endereco`, `telefone`, `cpf`, `nome`, `email`) VALUES ('rua Z', '2222', '444', 'Fulano2', 'fulano2@gmail.com');
INSERT INTO `prova02`.`tab_pessoa` (`endereco`, `telefone`, `cpf`, `nome`, `email`) VALUES ('rua W', '3333', '555', 'Fulano3', 'fulano3@gmail.com');
SELECT * FROM `prova02`.`tab_pessoa`;


-- Tabela Funcionario
-- DROP TABLE IF EXISTS `prova02`.`tab_funcionario`;
CREATE TABLE IF NOT EXISTS `prova02`.`tab_funcionario` (
    `id_funcionario` INT AUTO_INCREMENT NOT NULL,
    `login` VARCHAR(45),
    `senha` VARCHAR(45),
    `tipo` VARCHAR(45),
    `id_pessoa` INT,
    CONSTRAINT `fk_pessoa_id_tab_pessoa`
        FOREIGN KEY (`id_pessoa`)
        REFERENCES `prova02`.`tab_pessoa` (`id_pessoa`),
    PRIMARY KEY(`id_funcionario`)
);
INSERT INTO `prova02`.`tab_funcionario` (`login`, `senha`, `tipo`, `id_pessoa`) VALUES ('rua X', 'senhaX', 'Gerente', 1);
INSERT INTO `prova02`.`tab_funcionario` (`login`, `senha`, `tipo`, `id_pessoa`) VALUES ('rua Y', 'senhaY', 'Atendente', 2);
SELECT * FROM `prova02`.`tab_funcionario`;


-- Tabela cliente
-- DROP TABLE IF EXISTS `prova02`.`tab_cliente`;
CREATE TABLE IF NOT EXISTS `prova02`.`tab_cliente` (
    `id_cliente` INT AUTO_INCREMENT,
    `cartao_sus` VARCHAR(45),
    `id_pessoa` INT,
    CONSTRAINT `fk_pessoa_id_tab_cliente`
        FOREIGN KEY (`id_pessoa`)
        REFERENCES `prova02`.`tab_pessoa` (`id_pessoa`),
    PRIMARY KEY(`id_cliente`)
);
INSERT INTO `prova02`.`tab_cliente` (`cartao_sus`, `id_pessoa`) VALUES ('0001', 3);
INSERT INTO `prova02`.`tab_cliente` (`cartao_sus`, `id_pessoa`) VALUES ('2323', 4);
SELECT * FROM `prova02`.`tab_cliente`;


-- Tabela medicamento
-- DROP TABLE IF EXISTS `prova02`.`tab_medicamento`;
CREATE TABLE IF NOT EXISTS `prova02`.`tab_medicamento` (
    `id_medicamento` INT AUTO_INCREMENT NOT NULL,
    `descricao` VARCHAR(45),
    `validade` VARCHAR(45),
    `nome` VARCHAR(45),
    `qtd_disponivel` INT,
    `lote` VARCHAR(45),
    PRIMARY KEY(`id_medicamento`)
);
INSERT INTO `prova02`.`tab_medicamento` (`descricao`, `validade`, `nome`, `qtd_disponivel`, `lote`) VALUES ('descricaoX', 'validadeX', 'nomeMedicamentoX', 23, 'loteX');
INSERT INTO `prova02`.`tab_medicamento` (`descricao`, `validade`, `nome`, `qtd_disponivel`, `lote`) VALUES ('descricaoY', 'validadeY', 'nomeMedicamentoY', 10, 'loteY');
SELECT * FROM `prova02`.`tab_medicamento`;


-- Tabela retirada
-- DROP TABLE IF EXISTS `prova02`.`tab_retirada`;
CREATE TABLE IF NOT EXISTS `prova02`.`tab_retirada` (
    `id_retirada` INT AUTO_INCREMENT NOT NULL,
    `cpf_cliente` VARCHAR(45),
    `data` DATE,
    `qtd_retirada` INT,
    `id_pessoa` INT,
    `id_medicamento` INT,
    CONSTRAINT `fk_pessoa_id_tab_retirada`
        FOREIGN KEY (`id_pessoa`)
        REFERENCES `prova02`.`tab_pessoa` (`id_pessoa`),
    CONSTRAINT `fk_medicamento_id_tab_medicamento`
        FOREIGN KEY (`id_medicamento`)
        REFERENCES `prova02`.`tab_medicamento` (`id_medicamento`),
    PRIMARY KEY(`id_retirada`)
);
INSERT INTO `prova02`.`tab_retirada` (`cpf_cliente`, `data`, `qtd_retirada`, `id_pessoa`, `id_medicamento`) VALUES ('0001', '2022/05/18', 3, 3, 1);
INSERT INTO `prova02`.`tab_retirada` (`cpf_cliente`, `data`, `qtd_retirada`, `id_pessoa`, `id_medicamento`) VALUES ('0001', '2022/05/18', 3, 4, 2);
SELECT * FROM `prova02`.`tab_retirada`;
ALTER TABLE `prova02`.`tab_retirada` ADD COLUMN `nome_atendente` VARCHAR(45);
UPDATE `prova02`.`tab_retirada` SET `nome_atendente` = 'Fulano_de_tal' WHERE `tab_retirada`.`id_retirada` = 1;
UPDATE `prova02`.`tab_retirada` SET `nome_atendente` = 'Fulano_de_tal2' WHERE `tab_retirada`.`id_retirada` = 2;
SELECT * FROM `prova02`.`tab_retirada`;



