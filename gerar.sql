CREATE TABLE IF NOT EXISTS escola.Endereco (
  id SERIAL PRIMARY KEY,
  rua VARCHAR(100) NOT NULL,
  cep VARCHAR(20) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  bairro VARCHAR(100) NOT NULL,
  pais VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS escola.Pessoa (
  id SERIAL PRIMARY KEY,
  Endereco_id INT,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  data_nasc DATE NOT NULL,
  genero VARCHAR(10),
  FOREIGN KEY (Endereco_id) REFERENCES escola.Endereco(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS escola.Facilitadores (
  id SERIAL PRIMARY KEY,
  Pessoa_id INT,
  area VARCHAR(100) NOT NULL,
  horario VARCHAR(100) NOT NULL,
  localizacao VARCHAR(100) NOT NULL,
  data_contrato DATE NOT NULL,
  salario DECIMAL(9,2) NOT NULL,
  FOREIGN KEY (Pessoa_id) REFERENCES escola.Pessoa(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS escola.Cursos (
  id SERIAL PRIMARY KEY,
  nome_curso VARCHAR(100),
  descricao TEXT,
  duracao VARCHAR(45),
  modulos INT
);

CREATE TABLE IF NOT EXISTS escola.Turmas (
  id SERIAL PRIMARY KEY,
  Cursos_id INT,
  Facilitadores_id INT,
  nome_turma VARCHAR(100) NOT NULL,
  horario VARCHAR(100) NOT NULL,
  localizacao VARCHAR(100) NOT NULL,
  data_inicio DATE NOT NULL,
  data_termino DATE NOT NULL,
  FOREIGN KEY (Cursos_id) REFERENCES escola.Cursos(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Facilitadores_id) REFERENCES escola.Facilitadores(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS escola.Estudantes (
  id SERIAL PRIMARY KEY,
  Pessoa_id INT,
  data_matricula DATE,
  numero_matricula INT,
  status SMALLINT NOT NULL,
  FOREIGN KEY (Pessoa_id) REFERENCES escola.Pessoa(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS escola.Matricula (
  id SERIAL PRIMARY KEY,
  Turmas_id INT,
  Estudantes_id INT,
  FOREIGN KEY (Turmas_id) REFERENCES escola.Turmas(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Estudantes_id) REFERENCES escola.Estudantes(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS escola.Modulos (
  id SERIAL PRIMARY KEY,
  Turmas_id INT,
  nome_modulo VARCHAR(100) NOT NULL,
  descricao TEXT,
  horas INT NOT NULL,
  FOREIGN KEY (Turmas_id) REFERENCES escola.Turmas(id) ON DELETE CASCADE ON UPDATE CASCADE
);