
CREATE DATABASE IF NOT EXISTS `prova04`;
USE `prova04`;
SHOW DATABASES;

DROP TABLE IF EXISTS `prova04`.`tab_funcionario`;
DROP TABLE IF EXISTS `prova04`.`tab_cliente`;
DROP TABLE IF EXISTS `prova04`.`tab_retirada`;
DROP TABLE IF EXISTS `prova04`.`tab_pessoa`;
DROP TABLE IF EXISTS `prova04`.`tab_medicamento`;

-- Tabela Pessoa
-- DROP TABLE IF EXISTS `prova04`.`tab_pessoa`;
CREATE TABLE IF NOT EXISTS `prova04`.`tab_pessoa` (
    `id_pessoa` INT AUTO_INCREMENT NOT NULL,
    `endereco` VARCHAR(45),
    `telefone` VARCHAR(45),
    `cpf` VARCHAR(45),
    `nome` VARCHAR(45),
    `email` VARCHAR(45),
    PRIMARY KEY(`id_pessoa`)
);
INSERT INTO `prova04`.`tab_pessoa` (`endereco`, `telefone`, `cpf`, `nome`, `email`) VALUES ('rua X', '0000', '555', 'Cicrano', 'cicrano@gmail.com');
INSERT INTO `prova04`.`tab_pessoa` (`endereco`, `telefone`, `cpf`, `nome`, `email`) VALUES ('rua Y', '1111', '333', 'Fulano', 'fulano@gmail.com');
INSERT INTO `prova04`.`tab_pessoa` (`endereco`, `telefone`, `cpf`, `nome`, `email`) VALUES ('rua Z', '2222', '444', 'Fulano2', 'fulano2@gmail.com');
INSERT INTO `prova04`.`tab_pessoa` (`endereco`, `telefone`, `cpf`, `nome`, `email`) VALUES ('rua W', '3333', '555', 'Fulano3', 'fulano3@gmail.com');
SELECT * FROM `prova04`.`tab_pessoa`;


-- Tabela Funcionario
-- DROP TABLE IF EXISTS `prova04`.`tab_funcionario`;
CREATE TABLE IF NOT EXISTS `prova04`.`tab_funcionario` (
    `id_funcionario` INT AUTO_INCREMENT NOT NULL,
    `login` VARCHAR(45),
    `senha` VARCHAR(45),
    `tipo` VARCHAR(45),
    `id_pessoa` INT,
    CONSTRAINT `fk_pessoa_id_tab_pessoa`
        FOREIGN KEY (`id_pessoa`)
        REFERENCES `prova04`.`tab_pessoa` (`id_pessoa`),
    PRIMARY KEY(`id_funcionario`)
);
INSERT INTO `prova04`.`tab_funcionario` (`login`, `senha`, `tipo`, `id_pessoa`) VALUES ('rua X', 'senhaX', 'Gerente', 1);
INSERT INTO `prova04`.`tab_funcionario` (`login`, `senha`, `tipo`, `id_pessoa`) VALUES ('rua Y', 'senhaY', 'Atendente', 2);
SELECT * FROM `prova04`.`tab_funcionario`;


-- Tabela cliente
-- DROP TABLE IF EXISTS `prova04`.`tab_cliente`;
CREATE TABLE IF NOT EXISTS `prova04`.`tab_cliente` (
    `id_cliente` INT AUTO_INCREMENT,
    `cartao_sus` VARCHAR(45),
    `id_pessoa` INT,
    CONSTRAINT `fk_pessoa_id_tab_cliente`
        FOREIGN KEY (`id_pessoa`)
        REFERENCES `prova04`.`tab_pessoa` (`id_pessoa`),
    PRIMARY KEY(`id_cliente`)
);
INSERT INTO `prova04`.`tab_cliente` (`cartao_sus`, `id_pessoa`) VALUES ('0001', 3);
INSERT INTO `prova04`.`tab_cliente` (`cartao_sus`, `id_pessoa`) VALUES ('2323', 4);
SELECT * FROM `prova04`.`tab_cliente`;


