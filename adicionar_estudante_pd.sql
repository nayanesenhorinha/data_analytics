CREATE OR REPLACE PROCEDURE escola.adicionar_estudante(
    _nomeCompleto VARCHAR(100),
    _dataNascimento DATE,
    _genero CHAR(1),
    _email VARCHAR(100),
    _telefone INT,
    _numeroMatricula INT,
    _dataMatricula DATE,
    _status BOOLEAN,
    _rua VARCHAR(100),
    _numeroEndereco INT,
    _bairro VARCHAR(50),
    _cidade VARCHAR(50),
    _estado VARCHAR(2),
    _pais VARCHAR(45),
    _cep VARCHAR(8)
)
AS $$
DECLARE
    _endereco_id INT;
    _pessoa_id INT;
BEGIN
    INSERT INTO escola.Endereco (Rua, Numero, Bairro, Cidade, Estado, Pais, Cep)
    VALUES (_rua, _numeroEndereco, _bairro, _cidade, _estado, _pais, _cep)
    RETURNING ID_Endereco INTO _endereco_id;

    INSERT INTO escola.Pessoa (NomeCompleto, DataNascimento, Genero, Email, Telefone, ID_Endereco)
    VALUES (_nomeCompleto, _dataNascimento, _genero, _email, _telefone, _endereco_id)
    RETURNING ID_Pessoa INTO _pessoa_id;

    INSERT INTO escola.Estudante (NumeroMatricula, DataMatricula, Status, ID_Pessoa)
    VALUES (_numeroMatricula, _dataMatricula, _status, _pessoa_id);
END;
$$ LANGUAGE plpgsql;
