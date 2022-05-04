
mysql -u root

mysql -u root -p

CREATE TABLE Cliente (
	CodCli int AUTO_INCREMENT,
	Nome varchar(50),
	CNH varchar(11),
	Endereco varchar(100)
	PRIMARY KEY(CodCli)
);

INSERT INTO "Cliente" ("Nome", "CNH", "Endereco") VALUES ("Teste1", "0000", "rua 0")
INSERT INTO "Cliente" ("Nome", "CNH", "Endereco") VALUES ("Teste2", "0001", "rua 1")
INSERT INTO "Cliente" ("Nome", "CNH", "Endereco") VALUES ("Teste3", "0002", "rua 2")

CREATE TABLE Telefone (
	Telefone_PK int AUTO_INCREMENT,
	Telefone varchar(15),
	CNH varchar(11),
	Endereco varchar(100),
	CodCli_FK int,
	PRIMARY KEY(Telefone_PK)
	FOREIGN KEY (CodCli_FK) REFERENCES Cliente(CodCli)
);

INSERT INTO "Aluga" ("DataInicial", "DataFinal", "CodCar", "CodCli") VALUES ("04/05/2022", "06/05/2022", "1", "1")
INSERT INTO "Aluga" ("DataInicial", "DataFinal", "CodCar", "CodCli") VALUES ("04/05/2022", "06/05/2022", "1", "1")
INSERT INTO "Aluga" ("DataInicial", "DataFinal", "CodCar", "CodCli") VALUES ("04/05/2022", "06/05/2022", "1", "1")

CREATE TABLE Aluga (
	CodAlu int AUTO_INCREMENT,
	DataInicial datetime whitout timezone,
	DataFinal datetime whitout timezone,
	CodCar int,
	CodCli int,
	PRIMARY KEY(CodAlu)
	FOREIGN KEY (CodCar) REFERENCES Carro(CodCar)
	FOREIGN KEY (CodCli) REFERENCES Cliente(CodCli)
);


CREATE TABLE Carro (
	CodCar int AUTO_INCREMENT,
	Placa varchar(8),
	Cor varchar(15),
	modelo varchar(20),
	ano int,
	diaria DOUBLE PRECISION
	PRIMARY KEY(CodCar)
);

CREATE TABLE Esportivo (
	Velocidade DOUBLE PRECISION,
	CodCar int,
	FOREIGN KEY (CodCar) REFERENCES Carro(CodCar)
);


CREATE TABLE Seda (
	Passageiros int, 
	CodCar int,
	FOREIGN KEY (CodCar) REFERENCES Carro(CodCar)
);