-- Tabela medicamento
-- DROP TABLE IF EXISTS `prova04`.`tab_medicamento`;
CREATE TABLE IF NOT EXISTS `prova04`.`tab_medicamento` (
    `id_medicamento` INT AUTO_INCREMENT NOT NULL,
    `descricao` VARCHAR(45),
    `validade` DATE,
    `nome` VARCHAR(45),
    `qtd_disponivel` INT,
    `lote` VARCHAR(45),
    PRIMARY KEY(`id_medicamento`)
);
INSERT INTO `prova04`.`tab_medicamento` (`descricao`, `validade`, `nome`, `qtd_disponivel`, `lote`) VALUES ('descricaoX', '2022/05/28', 'nomeMedicamentoX', 23, 'loteX');
INSERT INTO `prova04`.`tab_medicamento` (`descricao`, `validade`, `nome`, `qtd_disponivel`, `lote`) VALUES ('descricaoY', '2022/06/28', 'nomeMedicamentoY', 15, 'loteY');
INSERT INTO `prova04`.`tab_medicamento` (`descricao`, `validade`, `nome`, `qtd_disponivel`, `lote`) VALUES ('descricaoZ', '2022/07/05', 'nomeMedicamentoZ', 30, 'loteZ');
INSERT INTO `prova04`.`tab_medicamento` (`descricao`, `validade`, `nome`, `qtd_disponivel`, `lote`) VALUES ('descricaoW', '2022/08/08', 'nomeMedicamentoW', 50, 'loteW');
INSERT INTO `prova04`.`tab_medicamento` (`descricao`, `validade`, `nome`, `qtd_disponivel`, `lote`) VALUES ('descricaoA', '2022/09/14', 'nomeMedicamentoA', 60, 'loteA');
INSERT INTO `prova04`.`tab_medicamento` (`descricao`, `validade`, `nome`, `qtd_disponivel`, `lote`) VALUES ('descricaoB', '2022/03/19', 'nomeMedicamentoB', 86, 'loteB');

SELECT * FROM `prova04`.`tab_medicamento`;


-- Tabela retirada
-- DROP TABLE IF EXISTS `prova04`.`tab_retirada`;
CREATE TABLE IF NOT EXISTS `prova04`.`tab_retirada` (
    `id_retirada` INT AUTO_INCREMENT NOT NULL,
    `cpf_cliente` VARCHAR(45),
    `data` DATE,
    `qtd_retirada` INT,
    `id_pessoa` INT,
    `id_medicamento` INT,
    CONSTRAINT `fk_pessoa_id_tab_retirada`
        FOREIGN KEY (`id_pessoa`)
        REFERENCES `prova04`.`tab_pessoa` (`id_pessoa`),
    CONSTRAINT `fk_medicamento_id_tab_medicamento`
        FOREIGN KEY (`id_medicamento`)
        REFERENCES `prova04`.`tab_medicamento` (`id_medicamento`),
    PRIMARY KEY(`id_retirada`)
);
INSERT INTO `prova04`.`tab_retirada` (`cpf_cliente`, `data`, `qtd_retirada`, `id_pessoa`, `id_medicamento`) VALUES ('0001', '2022/07/15', 3, 3, 1);
INSERT INTO `prova04`.`tab_retirada` (`cpf_cliente`, `data`, `qtd_retirada`, `id_pessoa`, `id_medicamento`) VALUES ('0002', '2022/08/18', 3, 4, 2);
INSERT INTO `prova04`.`tab_retirada` (`cpf_cliente`, `data`, `qtd_retirada`, `id_pessoa`, `id_medicamento`) VALUES ('0002', '2022/08/18', 8, 4, 3);
INSERT INTO `prova04`.`tab_retirada` (`cpf_cliente`, `data`, `qtd_retirada`, `id_pessoa`, `id_medicamento`) VALUES ('0002', '2022/08/18', 14, 4, 3);


