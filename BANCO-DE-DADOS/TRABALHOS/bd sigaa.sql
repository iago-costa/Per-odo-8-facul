-- Com o modelo conceitual "sigaa"

-- Criar um bd com uma FK em cada tabela

-- Usar pelo menos duas heranças nas tabelas


CREATE TABLE IF NOT EXISTS Aluno (
    matricula int AUTO_INCREMENT,
    nome VARCHAR(255),
    password VARCHAR(255),   
    telefone VARCHAR(11),
    endereco VARCHAR(255),

    PRIMARY KEY (matricula),
    FOREIGN KEY (matricula) REFERENCES Turma(matricula)
);

CREATE TABLE IF NOT EXISTS Escola (
    cnpj VARCHAR(14),
    nome VARCHAR(255),   
    telefone VARCHAR(11),
    endereco VARCHAR(255),
    PRIMARY KEY (cnpj)

);

CREATE TABLE IF NOT EXISTS Turmas (
    id int AUTO_INCREMENT,
    codigo VARCHAR(255),
    sala VARCHAR(255),
    horario VARCHAR(255),
    escola VARCHAR(14),
    PRIMARY KEY (id),
    FOREIGN KEY (escola) REFERENCES Escola(cnpj)
);

CREATE TABLE IF NOT EXISTS Disciplina (
    codigo VARCHAR(255),
    nome VARCHAR(255),
    carga_horaria int,
    ementa VARCHAR(255),
    turma int,
    PRIMARY KEY (codigo)
    FOREIGN KEY (turma) REFERENCES Turmas(id),
    
);