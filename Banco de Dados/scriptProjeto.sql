CREATE USER escritorgotico@localhost IDENTIFIED BY 'AmoMusicaGotica@123';

CREATE DATABASE alittlepieceofmysoul;
USE alittlepieceofmysoul;

CREATE TABLE Cadastro(
	idCadastro INT PRIMARY KEY AUTO_INCREMENT,
    nomeCompleto VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    generoFavorito VARCHAR(45) NOT NULL,
    bandaFavorita VARCHAR(45) NOT NULL,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE Quiz(
	idQuiz INT PRIMARY KEY AUTO_INCREMENT,
    p1 CHAR(1) NOT NULL,
    p2 CHAR(1) NOT NULL,
    p3 CHAR(1) NOT NULL,
    p4 CHAR(1) NOT NULL,
    p5 CHAR(1) NOT NULL,
    p6 CHAR(1) NOT NULL,
    p7 CHAR(1) NOT NULL
);

CREATE TABLE ResultadosQuiz(
	idResultado INT AUTO_INCREMENT,
    fkCadastro INT, 
    fkQuiz INT,
    resultado varchar(45) NOT NULL,
    dtResultado DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(idResultado, fkCadastro, fkQuiz),
    FOREIGN KEY (fkCadastro) REFERENCES Cadastro(idCadastro),
    FOREIGN KEY (fkQuiz) REFERENCES Quiz(idQuiz)
);
drop table ResultadosQuiz;
truncate table quiz;
GRANT INSERT ON alittlepieceofmysoul.* TO escritorgotico@localhost;
GRANT SELECT ON alittlepieceofmysoul.* TO escritorgotico@localhost; 
FLUSH PRIVILEGES;

CREATE VIEW vw_kpis AS 
SELECT
            (SELECT 
				COUNT(idCadastro) FROM Cadastro) AS qtdCadastro,
            
            (SELECT 
				COUNT(idResultado) FROM ResultadosQuiz) AS qtdResposta,
            
            (SELECT 
				resultado FROM ResultadosQuiz GROUP BY resultado ORDER BY COUNT(*) DESC LIMIT 1 ) AS maisSorteada,
            
            (SELECT 
				resultado FROM ResultadosQuiz GROUP BY resultado ORDER BY COUNT(*) ASC LIMIT 1) AS menosSorteada,
            
            (SELECT 
				generoFavorito FROM Cadastro GROUP BY generoFavorito ORDER BY COUNT(*) DESC LIMIT 1) AS generoEscolhido,
            
            (SELECT 
				bandaFavorita FROM Cadastro GROUP BY bandaFavorita ORDER BY COUNT(*) DESC LIMIT 1) AS bandaEscolhida;

select * from vw_kpis;

select * from ResultadosQuiz;
