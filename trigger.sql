- trigger evasão
CREATE TABLE IF NOT EXISTS Log_Estudante_Status (
    id SERIAL PRIMARY KEY,
    estudante_id INT NOT NULL,
    status_anterior SMALLINT NOT NULL,
    status_novo SMALLINT NOT NULL,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (estudante_id) REFERENCES Estudantes(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE OR REPLACE TRIGGER estudante_status_trigger
AFTER UPDATE ON Estudantes
FOR EACH ROW
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO Log_Estudante_Status (estudante_id, status_anterior, status_novo, data_atualizacao)
        VALUES (OLD.id, OLD.status, NEW.status, NOW());
    END IF;
END;


- trigger atualização de informação do aluno
ALTER TABLE Estudantes
ADD COLUMN ultima_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

CREATE TRIGGER aluno_ultima_mod_trigger
AFTER UPDATE ON Estudantes
FOR EACH ROW
BEGIN
    UPDATE Estudantes
    SET ultima_modificacao = CURRENT_TIMESTAMP
    WHERE id = NEW.id;
END;

