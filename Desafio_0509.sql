CREATE SCHEMA Desafio;

USE Desafio;

CREATE TABLE Diretor (
    Id_diretor INT NOT NULL,
    Nome VARCHAR(100),
    Nacionalidade VARCHAR(45),
    PRIMARY KEY (Id_diretor)
);

CREATE TABLE Filme (
Id_filme INT NOT NULL,
Titulo VARCHAR (100),
Data_lançamento DATE,
Genero VARCHAR (45),
Diretor_id INT,
PRIMARY KEY (Id_filme),
FOREIGN KEY (Diretor_id) REFERENCES Diretor (Id_diretor)
);

INSERT INTO Diretor (Id_diretor, Nome, Nacionalidade) VALUES
(1, 'Steven Spielberg', 'Americano'),
(2, 'Christopher Nolan', 'Britânico'),
(3, 'Quentin Tarantino', 'Americano'),
(4, 'Martin Scorsese', 'Americano'),
(5, 'Peter Jackson', 'Neozelandês'),
(6, 'James Cameron', 'Canadense'),
(7, 'Ridley Scott', 'Britânico'),
(8, 'Alfred Hitchcock', 'Britânico'),
(9, 'Guillermo del Toro', 'Mexicano'),
(10, 'Denis Villeneuve', 'Canadense');

INSERT INTO Filme (Id_filme, Titulo, Data_lançamento, Genero, Diretor_id) VALUES
(1, 'Jurassic Park', '1993-06-11', 'Aventura', 1),
(2, 'E.T. – O Extraterrestre', '1982-06-11', 'Ficção Científica', 1),
(3, 'A Origem', '2010-07-16', 'Ficção Científica', 2),
(4, 'Interestelar', '2014-11-07', 'Ficção Científica', 2),
(5, 'Pulp Fiction', '1994-10-14', 'Crime', 3),
(6, 'Kill Bill: Volume 1', '2003-10-10', 'Ação', 3),
(7, 'O Lobo de Wall Street', '2013-12-25', 'Comédia/Drama', 4),
(8, 'Os Infiltrados', '2006-10-06', 'Crime/Thriller', 4),
(9, 'O Senhor dos Anéis: A Sociedade do Anel', '2001-12-19', 'Fantasia', 5),
(10, 'Avatar', '2009-12-18', 'Ficção Científica', 6);

DELETE FROM filme WHERE Id_filme = 2;

SELECT * FROM filme;

SELECT SUM(Id_filme) FROM Filme;

SELECT MAX(Nome) FROM Diretor;

SELECT AVG(Id_diretor) FROM Diretor;

SELECT Genero, COUNT(*) AS total_filmes
FROM Filme
GROUP BY Genero;

SELECT Diretor_id, COUNT(*) AS total_filmes
FROM Filme
GROUP BY Diretor_id;

SELECT Filme.Titulo, Diretor.Nome AS Diretor
FROM Filme 
JOIN Diretor Diretor ON Filme.Diretor_id = Diretor.Id_diretor;