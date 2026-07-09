.mode columns
.headers on

PRAGMA foreign_keys = ON;
-- Inserir registos na tabela UTILIZADOR
INSERT INTO Utilizador (id, nome, bio, genero, dataNascimento, dataEntrada, nSeguidores, nPontos, nSeguindo, email, uPassword)
VALUES 
(1, 'Nuno Silva', 'I <3 movies', 'M', '1995-06-15', '2023-01-10', 20,10,11, 'nuno.silva12@gmail.com', 'pass1234'),
(2, 'Maria José', 'Amante de séries e filmes', 'F', '1990-08-25', '2023-02-14', 36,23,4, 'maria.jose@gmail.com', 'mypass2024'),
(3, 'Leandro Nunes', 'UP Student', 'M', '2004-03-22', '2021-05-15', 23,12,14, 'leanunes@gmail.com', 'souoleandro'),
(4, 'Cristina Amélia', 'Sou a Cris', 'F', '2000-08-25', '2023-01-11', 12,32,67, 'crisamel@gmail.com', '23lopes23'),
(5, 'Rodrigo Gomes', 'Chef de cozinha', 'M', '1986-06-15', '2022-06-10', 21,23,34, 'rodrigomes@gmail.com', '123__pass'),
(6, 'Cristiano Rodrigues', 'Adoro séries e filmes', 'M', '1996-08-25', '2021-04-18', 36,12,45, 'crisrodri12@gmail.com', '1224Roni'),
(7, 'Francisco Sousa', 'Fã de Breaking Bad', 'M', '2002-06-29', '2021-05-15', 24,25,34, 'chicosousa@gmail.com', 'chicao1234'),
(8, 'Sara Costa', 'Sarita', 'F', '2005-08-25', '2020-06-12', 29, 10, 4, 'saracosta@gmail.com', 'sarita_*2005'),
(9, 'Maria Carla', 'Amante de filmes', 'F', '1994-03-28', '2023-06-12', 11,10,23, 'marycarla@gmail.com', 'pass2005mary'),
(10, 'Leonardo Pina', 'Student', 'M', '2003-03-22', '2023-01-15', 15,11,22, 'leopina22@gmail.com', 'leopin1356');


-- Inserir Seguidores
INSERT INTO Seguir (idSegue, idSeguido) 
VALUES 
(1, 2), 
(1, 3), 
(2, 4), 
(3, 5), 
(4, 1), 
(5, 2), 
(6,8), 
(6,10), 
(7,1), 
(7,4), 
(7,9),
(8,9),
(9,4),
(9,6),
(10,1),
(10,3),
(10,7);

-- Inserir Faixa Etária
INSERT INTO FaixaEtaria (id, idadeInicio, idadeFim) 
VALUES 
(1, 0, 12), 
(2, 13, 17), 
(3, 18, 99), 
(4, 65, 99);

-- Inserir Itens
INSERT INTO Item (id, nome, tipo, descricao, classificacao, idFaixaEtaria) 
VALUES 
(1, 'O Senhor dos Anéis', 'Filme', 'Uma jornada épica na Terra Média.', 9, 3),
(2, 'Stranger Things', 'Série', 'Mistério e aventura sobrenatural.', 8, 3),
(3, 'À Procura da Felicidade', 'Filme', 'Um homem luta por uma vida melhor.', 8, 3),
(4, 'Brooklyn Nine-Nine', 'Série', 'Comédia policial.', 9, 2),
(5, 'O Rei Leão', 'Filme', 'A jornada de Simba para se tornar rei.', 10, 1),
(6, 'Orgulho e Preconceito', 'Filme', 'Uma história clássica de romance.', 8, 4),
(7, 'Breaking Bad', 'Série', 'A transformação de um professor de química.', 10, 3),
(8, 'Intocáveis', 'Filme', 'Uma amizade inesperada.', 9, 2),
(9, 'Interestelar', 'Filme', 'Uma missão de sobrevivência no espaço.', 10, 3),
(10, 'Black Mirror', 'Série', 'Histórias sobre tecnologia e sociedade.', 9, 4),
(11, 'Matrix', 'Filme', 'Uma luta contra uma realidade virtual.', 9, 4);


