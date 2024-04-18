-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2024-04-18 05:39:46 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cargos (
    id_cargo                    INTEGER NOT NULL,
    nome_cargo                  VARCHAR2(20 BYTE) NOT NULL,
    funcionarios_id_funcionario INTEGER NOT NULL,
    permissoes_id_permissao     INTEGER NOT NULL
);

COMMENT ON COLUMN cargos.id_cargo IS
    'Identificador único para cada cargo.';

COMMENT ON COLUMN cargos.nome_cargo IS
    'Nome ou título do cargo.';

CREATE UNIQUE INDEX cargos__idx ON
    cargos (
        funcionarios_id_funcionario
    ASC );

ALTER TABLE cargos ADD CONSTRAINT cargos_pk PRIMARY KEY ( id_cargo );

CREATE TABLE funcionarios (
    id_funcionario              INTEGER NOT NULL,
    nome_funcionario            VARCHAR2(30 BYTE) NOT NULL,
    data_nascimento_funcionario DATE NOT NULL,
    cpf_funcionario             VARCHAR2(14 BYTE) NOT NULL,
    data_contratacao            DATE NOT NULL,
    data_desligamento           DATE,
    salario_funcionario         NUMBER(2, 8) NOT NULL,
    status_funcionario          CHAR(1) NOT NULL,
    hospedagens_id_hospedagem   VARCHAR2(50 BYTE) NOT NULL,
    cargos_id_cargo             INTEGER NOT NULL,
    turnos_id_turno             INTEGER NOT NULL
);

COMMENT ON COLUMN funcionarios.id_funcionario IS
    ' Identificador único para cada funcionário.';

COMMENT ON COLUMN funcionarios.nome_funcionario IS
    'Nome do funcionário.';

COMMENT ON COLUMN funcionarios.data_nascimento_funcionario IS
    'Data de nascimento do funcionário.';

COMMENT ON COLUMN funcionarios.cpf_funcionario IS
    'CPF do funcionário.';

COMMENT ON COLUMN funcionarios.data_contratacao IS
    'Data de contratação do funcionário.';

COMMENT ON COLUMN funcionarios.data_desligamento IS
    'Data de desligamento do funcionário, se aplicável.';

COMMENT ON COLUMN funcionarios.salario_funcionario IS
    'Salário do funcionário.';

COMMENT ON COLUMN funcionarios.status_funcionario IS
    'Status do funcionário (ativo/inativo).';

CREATE UNIQUE INDEX funcionarios__idx ON
    funcionarios (
        cargos_id_cargo
    ASC );

CREATE UNIQUE INDEX funcionarios__idxv1 ON
    funcionarios (
        hospedagens_id_hospedagem
    ASC );

ALTER TABLE funcionarios ADD CONSTRAINT funcionarios_pk PRIMARY KEY ( id_funcionario );

CREATE TABLE hospedagens (
    id_hospedagem               VARCHAR2(50 BYTE) NOT NULL,
    valor_hospedagem            NUMBER(2, 10) NOT NULL,
    status_hospedagem           VARCHAR2(15 BYTE) NOT NULL,
    dias_hospedagem             INTEGER NOT NULL,
    hospedes_id_hospede         INTEGER NOT NULL,
    quartos_id_quarto           INTEGER NOT NULL,
    funcionarios_id_funcionario INTEGER NOT NULL
);

COMMENT ON COLUMN hospedagens.id_hospedagem IS
    ' Identificador único da hospedagem.';

COMMENT ON COLUMN hospedagens.valor_hospedagem IS
    'Valor total da hospedagem.';

COMMENT ON COLUMN hospedagens.status_hospedagem IS
    'Status atual da hospedagem (por exemplo, confirmada, cancelada, em andamento, etc.).';

COMMENT ON COLUMN hospedagens.dias_hospedagem IS
    'Número de dias da hospedagem.';

CREATE UNIQUE INDEX hospedagens__idx ON
    hospedagens (
        funcionarios_id_funcionario
    ASC );

CREATE UNIQUE INDEX hospedagens__idxv1 ON
    hospedagens (
        hospedes_id_hospede
    ASC );

CREATE UNIQUE INDEX hospedagens__idxv2 ON
    hospedagens (
        quartos_id_quarto
    ASC );

ALTER TABLE hospedagens ADD CONSTRAINT hospedagens_pk PRIMARY KEY ( id_hospedagem );

