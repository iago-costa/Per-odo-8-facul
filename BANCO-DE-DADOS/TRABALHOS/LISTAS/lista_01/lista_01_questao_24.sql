-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
ALTER TABLE `mydb`.`Aluno` DROP COLUMN `matricula`;
ALTER TABLE `mydb`.`Aluno` ADD COLUMN `matricula` INT(11) NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`matricula`);
ALTER TABLE `mydb`.`Aluno` CHANGE `matricula` `matricula` INT NOT NULL AUTO_INCREMENT;


-- -----------------------------------------------------
-- Table `mydb`.`Disciplina`
-- -----------------------------------------------------
ALTER TABLE `mydb`.`Disciplina` DROP COLUMN `codigo`;
ALTER TABLE `mydb`.`Disciplina` ADD COLUMN `codigo` VARCHAR(45) NOT NULL FIRST, ADD PRIMARY KEY (`codigo`);
ALTER TABLE `mydb`.`Disciplina` CHANGE `codigo` `codigo` VARCHAR(45) NOT NULL;


-- -----------------------------------------------------
-- Table `mydb`.`Escola`
-- -----------------------------------------------------
ALTER TABLE `mydb`.`Escola` DROP COLUMN `cnpj`;
ALTER TABLE `mydb`.`Escola` ADD COLUMN `cnpj` VARCHAR(45) NOT NULL FIRST, ADD PRIMARY KEY (`cnpj`);
ALTER TABLE `mydb`.`Escola` CHANGE `cnpj` `cnpj` VARCHAR(45) NOT NULL;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
ALTER TABLE `mydb`.`Professor` DROP COLUMN `matricula`;
ALTER TABLE `mydb`.`Professor` ADD COLUMN `matricula` INT(11) NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`matricula`);
ALTER TABLE `mydb`.`Professor` CHANGE `matricula` `matricula` INT NOT NULL AUTO_INCREMENT;


-- -----------------------------------------------------
-- Table `mydb`.`Turma`
-- -----------------------------------------------------
ALTER TABLE `mydb`.`Turma` DROP COLUMN `codigo`;
ALTER TABLE `mydb`.`Turma` ADD COLUMN `codigo` INT(11) NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`codigo`);
ALTER TABLE `mydb`.`Turma` CHANGE `codigo` `codigo` INT NOT NULL AUTO_INCREMENT;