-- Inserir Filmes
INSERT INTO Filme (idItem, dataLancamento, duracao, localFilmagem, linguagem) 
VALUES 
(1, '2001-12-19', 178, 'Nova Zelândia', 'Inglês'),
(3, '2006-12-15', 117, 'EUA', 'Inglês'),
(5, '1994-06-15', 89, 'EUA', 'Inglês'),
(6, '2005-11-11', 129, 'Reino Unido', 'Inglês'),
(8, '2011-11-02', 112, 'França', 'Francês'),
(9, '2014-11-05', 169, 'EUA', 'Inglês'),
(11, '1999-03-31', 136, 'EUA', 'Inglês');

-- Inserir Séries
INSERT INTO Serie (idItem, dataInicio, dataFim, nTemporadas) 
VALUES 
(2, '2016-07-15', NULL, 5),
(4, '2013-09-17', '2021-09-16', 8),
(7, '2008-01-20', '2013-09-29', 5),
(10, '2011-12-04', NULL, 6);

-- Inserir Temporadas
INSERT INTO Temporada (id, numero, nEpisodios, descricao, idSerie) 
VALUES 
(1, 1, 8, 'Primeira temporada.', 2),
(2, 1, 22, 'Primeira temporada da comédia policial.', 4),
(3, 1, 7, 'Começo do drama.', 7),
(4, 1, 5, 'Histórias independentes.', 10);

-- Inserir Episódios
INSERT INTO Episodio (id, numero, nome, dataLancamento, duracao, descricao, idFaixaEtaria, localFilmagem, linguagem, idTemporada) 
VALUES 
(1, 1, 'O Começo', '2016-07-15', 50, 'Introdução ao universo.', 3, 'EUA', 'Inglês', 1),
(2, 4, 'Primeira Investigação', '2013-09-17', 22, 'Um caso divertido.', 2, 'EUA', 'Inglês', 2),
(3, 2, 'Química Letal', '2008-01-20', 45, 'Walter White faz a sua escolha.', 3, 'EUA', 'Inglês', 3),
(4, 10, 'Tecnologia Distópica', '2011-12-04', 60, 'História sobre as redes sociais.', 4, 'Reino Unido', 'Inglês', 4);

-- Inserir Lista
INSERT INTO Lista (id, nome, descricao, tipoLista, numItens, idUtilizador, nFavoritos) 
VALUES 
(1, 'Favoritos', 'Lista de favoritos.', 'Privada', 3, 1, 1),
(2, 'Assistir Depois', 'Itens para assistir mais tarde.', 'Pública', 5, 2, 0),
(3, 'Recomendações', 'Recomendações de amigos.', 'Pública', 4, 3, 1),
(4, 'Filmes Clássicos', 'Coleção de clássicos.', 'Pública', 10, 4, 3),
(5, 'Séries de Mistério', 'Mistérios imperdíveis.', 'Privada', 2, 5, 1);

-- Inserir Categorias
INSERT INTO Categoria (id, nome) 
VALUES 
(1, 'Ação'), 
(2, 'Comédia'), 
(3, 'Drama'), 
(4, 'Mistério'), 
(5, 'Ficção Científica'), 
(6, 'Fantasia'), 
(7, 'Animação'), 
(8, 'Romance'), 
(9, 'Suspanse'), 
(10, 'Histórico');

-- Associar Itens a Categorias
INSERT INTO ItemCategoria (idCategoria, idItem) 
VALUES 
(1, 1), 
(5, 1), 
(6, 1), 
(3, 2), 
(4, 2),         
(3, 3), 
(8, 3),         
(2, 4), 
(9, 4),         
(7, 5), 
(6, 5),         
(3, 6), 
(8, 6),         
(9, 7), 
(3, 7),         
(3, 8), 
(8, 8),          
(5, 9), 
(3, 9),         
(4, 10), 
(5, 10);

-- Inserir Plataformas
INSERT INTO Plataforma (id, nome, custo) 
VALUES 
(1, 'Netflix', 10), 
(2, 'HBO Max', 8), 
(3, 'Amazon Prime', 7), 
(4, 'Disney+', 9), 
(5, 'Apple TV+', 5), 
(6, 'Paramount+', 6);
 
