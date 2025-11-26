CREATE USER escritorgotico@'%' IDENTIFIED BY 'AmoMusicaGotica123!';

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

GRANT INSERT ON alittlepieceofmysoul.* TO 'escritorgotico'@'%';
GRANT SELECT ON alittlepieceofmysoul.* TO 'escritorgotico'@'%'; 
FLUSH PRIVILEGES;

-- BLOCO DAS KPIS
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
select * from quiz;
select * from Cadastro;

-- GRÁFICO 1 (Bandas do Quiz)
SELECT 
	resultado AS bandaResultado, 
    COUNT(resultado) AS totalBanda
FROM ResultadosQuiz
GROUP BY resultado
ORDER BY totalBanda DESC;

CREATE VIEW vw_grafico1 AS 
	SELECT 
	resultado AS bandaResultado, 
    COUNT(resultado) AS totalBanda
FROM ResultadosQuiz
GROUP BY resultado
ORDER BY totalBanda DESC;

SELECT * FROM vw_grafico1;

-- GRÁFICO 2 (Bandas pelo cadastro)
SELECT 
	bandaFavorita AS BandaFavorita,
    COUNT(bandaFavorita) AS totalBandaFavorita
FROM Cadastro
GROUP BY bandaFavorita 
ORDER BY totalBandaFavorita DESC;

CREATE VIEW vw_grafico2 AS
	SELECT 
	bandaFavorita AS BandaFavorita,
    COUNT(bandaFavorita) AS totalBandaFavorita
FROM Cadastro
GROUP BY bandaFavorita 
ORDER BY totalBandaFavorita DESC;

SELECT * FROM vw_grafico2;

-- GRÁFICO 3 (Gêneros pelo cadastro)
SELECT 
	generoFavorito, 
    COUNT(generoFavorito) AS qtdGeneroFavorito
FROM CADASTRO
GROUP BY generoFavorito
ORDER BY qtdGeneroFavorito;

CREATE VIEW vw_grafico3 AS
	SELECT 
	generoFavorito, 
    COUNT(generoFavorito) AS qtdGeneroFavorito
FROM Cadastro
GROUP BY generoFavorito
ORDER BY qtdGeneroFavorito;

SELECT * FROM vw_grafico3;

-- SELECT DO NOME DA PESSOA, EMAIL, BANDA FAVORITA NO CADASTRO, GÊNERO FAVORITO NO CADASTRO E BANDA RESULTANTE DO QUIZ
SELECT 
	c.nomeCompleto AS 'Nome da Pessoa',
    c.email AS 'Email',
    c.generoFavorito AS 'Gênero gótico favorito no cadastro',
    c.bandaFavorita AS 'Banda gótica favorita no cadastro',
    r.resultado AS 'Banda resultado no quiz'
FROM ResultadosQuiz AS r JOIN Cadastro AS c 
	ON r.fkCadastro = c.idCadastro;