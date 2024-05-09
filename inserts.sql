-- Este script está atualizado na versão mais recente do diagrama em repositório

INSERT INTO escola.Endereco (Rua, Numero, Bairro, Cidade, Estado, Pais, Cep)
VALUES
    ('Rua A', 123, 'Centro', 'Cidade A', 'UF', 'País A', '12345678'),
    ('Rua B', 456, 'Bairro X', 'Cidade B', 'UF', 'País B', '23456789');

INSERT INTO escola.Curso (NomeCurso, Descricao, Duracao)
VALUES
    ('Curso de Matemática', 'Curso introdutório de matemática', 6),
    ('Curso de Inglês', 'Curso básico de inglês', 4);

INSERT INTO escola.Pessoa (NomeCompleto, DataNascimento, Genero, Email, Telefone, ID_Endereco)
VALUES
    ('João Silva', '1990-05-15', 'M', 'joao@example.com', 123456789, 1),
    ('Maria Souza', '1995-08-20', 'F', 'maria@example.com', 987654321, 2);

INSERT INTO escola.Estudante (NumeroMatricula, DataMatricula, Status, ID_Pessoa)
VALUES
    (12345, '2024-05-01', TRUE, 1),
    (54321, '2024-05-02', TRUE, 2);

INSERT INTO escola.Facilitador (Area, Horario, DataContratacao, Localizacao, Salario, ID_Pessoa)
VALUES
    ('Matemática', 'Manhã', '2024-04-01', 'Sala 101', 2500.00, 1),
    ('Inglês', 'Tarde', '2024-04-02', 'Sala 102', 2800.00, 2);

INSERT INTO escola.Turma (NomeTurma, Horario, Localizacao, DataInicio, DataTermino, ID_Curso, ID_Facilitador)
VALUES
    ('Turma de Matemática', '08:00 - 12:00', 'Sala 101', '2024-06-01', '2024-12-01', 1, 1),
    ('Turma de Inglês', '14:00 - 18:00', 'Sala 102', '2024-07-01', '2024-10-01', 2, 2);

INSERT INTO escola.Matricula (ID_Estudante, ID_Turma)
VALUES
    (1, 1),
    (2, 2);

INSERT INTO escola.Modulo (Nome, Descricao, Horas, ID_Facilitador, ID_Curso)
VALUES
    ('Matemática Básica', 'Módulo introdutório de matemática', 20, 1, 1),
    ('Álgebra Linear', 'Módulo sobre álgebra linear', 30, 1, 1),
    ('Geometria', 'Módulo de geometria básica', 25, 1, 1),
    ('Inglês para Iniciantes', 'Módulo introdutório de inglês', 15, 2, 2),
    ('Gramática', 'Módulo sobre gramática inglesa', 20, 2, 2),
    ('Conversação', 'Módulo para prática de conversação em inglês', 25, 2, 2);