CREATE TABLE hospedes (
    id_hospede                INTEGER NOT NULL,
    nome_hospede              VARCHAR2(40 BYTE) NOT NULL,
    cpf_hospede               VARCHAR2(20 BYTE),
    telefone_hospede          VARCHAR2(17 BYTE) NOT NULL,
    data_checkin              DATE NOT NULL,
    data_checkout             DATE NOT NULL,
    hospedagens_id_hospedagem VARCHAR2(50 BYTE) NOT NULL,
    reservas_id_reserva       INTEGER NOT NULL
);

COMMENT ON COLUMN hospedes.id_hospede IS
    'Identificador único para cada hóspede.';

COMMENT ON COLUMN hospedes.nome_hospede IS
    'Nome do hóspede';

COMMENT ON COLUMN hospedes.cpf_hospede IS
    'CPF do hóspede.';

COMMENT ON COLUMN hospedes.telefone_hospede IS
    'Número de telefone do hóspede';

COMMENT ON COLUMN hospedes.data_checkin IS
    'Data e hora do check-in do hóspede no hotel.';

COMMENT ON COLUMN hospedes.data_checkout IS
    'Data e hora do check-in do hóspede no hotel.';

CREATE UNIQUE INDEX hospedes__idx ON
    hospedes (
        hospedagens_id_hospedagem
    ASC );

CREATE UNIQUE INDEX hospedes__idxv1 ON
    hospedes (
        reservas_id_reserva
    ASC );

ALTER TABLE hospedes ADD CONSTRAINT hospedes_pk PRIMARY KEY ( id_hospede );

CREATE TABLE permissoes (
    id_permissao   INTEGER NOT NULL,
    nome_permissao VARCHAR2(15 BYTE) NOT NULL
);

COMMENT ON COLUMN permissoes.id_permissao IS
    ' Identificador único para cada permissão.';

COMMENT ON COLUMN permissoes.nome_permissao IS
    ' Nome da permissão.';

ALTER TABLE permissoes ADD CONSTRAINT permissoes_pk PRIMARY KEY ( id_permissao );

CREATE TABLE produtosservicos (
    id_produtoservico    INTEGER NOT NULL,
    nome_produtoservico  VARCHAR2(30 BYTE) NOT NULL,
    tipo_produtoservico  VARCHAR2(20 BYTE) NOT NULL,
    preco_produtoservico NUMBER(2, 8) NOT NULL,
    vendas_id_venda      INTEGER NOT NULL
);

COMMENT ON COLUMN produtosservicos.id_produtoservico IS
    ' Identificador único para cada produto ou serviço.';

COMMENT ON COLUMN produtosservicos.nome_produtoservico IS
    'Nome ou descrição do produto ou serviço.';

COMMENT ON COLUMN produtosservicos.tipo_produtoservico IS
    'Tipo ou categoria do produto ou serviço (alimentação, entretenimento, etc.).';

COMMENT ON COLUMN produtosservicos.preco_produtoservico IS
    'Preço do produto ou serviço.';

ALTER TABLE produtosservicos ADD CONSTRAINT produtosservicos_pk PRIMARY KEY ( id_produtoservico );

CREATE TABLE quartos (
    id_quarto                 INTEGER NOT NULL,
    status_quarto             VARCHAR2(20 BYTE) NOT NULL,
    tipo_quarto               VARCHAR2(15 BYTE) NOT NULL,
    hospedagens_id_hospedagem VARCHAR2(50 BYTE) NOT NULL
);

COMMENT ON COLUMN quartos.id_quarto IS
    ' Identificador único para cada quarto.';

COMMENT ON COLUMN quartos.status_quarto IS
    'Indica o status atual do quarto (ocupado, disponível, em manutenção, etc.).';

COMMENT ON COLUMN quartos.tipo_quarto IS
    'Tipo ou categoria do quarto (standard, luxo, suíte, etc.).';

CREATE UNIQUE INDEX quartos__idx ON
    quartos (
        hospedagens_id_hospedagem
    ASC );

ALTER TABLE quartos ADD CONSTRAINT quartos_pk PRIMARY KEY ( id_quarto );

CREATE TABLE reservas (
    id_reserva            INTEGER NOT NULL,
    data_checkin_reserva  DATE NOT NULL,
    data_checkout_reserva DATE NOT NULL,
    status_reserva        VARCHAR2(13 BYTE) NOT NULL,
    tipo_quarto_reserva   VARCHAR2(13 BYTE) NOT NULL
);

COMMENT ON COLUMN reservas.id_reserva IS
    'Identificador único para cada reserva.';

COMMENT ON COLUMN reservas.data_checkin_reserva IS
    'Data e hora planejadas para o check-in do hóspede no hotel.';

COMMENT ON COLUMN reservas.data_checkout_reserva IS
    'Data e hora planejadas para o check-out do hóspede do hotel.';

