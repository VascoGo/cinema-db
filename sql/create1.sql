DROP TABLE IF EXISTS Utilizador;
DROP TABLE IF EXISTS Seguir;
DROP TABLE IF EXISTS FaixaEtaria;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Filme;
DROP TABLE IF EXISTS Serie;
DROP TABLE IF EXISTS Temporada;
DROP TABLE IF EXISTS Episodio;
DROP TABLE IF EXISTS Lista;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS ItemCategoria;
DROP TABLE IF EXISTS Plataforma;
DROP TABLE IF EXISTS ItemPlataforma;
DROP TABLE IF EXISTS Favorito;
DROP TABLE IF EXISTS Adicao;
DROP TABLE IF EXISTS Participante;
DROP TABLE IF EXISTS Participacao;
DROP TABLE IF EXISTS Atividade;

CREATE TABLE Utilizador
(
    id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    bio TEXT,
    genero VARCHAR(1),
    dataNascimento DATE NOT NULL,
    dataEntrada DATE NOT NULL,
    nSeguidores INT DEFAULT 0,
    nPontos INT DEFAULT 0,
    nSeguindo INT DEFAULT 0,
    email VARCHAR(255) NOT NULL,
    uPassword VARCHAR(50) NOT NULL,
    fotoPerfil BLOB,

    CHECK (LENGTH(nome) > 0),
    CHECK (dataEntrada > dataNascimento),
    CHECK (LENGTH(uPassword) >= 8),
    UNIQUE (email)
);

CREATE TABLE Seguir
(
    idSegue INT REFERENCES Utilizador(id),
    idSeguido INT REFERENCES Utilizador(id),
    PRIMARY KEY (idSegue, idSeguido)
);

CREATE TABLE FaixaEtaria
(
    id INT PRIMARY KEY,
    idadeInicio INT NOT NULL,
    idadeFim INT NOT NULL,

    CHECK (idadeInicio < idadeFim)
);

CREATE TABLE Item
(
    id INT PRIMARY KEY,
    nome TEXT NOT NULL,
    tipo TEXT NOT NULL,
    descricao TEXT,
    classificacao INT,
    idFaixaEtaria INT REFERENCES FaixaEtaria(id),

    CHECK (LENGTH(nome) > 0),
    CHECK (classificacao >= 0 AND classificacao <= 10)
);

CREATE TABLE Filme
(
    idItem INT REFERENCES Item(id) PRIMARY KEY,
    dataLancamento DATE NOT NULL,
    duracao INT NOT NULL,
    localFilmagem TEXT,
    linguagem TEXT,
    
    CHECK (DURACAO > 0)
);

CREATE TABLE Serie
(
    idItem INT REFERENCES Item(id) PRIMARY KEY,
    dataInicio DATE NOT NULL,
    dataFim DATE,
    nTemporadas INT DEFAULT 0,

    CHECK (dataInicio <= dataFim),
    CHECK (nTemporadas >= 0)
);

CREATE TABLE Temporada
(
    id INT PRIMARY KEY,
    numero INT NOT NULL,
    nEpisodios INT DEFAULT 0,
    descricao TEXT,
    idSerie INT REFERENCES Serie(idItem) NOT NULL,

    CHECK (nEpisodios >= 0),
    UNIQUE (idSerie, numero)
);

CREATE TABLE Episodio
(
    id INT PRIMARY KEY,
    nome TEXT NOT NULL,
    numero INT NOT NULL,
    dataLancamento DATE NOT NULL,
    duracao INT NOT NULL,
    descricao TEXT,
    idFaixaEtaria INT REFERENCES FaixaEtaria(id),
    localFilmagem TEXT,
    linguagem TEXT,
    idTemporada INT REFERENCES Temporada(id),

    CHECK (duracao > 0),
    UNIQUE (idTemporada, nome)
);

CREATE TABLE Lista
(
    id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    tipoLista TEXT NOT NULL,
    numItens INT DEFAULT 0,
    idUtilizador INT REFERENCES Utilizador(id),
    nFavoritos INT DEFAULT 0,

    CHECK (LENGTH(nome) > 0),
    CHECK (numItens >= 0),
    UNIQUE (idUtilizador, nome)
);

CREATE TABLE Categoria
(
    id INT PRIMARY KEY,
    nome TEXT NOT NULL,

    UNIQUE (nome)
);

CREATE TABLE ItemCategoria
(
    idCategoria INT REFERENCES Categoria(id),
    idItem INT REFERENCES Item(id),
    PRIMARY KEY (idCategoria, idItem)
);

CREATE TABLE Plataforma
(
    id INT PRIMARY KEY,
    nome TEXT NOT NULL,
    custo INT NOT NULL,

    UNIQUE (nome)
);

CREATE TABLE ItemPlataforma
(
    idPlataforma INT REFERENCES Plataforma(id),
    idItem INT REFERENCES Item(id),
    PRIMARY KEY (idPlataforma, idItem)
);

CREATE TABLE Favorito
(
    idLista INT REFERENCES Lista(id),
    idUtilizador INT REFERENCES Utilizador(id),
    PRIMARY KEY (idLista, idUtilizador)
);

CREATE TABLE Adicao
(
    idLista INT REFERENCES Lista(id),
    idItem INT REFERENCES Item(id),
    dataAdicao DATE NOT NULL,
    PRIMARY KEY (idLista, idItem)
);

CREATE TABLE Participante
(
    id INT PRIMARY KEY,
    nome TEXT NOT NULL,
    dataNascimento DATE NOT NULL,
    genero VARCHAR(1),
    biografia TEXT,
    profissao TEXT NOT NULL,
    nProjetos INT DEFAULT 0
);

CREATE TABLE Participacao
(
    idParticipante INT REFERENCES Participante(id),
    idItem INT REFERENCES Item(id),
    PRIMARY KEY (idParticipante, idItem)
);

CREATE TABLE Atividade
(
    idUtilizador INT REFERENCES Utilizador(id),
    idItem INT REFERENCES Item(id),
    rating INT NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE,
    progresso INT NOT NULL,
    critica TEXT,
    PRIMARY KEY (idUtilizador, idItem),

    CHECK (rating >= 0 AND rating <= 10),
    CHECK (dataInicio <= dataFim)
);