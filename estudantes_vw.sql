SELECT 
	p.nomeCompleto as "Nome Completo",
	p.dataNascimento as "Data de nascimento",
	p.genero as "Gênero",
	p.email as "E-mail",
	p.telefone as "Telefone",
	e.numeroMatricula as "Número da matrícula",
	d.rua as "Rua",
	d.numero as "N°",
	d.bairro as "Bairro",
	d.cidade as "Cidade",
	d.cep as "CEP"
	FROM escola.pessoa AS p
INNER JOIN escola.estudante AS e
ON p.id_pessoa = e.id_pessoa
INNER JOIN escola.endereco AS d
ON d.id_endereco = p.id_endereco
ORDER BY p.nomeCompleto