COMMENT ON COLUMN reservas.status_reserva IS
    ' Indica o status atual da reserva (pendente, confirmada, cancelada, etc.).';

COMMENT ON COLUMN reservas.tipo_quarto_reserva IS
    'Tipo de quarto reservado pelo hóspede para esta reserva específica.';

ALTER TABLE reservas ADD CONSTRAINT reservas_pk PRIMARY KEY ( id_reserva );

CREATE TABLE turnos (
    id_turno      INTEGER NOT NULL,
    periodo_turno VARCHAR2(10 BYTE) NOT NULL,
    id_supervisor INTEGER NOT NULL
);

COMMENT ON COLUMN turnos.id_turno IS
    'Identificador único para cada turno.';

COMMENT ON COLUMN turnos.periodo_turno IS
    'Período ou horário do turno de trabalho.';

COMMENT ON COLUMN turnos.id_supervisor IS
    'Identificador do supervisor';

ALTER TABLE turnos ADD CONSTRAINT turnos_pk PRIMARY KEY ( id_turno );

CREATE TABLE vendas (
    id_venda                    INTEGER NOT NULL,
    valor_venda                 NUMBER(2, 10) NOT NULL,
    hospedes_id_hospede         INTEGER,
    funcionarios_id_funcionario INTEGER
);

COMMENT ON COLUMN vendas.id_venda IS
    ' Identificador único para cada venda.';

COMMENT ON COLUMN vendas.valor_venda IS
    'Valor total da venda.';

ALTER TABLE vendas ADD CONSTRAINT vendas_pk PRIMARY KEY ( id_venda );

ALTER TABLE cargos
    ADD CONSTRAINT cargos_funcionarios_fk FOREIGN KEY ( funcionarios_id_funcionario )
        REFERENCES funcionarios ( id_funcionario );

ALTER TABLE cargos
    ADD CONSTRAINT cargos_permissoes_fk FOREIGN KEY ( permissoes_id_permissao )
        REFERENCES permissoes ( id_permissao );

ALTER TABLE funcionarios
    ADD CONSTRAINT funcionarios_cargos_fk FOREIGN KEY ( cargos_id_cargo )
        REFERENCES cargos ( id_cargo );

ALTER TABLE funcionarios
    ADD CONSTRAINT funcionarios_hospedagens_fk FOREIGN KEY ( hospedagens_id_hospedagem )
        REFERENCES hospedagens ( id_hospedagem );

ALTER TABLE funcionarios
    ADD CONSTRAINT funcionarios_turnos_fk FOREIGN KEY ( turnos_id_turno )
        REFERENCES turnos ( id_turno );

ALTER TABLE hospedagens
    ADD CONSTRAINT hospedagens_funcionarios_fk FOREIGN KEY ( funcionarios_id_funcionario )
        REFERENCES funcionarios ( id_funcionario );

ALTER TABLE hospedagens
    ADD CONSTRAINT hospedagens_hospedes_fk FOREIGN KEY ( hospedes_id_hospede )
        REFERENCES hospedes ( id_hospede );

ALTER TABLE hospedagens
    ADD CONSTRAINT hospedagens_quartos_fk FOREIGN KEY ( quartos_id_quarto )
        REFERENCES quartos ( id_quarto );

ALTER TABLE hospedes
    ADD CONSTRAINT hospedes_hospedagens_fk FOREIGN KEY ( hospedagens_id_hospedagem )
        REFERENCES hospedagens ( id_hospedagem );

ALTER TABLE hospedes
    ADD CONSTRAINT hospedes_reservas_fk FOREIGN KEY ( reservas_id_reserva )
        REFERENCES reservas ( id_reserva );

ALTER TABLE produtosservicos
    ADD CONSTRAINT produtosservicos_vendas_fk FOREIGN KEY ( vendas_id_venda )
        REFERENCES vendas ( id_venda );

ALTER TABLE quartos
    ADD CONSTRAINT quartos_hospedagens_fk FOREIGN KEY ( hospedagens_id_hospedagem )
        REFERENCES hospedagens ( id_hospedagem );

ALTER TABLE turnos
    ADD CONSTRAINT turnos_funcionarios_fk FOREIGN KEY ( id_supervisor )
        REFERENCES funcionarios ( id_funcionario );

ALTER TABLE vendas
    ADD CONSTRAINT vendas_funcionarios_fk FOREIGN KEY ( funcionarios_id_funcionario )
        REFERENCES funcionarios ( id_funcionario );

ALTER TABLE vendas
    ADD CONSTRAINT vendas_hospedes_fk FOREIGN KEY ( hospedes_id_hospede )
        REFERENCES hospedes ( id_hospede );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             9
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
