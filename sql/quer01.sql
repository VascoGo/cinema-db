.mode columns
.headers on
.nullvalue NULL

-- Número de filmes vistos por Utilizador
SELECT Utilizador.nome, COUNT(*) FROM Atividade
    JOIN Utilizador ON Atividade.idUtilizador = Utilizador.id
    JOIN Item ON Atividade.idItem = Item.id
    WHERE Item.tipo = 'Filme'
    GROUP BY Utilizador.nome;