SELECT * FROM `prova04`.`tab_retirada`;
ALTER TABLE `prova04`.`tab_retirada` ADD COLUMN `nome_atendente` VARCHAR(45);
UPDATE `prova04`.`tab_retirada` SET `nome_atendente` = 'Fulano_de_tal' WHERE `tab_retirada`.`id_retirada` = 1;
UPDATE `prova04`.`tab_retirada` SET `nome_atendente` = 'Fulano_de_tal2' WHERE `tab_retirada`.`id_retirada` = 2;
SELECT * FROM `prova04`.`tab_retirada`;

-- inner join 
-- left join
-- right join
-- full join

SELECT `prova04`.`tab_pessoa`.`nome`, `prova04`.`tab_pessoa`.`email`, `prova04`.`tab_pessoa`.`telefone`, `prova04`.`tab_cliente`.`cartao_sus`
FROM `prova04`.`tab_pessoa`
INNER JOIN `prova04`.`tab_cliente`
ON `prova04`.`tab_pessoa`.`id_pessoa` = `prova04`.`tab_cliente`.`id_pessoa`;

SELECT * , `prova04`.`tab_cliente`.`cartao_sus` FROM `prova04`.`tab_pessoa`  
INNER JOIN `prova04`.`tab_cliente`
ON `prova04`.`tab_pessoa`.`id_pessoa` = `prova04`.`tab_cliente`.`id_pessoa`;

SELECT `prova04`.`tab_pessoa`.`nome`, `prova04`.`tab_pessoa`.`email`, `prova04`.`tab_pessoa`.`telefone`, `prova04`.`tab_cliente`.`cartao_sus`
FROM `prova04`.`tab_pessoa` 
LEFT JOIN `prova04`.`tab_cliente`
ON `prova04`.`tab_pessoa`.`id_pessoa` = `prova04`.`tab_cliente`.`id_pessoa`;

SELECT `prova04`.`tab_pessoa`.`nome`, `prova04`.`tab_pessoa`.`email`, `prova04`.`tab_pessoa`.`telefone`, `prova04`.`tab_cliente`.`cartao_sus`
FROM `prova04`.`tab_pessoa` 
RIGHT JOIN `prova04`.`tab_cliente`
ON `prova04`.`tab_pessoa`.`id_pessoa` = `prova04`.`tab_cliente`.`id_pessoa`;

-- FULL JOIN
SELECT `prova04`.`tab_pessoa`.`nome`, `prova04`.`tab_pessoa`.`email`, `prova04`.`tab_pessoa`.`telefone`, `prova04`.`tab_cliente`.`cartao_sus`
FROM `prova04`.`tab_pessoa` 
LEFT JOIN `prova04`.`tab_cliente`
ON `prova04`.`tab_pessoa`.`id_pessoa` = `prova04`.`tab_cliente`.`id_pessoa`
UNION
SELECT `prova04`.`tab_pessoa`.`nome`, `prova04`.`tab_pessoa`.`email`, `prova04`.`tab_pessoa`.`telefone`, `prova04`.`tab_cliente`.`cartao_sus`
FROM `prova04`.`tab_pessoa` 
RIGHT JOIN `prova04`.`tab_cliente`
ON `prova04`.`tab_pessoa`.`id_pessoa` = `prova04`.`tab_cliente`.`id_pessoa`;

SELECT *
FROM `prova04`.`tab_pessoa` 
LEFT JOIN `prova04`.`tab_cliente`
ON `prova04`.`tab_pessoa`.`id_pessoa` = `prova04`.`tab_cliente`.`id_pessoa`
UNION
SELECT *
FROM `prova04`.`tab_pessoa` 
RIGHT JOIN `prova04`.`tab_cliente`
ON `prova04`.`tab_pessoa`.`id_pessoa` = `prova04`.`tab_cliente`.`id_pessoa`;

SELECT `prova04`.`tab_pessoa`.`nome`, `prova04`.`tab_pessoa`.`email`, `prova04`.`tab_pessoa`.`telefone`, `prova04`.`tab_cliente`.`cartao_sus`
FROM `prova04`.`tab_pessoa` 
CROSS JOIN `prova04`.`tab_cliente`;







