-- Procedure para adicionar estudantes
CREATE OR REPLACE PROCEDURE adicionar_estudante(
    IN nome VARCHAR(100),
    IN sobrenome VARCHAR(100),
    IN email VARCHAR(100),
    IN telefone VARCHAR(20),
    IN data_nasc DATE,
    IN genero VARCHAR(10),
    IN rua VARCHAR(100),
    IN cep VARCHAR(20),
    IN cidade VARCHAR(100),
    IN bairro VARCHAR(100),
    IN pais VARCHAR(100),
    OUT id_estudante INT
)
BEGIN
    DECLARE endereco_id INT;
    DECLARE pessoa_id INT;

    -- Adicionar endereço
    INSERT INTO Endereco (rua, cep, cidade, bairro, pais)
    VALUES (rua, cep, cidade, bairro, pais);
    SET endereco_id = LAST_INSERT_ID();

    -- Adicionar pessoa
    INSERT INTO Pessoa (Endereco_id, nome, sobrenome, email, telefone, data_nasc, genero)
    VALUES (endereco_id, nome, sobrenome, email, telefone, data_nasc, genero);
    SET pessoa_id = LAST_INSERT_ID();

    -- Adicionar estudante
    INSERT INTO Estudantes (Pessoa_id, data_matricula, status)
    VALUES (pessoa_id, CURDATE(), 1); -- 1 para status ativo

    SET id_estudante = LAST_INSERT_ID();
END;


-- Procedure para adicionar facilitadores
CREATE OR REPLACE PROCEDURE adicionar_facilitador(
    IN nome VARCHAR(100),
    IN sobrenome VARCHAR(100),
    IN email VARCHAR(100),
    IN telefone VARCHAR(20),
    IN data_nasc DATE,
    IN genero VARCHAR(10),
    IN area VARCHAR(100),
    IN horario VARCHAR(100),
    IN localizacao VARCHAR(100),
    IN data_contrato DATE,
    IN salario DECIMAL(9,2),
    OUT id_facilitador INT
)
BEGIN
    DECLARE endereco_id INT;
    DECLARE pessoa_id INT;

    -- Adicionar endereço
    INSERT INTO Endereco (rua, cep, cidade, bairro, pais)
    VALUES (rua, cep, cidade, bairro, pais);
    SET endereco_id = LAST_INSERT_ID();

    -- Adicionar pessoa
    INSERT INTO Pessoa (Endereco_id, nome, sobrenome, email, telefone, data_nasc, genero)
    VALUES (endereco_id, nome, sobrenome, email, telefone, data_nasc, genero);
    SET pessoa_id = LAST_INSERT_ID();

    -- Adicionar facilitador
    INSERT INTO Facilitadores (Pessoa_id, area, horario, localizacao, data_contrato, salario)
    VALUES (pessoa_id, area, horario, localizacao, data_contrato, salario);

    SET id_facilitador = LAST_INSERT_ID();
END;


-- Procedure para editar informações de estudante cadastrado
CREATE OR REPLACE PROCEDURE editar_estudante(
    IN id_estudante INT,
    IN nome VARCHAR(100),
    IN sobrenome VARCHAR(100),
    IN email VARCHAR(100),
    IN telefone VARCHAR(20),
    IN data_nasc DATE,
    IN genero VARCHAR(10),
    IN rua VARCHAR(100),
    IN cep VARCHAR(20),
    IN cidade VARCHAR(100),
    IN bairro VARCHAR(100),
    IN pais VARCHAR(100)
)
BEGIN
    DECLARE endereco_id INT;

    -- Obter o ID do endereço do estudante
    SELECT Endereco_id INTO endereco_id
    FROM Pessoa
    WHERE id = id_estudante;

    -- Atualizar informações de endereço
    UPDATE Endereco
    SET rua = rua,
        cep = cep,
        cidade = cidade,
        bairro = bairro,
        pais = pais
    WHERE id = endereco_id;

    -- Atualizar informações da pessoa
    UPDATE Pessoa
    SET nome = nome,
        sobrenome = sobrenome,
        email = email,
        telefone = telefone,
        data_nasc = data_nasc,
        genero = genero
    WHERE id = id_estudante;
END;

CALL adicionar_estudante('João', 'Silva', 'joao@example.com', '123456789', '2000-01-01', 'Masculino', 'Rua A', '12345-678', 'Cidade', 'Bairro', 'País', @id_estudante);
CALL adicionar_facilitador('Maria', 'Santos', 'maria@example.com', '987654321', '1980-05-15', 'Feminino', 'Matemática', 'Manhã', 'Local X', '2024-01-01', 2500.00, @id_facilitador);
CALL editar_estudante(id_estudante, 'Novo Nome', 'Novo Sobrenome', 'novoemail@example.com', '987654321', '1999-12-31', 'Feminino', 'Nova Rua', '98765-432', 'Nova Cidade', 'Novo Bairro', 'Novo País');

