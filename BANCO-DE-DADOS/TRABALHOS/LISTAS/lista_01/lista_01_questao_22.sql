-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
INSERT INTO `mydb`.`Aluno` (`matricula`, `telefone`, `enderecoRua`, `enderecoNumero`, `enderecoComplemento`, `nome`, `Alunoscol`, `Escola_cnpj`, `Turma_codigo`) VALUES (1, '', '', '', '', '', '', 1, 1);
INSERT INTO `mydb`.`Aluno` (`matricula`, `telefone`, `enderecoRua`, `enderecoNumero`, `enderecoComplemento`, `nome`, `Alunoscol`, `Escola_cnpj`, `Turma_codigo`) VALUES (2, '', '', '', '', '', '', 1, 1);

UPDATE `mydb`.`Aluno` SET `matricula` = 1 WHERE `Aluno`.`matricula` = 1;


-- -----------------------------------------------------
-- Table `mydb`.`Disciplina`
-- -----------------------------------------------------
INSERT INTO `mydb`.`Disciplina` (`codigo`, `nome`, `carga_horaria`, `ementa`, `Professor_matricula`) VALUES ('1', 'Matematica', '100', 'Matematica', '1');
INSERT INTO `mydb`.`Disciplina` (`codigo`, `nome`, `carga_horaria`, `ementa`, `Professor_matricula`) VALUES ('2', 'Portugues', '100', 'Portugues', '1');

UPDATE `mydb`.`Disciplina` SET `codigo` = '1' WHERE `Disciplina`.`codigo` = '1';


-- -----------------------------------------------------
-- Table `mydb`.`Escola`
-- -----------------------------------------------------
INSERT INTO `mydb`.`Escola` (`cnpj`, `endereco`, `telefone`, `nome`) VALUES ('123456789', 'Rua da Escola', '123456789', 'Escola Teste');
INSERT INTO `mydb`.`Escola` (`cnpj`, `endereco`, `telefone`, `nome`) VALUES ('987654321', 'Rua da Escola', '123456789', 'Escola Teste');

UPDATE `mydb`.`Escola` SET `cnpj` = '123456789' WHERE `Escola`.`cnpj` = '123456789';


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
INSERT INTO `mydb`.`Professor` (`matricula`, `cpf`, `nome`, `telefone`, `Escola_cnpj`) VALUES (1, '123456789', 'Professor Teste', '123456789', '123456789');
INSERT INTO `mydb`.`Professor` (`matricula`, `cpf`, `nome`, `telefone`, `Escola_cnpj`) VALUES (2, '987654321', 'Professor Teste', '123456789', '987654321');

UPDATE `mydb`.`Professor` SET `matricula` = 1 WHERE `Professor`.`matricula` = 1;


-- -----------------------------------------------------
-- Table `mydb`.`Turma`
-- -----------------------------------------------------
INSERT INTO `mydb`.`Turma` (`codigo`, `sala`, `turno`, `Disciplina_codigo`, `data_inicio`, `data_fim`) VALUES ('1', 'Sala 1', 'Manha', '1', '2016-01-01', '2016-01-01');
INSERT INTO `mydb`.`Turma` (`codigo`, `sala`, `turno`, `Disciplina_codigo`, `data_inicio`, `data_fim`) VALUES ('2', 'Sala 2', 'Tarde', '2', '2016-01-01', '2016-01-01');

UPDATE `mydb`.`Turma` SET `codigo` = 1 WHERE `Turma`.`codigo` = 1;
