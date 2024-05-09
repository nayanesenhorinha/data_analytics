DROP TABLE escola.Endereco
DROP TABLE escola.Curso
DROP TABLE escola.Pessoa
DROP TABLE escola.Estudante
DROP TABLE escola.Facilitador
DROP TABLE escola.Turma
DROP TABLE escola.Matricula
DROP TABLE escola.Modulo

CREATE TABLE IF NOT EXISTS escola.Endereco (
    ID_Endereco SERIAL PRIMARY KEY,
    Rua VARCHAR(100),
    Numero INT,
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(2),
    Pais VARCHAR(45),
    Cep VARCHAR(8)
);

CREATE TABLE IF NOT EXISTS escola.Curso (
    ID_Curso SERIAL PRIMARY KEY,
    NomeCurso VARCHAR(100),
    Descricao TEXT,
    Duracao INT
);

CREATE TABLE IF NOT EXISTS escola.Pessoa (
    ID_Pessoa SERIAL PRIMARY KEY,
    NomeCompleto VARCHAR(100),
    DataNascimento DATE,
    Genero CHAR(1),
    Email VARCHAR(100),
    Telefone INT,
    ID_Endereco INT,
    FOREIGN KEY(ID_Endereco) REFERENCES escola.Endereco(ID_Endereco)
);

CREATE TABLE IF NOT EXISTS escola.Estudante (
    ID_Estudante SERIAL PRIMARY KEY,
    NumeroMatricula INT,
    DataMatricula DATE,
    Status BOOLEAN,
    ID_Pessoa INT,
    FOREIGN KEY(ID_Pessoa) REFERENCES escola.Pessoa(ID_Pessoa)
);

CREATE TABLE IF NOT EXISTS escola.Facilitador (
    ID_Facilitador SERIAL PRIMARY KEY,
    Area VARCHAR(100),
    Horario VARCHAR(45),
    DataContratacao DATE,
    Localizacao VARCHAR(45),
    Salario FLOAT,
    ID_Pessoa INT,
    FOREIGN KEY(ID_Pessoa) REFERENCES escola.Pessoa(ID_Pessoa)
);

CREATE TABLE IF NOT EXISTS escola.Turma (
    ID_Turma SERIAL PRIMARY KEY,
    NomeTurma VARCHAR(50),
    Horario VARCHAR(20),
    Localizacao VARCHAR(100),
    DataInicio DATE,
    DataTermino DATE,
    ID_Curso INT,
    FOREIGN KEY(ID_Curso) REFERENCES escola.Curso(ID_Curso),
    ID_Facilitador INT,
    FOREIGN KEY(ID_Facilitador) REFERENCES escola.Facilitador(ID_Facilitador)
);

CREATE TABLE IF NOT EXISTS escola.Matricula (
    ID_Matricula SERIAL PRIMARY KEY,
    ID_Estudante INT,
    FOREIGN KEY(ID_Estudante) REFERENCES escola.Estudante(ID_Estudante),
    ID_Turma INT,
    FOREIGN KEY(ID_Turma) REFERENCES escola.Turma(ID_Turma)
);

CREATE TABLE IF NOT EXISTS escola.Modulo (
    ID_Modulo SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao TEXT,
    Horas INT,
    ID_Facilitador INT,
    FOREIGN KEY(ID_Facilitador) REFERENCES escola.Facilitador(ID_Facilitador),
    ID_Curso INT,
    FOREIGN KEY(ID_Curso) REFERENCES escola.Curso(ID_Curso)
);