-- Associar Itens a Plataformas
INSERT INTO ItemPlataforma (idPlataforma, idItem) 
VALUES 
(1, 1), 
(1, 2), 
(1, 7), 
(2, 4), 
(2, 6), 
(2, 10), 
(3, 9), 
(3, 8),         
(4, 5), 
(4, 1),        
(5, 3),                 
(6, 4);                               

-- Associar lista com utilizador
INSERT INTO Favorito (idLista, idUtilizador)
VALUES 
(1, 1), 
(1, 2), 
(2, 3), 
(2, 4), 
(3, 5), 
(3, 6), 
(4, 7), 
(4, 8), 
(5, 9), 
(5, 10);

-- Inserir Adições
INSERT INTO Adicao (idLista, idItem, dataAdicao)
VALUES 
(1, 1, '2024-01-01'), 
(1, 2, '2024-01-02'), 
(1, 3, '2024-01-03'),
(2, 4, '2024-01-04'), 
(2, 5, '2024-01-05'), 
(2, 6, '2024-01-06'),
(3, 7, '2024-01-07'), 
(3, 8, '2024-01-08'), 
(4, 9, '2024-01-09'),
(5, 10, '2024-01-10');

-- Inserir Participantes
INSERT INTO Participante (id, nome, dataNascimento, genero, biografia, profissao, nProjetos) 
VALUES 
(1, 'J.K. Rowling', '1965-07-31', 'F', 'Escritora renomada.', 'Escritora', 10),
(2, 'Keegan-Michael Key', '1971-03-22', 'M', 'Diretor premiado.', 'Diretor', 15),
(3, 'James Francis Ginty', '1980-12-04', 'M', 'Ator versátil.', 'Ator', 20),
(4, 'Nava Mau', '1992-05-14', 'F', 'Atriz revelação.', 'Atriz', 5),
(5, 'James Connel', '1985-09-10', 'M', 'Roteirista criativo.', 'Roteirista', 12),
(6, 'Francis Steel', '1978-11-03', 'F', 'Cineasta independente.', 'Diretor', 8),
(7, 'Brenda Sparks', '1990-01-25', 'F', 'Produtora de séries.', 'Produtora', 7),
(8, 'Jefferson Guedez', '2000-06-19', 'M', 'Novo talento.', 'Ator', 3),
(9, 'Christopher Evans', '1982-02-18', 'M', 'Diretor de fotografia.', 'Cinegrafista', 9),
(10, 'Mary Tucker', '1976-08-30', 'F', 'Especialista em efeitos visuais.', 'Técnica', 6);

-- Associar Participantes a Itens
INSERT INTO Participacao (idParticipante, idItem) 
VALUES 
(1, 1), 
(2, 1), 
(3, 1), 
(4, 2), 
(5, 2), 
(6, 2), 
(3, 3), 
(4, 3),       
(2, 4), 
(7, 4),        
(1, 5), 
(3, 5), 
(8, 5), 
(6, 6), 
(9, 6),         
(2, 7), 
(10, 7),        
(8, 8), 
(4, 8),         
(1, 9), 
(5, 9),         
(3, 10), 
(7, 10);       

-- Inserir Atividades
INSERT INTO Atividade (idUtilizador, idItem, rating, dataInicio, dataFim, progresso, critica) 
VALUES 
(1, 1, 9, '2024-01-01', '2024-01-02', 100, 'Adorei o filme!'),
(1, 3, 4, '2024-01-01', '2024-01-02', 100, 'Filme chato...'),
(2, 2, 8, '2024-01-03', '2024-01-04', 90, 'Muito emocionante.'),
(3, 3, 7, '2024-01-05', '2024-01-06', 80, 'Inspirador.'),
(4, 4, 6, '2024-01-07', '2024-01-08', 80, 'Riso garantido.'),
(5, 5, 10, '2024-01-09', '2024-01-10', 100, 'Perfeito para todas as idades.'),
(6, 6, 8, '2024-01-11', '2024-01-12', 100, 'Lindo e emocionante.'),
(7, 7, 10, '2024-01-13', '2024-01-14', 100, 'O melhor de todos!'),
(8, 8, 9, '2024-01-15', '2024-01-16', 70, 'Uma bela história.'),
(9, 9, 10, '2024-01-17', '2024-01-18', 70, 'Impressionante!'),
(10, 10, 8, '2024-01-19', '2024-01-20', 90, 'Cativante.');
