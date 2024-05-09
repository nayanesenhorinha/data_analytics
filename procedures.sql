CREATE OR REPLACE PROCEDURE escola.adicionar_estudante(
    p_nome_completo VARCHAR(100),
    p_data_nascimento DATE,
    p_genero CHAR(1),
    p_email VARCHAR(100),
    p_telefone INT,
    p_numero_matricula INT,
    p_data_matricula DATE,
    p_status BOOLEAN,
    p_rua VARCHAR(100),
    p_numero_endereco INT,
    p_bairro VARCHAR(50),
    p_cidade VARCHAR(50),
    p_estado VARCHAR(2),
    p_pais VARCHAR(45),
    p_cep VARCHAR(8)
)
AS $$
DECLARE
    v_endereco_id INT;
    v_pessoa_id INT;
BEGIN
    -- Inserir endereço na tabela Endereco
    INSERT INTO escola.Endereco (Rua, Numero, Bairro, Cidade, Estado, Pais, Cep)
    VALUES (p_rua, p_numero_endereco, p_bairro, p_cidade, p_estado, p_pais, p_cep)
    RETURNING ID_Endereco INTO v_endereco_id;

    -- Inserir pessoa na tabela Pessoa
    INSERT INTO escola.Pessoa (NomeCompleto, DataNascimento, Genero, Email, Telefone, ID_Endereco)
    VALUES (p_nome_completo, p_data_nascimento, p_genero, p_email, p_telefone, v_endereco_id)
    RETURNING ID_Pessoa INTO v_pessoa_id;

    -- Inserir estudante na tabela Estudante
    INSERT INTO escola.Estudante (NumeroMatricula, DataMatricula, Status, ID_Pessoa)
    VALUES (p_numero_matricula, p_data_matricula, p_status, v_pessoa_id);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE escola.adicionar_facilitador(
    p_nome_completo VARCHAR(100),
    p_data_nascimento DATE,
    p_genero CHAR(1),
    p_email VARCHAR(100),
    p_telefone INT,
    p_area VARCHAR(100),
    p_horario VARCHAR(45),
    p_data_contratacao DATE,
    p_localizacao VARCHAR(45),
    p_salario FLOAT,
    p_rua VARCHAR(100),
    p_numero_endereco INT,
    p_bairro VARCHAR(50),
    p_cidade VARCHAR(50),
    p_estado VARCHAR(2),
    p_pais VARCHAR(45),
    p_cep VARCHAR(8)
)
AS $$
DECLARE
    v_endereco_id INT;
    v_pessoa_id INT;
BEGIN
    -- Inserir endereço na tabela Endereco
    INSERT INTO escola.Endereco (Rua, Numero, Bairro, Cidade, Estado, Pais, Cep)
    VALUES (p_rua, p_numero_endereco, p_bairro, p_cidade, p_estado, p_pais, p_cep)
    RETURNING ID_Endereco INTO v_endereco_id;

    -- Inserir pessoa na tabela Pessoa
    INSERT INTO escola.Pessoa (NomeCompleto, DataNascimento, Genero, Email, Telefone, ID_Endereco)
    VALUES (p_nome_completo, p_data_nascimento, p_genero, p_email, p_telefone, v_endereco_id)
    RETURNING ID_Pessoa INTO v_pessoa_id;

    -- Inserir facilitador na tabela Facilitador
    INSERT INTO escola.Facilitador (Area, Horario, DataContratacao, Localizacao, Salario, ID_Pessoa)
    VALUES (p_area, p_horario, p_data_contratacao, p_localizacao, p_salario, v_pessoa_id);
END;
$$ LANGUAGE plpgsql;
