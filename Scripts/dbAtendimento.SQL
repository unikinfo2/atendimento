
CREATE TABLE GC_DEPARTAMENTO (
       COD_DEPTO            NUMERIC(9,0) NOT NULL,
       DESC_DEPTO           VARCHAR(20),
       PRIMARY KEY (COD_DEPTO)
);


CREATE TABLE GC_DOCUMENTO (
       COD_DOCTO            NUMERIC(9,0) NOT NULL,
       COD_DEPTO            NUMERIC(9,0),
       DESC_DOCTO           VARCHAR(50),
       COMPETENCIA_DOCTO    VARCHAR(1),
       DIAS_DOCTO           NUMERIC(2,0),
       STATUS_DIAS_DOCTO    VARCHAR(1),
       PRIMARY KEY (COD_DOCTO), 
       FOREIGN KEY (COD_DEPTO)
                             REFERENCES GC_DEPARTAMENTO
);


CREATE TABLE GC_CLIENTE (
       COD_CLIENTE          NUMERIC(9,0) NOT NULL,
       COD_CLIENTE_ALT      NUMERIC(9,0),
       CNPJCPF_CLI          VARCHAR(18),
       TIPO_CLI             VARCHAR(1),
       NOME_CLI             VARCHAR(50),
       FANTASIA_CLI         VARCHAR(50),
       ENDERECO_CLI         VARCHAR(50),
       END_COB_CLI          VARCHAR(60),
       COMPLEMENTO_CLI      VARCHAR(20),
       BAIRRO_CLI           VARCHAR(20),
       CIDADE_CLI           VARCHAR(20),
       UF_CLI               VARCHAR(2),
       FONE1_CLI            VARCHAR(15),
       FONE2_CLI            VARCHAR(15),
       FONE3_CLI            VARCHAR(15),
       EMAIL_CLI            VARCHAR(50),
       CONTATO_CLI          VARCHAR(20),
       ATIVO_CLI            VARCHAR(1) NOT NULL,
       STATUS_CLI           VARCHAR(1),
       VALOR_MENSAL         DOUBLE PRECISION,
       DIA_VENCTO           NUMERIC(2,0),
       CEP_CLI              VARCHAR(9),
       PRIMARY KEY (COD_CLIENTE)
);


CREATE TABLE Emissao_Docto (
       COD_CLIENTE          NUMERIC(9,0) NOT NULL,
       COD_DOCTO            NUMERIC(9,0) NOT NULL,
       PRIMARY KEY (COD_CLIENTE, COD_DOCTO), 
       FOREIGN KEY (COD_DOCTO)
                             REFERENCES GC_DOCUMENTO, 
       FOREIGN KEY (COD_CLIENTE)
                             REFERENCES GC_CLIENTE
);

CREATE UNIQUE INDEX XPKEmissao_Docto ON Emissao_Docto
(
       COD_CLIENTE,
       COD_DOCTO
);

CREATE INDEX XIF20Emissao_Docto ON Emissao_Docto
(
       COD_CLIENTE
);

CREATE INDEX XIF21Emissao_Docto ON Emissao_Docto
(
       COD_DOCTO
);


CREATE TABLE GC_FUNCIONARIO (
       COD_FUNC             NUMERIC(9,0) NOT NULL,
       COD_DEPTO            NUMERIC(9,0),
       NOME_FUNC            VARCHAR(50),
       FONE1                VARCHAR(15),
       FONE2                VARCHAR(15),
       RESPONSAVEL          VARCHAR(20),
       EMAIL_FUNC           VARCHAR(50),
       APELIDO_FUNC         VARCHAR(50),
       SENHA_FUNC           VARCHAR(50),
       NIVEL_FUNC           VARCHAR(1),
       PRIMARY KEY (COD_FUNC), 
       FOREIGN KEY (COD_DEPTO)
                             REFERENCES GC_DEPARTAMENTO
);


CREATE TABLE GC_EMAIL (
       COD_EMAIL            NUMERIC(9,0) NOT NULL,
       COD_FUNC             NUMERIC(9,0),
       ASSUNTO_EMAIL        VARCHAR(255),
       DT_EMAIL             TIMESTAMP,
       CC_EMAIL             VARCHAR(255),
       TEXTO_EMAIL          VARCHAR(255),
       ARQUIVOS_EMAIL       VARCHAR(255),
       PRIMARY KEY (COD_EMAIL), 
       FOREIGN KEY (COD_FUNC)
                             REFERENCES GC_FUNCIONARIO
);

CREATE UNIQUE INDEX XPKGC_EMAIL ON GC_EMAIL
(
       COD_EMAIL
);

CREATE INDEX XIF16GC_EMAIL ON GC_EMAIL
(
       COD_FUNC
);


CREATE TABLE GC_EMAIL_CLI (
       COD_EMAIL            NUMERIC(9,0) NOT NULL,
       COD_CLIENTE          NUMERIC(9,0) NOT NULL,
       PRIMARY KEY (COD_EMAIL, COD_CLIENTE), 
       FOREIGN KEY (COD_CLIENTE)
                             REFERENCES GC_CLIENTE, 
       FOREIGN KEY (COD_EMAIL)
                             REFERENCES GC_EMAIL
);

CREATE UNIQUE INDEX XPKGC_EMAIL_CLI ON GC_EMAIL_CLI
(
       COD_EMAIL,
       COD_CLIENTE
);

CREATE INDEX XIF18GC_EMAIL_CLI ON GC_EMAIL_CLI
(
       COD_EMAIL
);

CREATE INDEX XIF19GC_EMAIL_CLI ON GC_EMAIL_CLI
(
       COD_CLIENTE
);


CREATE TABLE GC_DOCUMENTO_EMITIDO (
       COD_DOCTO_EMI        NUMERIC(9,0) NOT NULL,
       COD_CLIENTE          NUMERIC(9,0) NOT NULL,
       COD_DOCTO            NUMERIC(9,0) NOT NULL,
       OBS_DOCTO_EMI        VARCHAR(255),
       DT_EMISSAO_DOCTO_EMI TIMESTAMP,
       DT_ENTREGA           TIMESTAMP,
       STATUS_ENTREGA       VARCHAR(1),
       PRIMARY KEY (COD_DOCTO_EMI, COD_CLIENTE, COD_DOCTO), 
       FOREIGN KEY (COD_DOCTO)
                             REFERENCES GC_DOCUMENTO, 
       FOREIGN KEY (COD_CLIENTE)
                             REFERENCES GC_CLIENTE
);


CREATE TABLE GC_LIGACAO (
       COD_LIGACAO          NUMERIC(9,0) NOT NULL,
       COD_CLIENTE          NUMERIC(9,0),
       COD_FUNC             NUMERIC(9,0),
       COD_DEPTO            NUMERIC(9,0),
       DESC_LIG             VARCHAR(100),
       PRIORIDADE_LIG       VARCHAR(1),
       STATUS_LIG           VARCHAR(1),
       DT_PEDIDO_LIG        TIMESTAMP NOT NULL,
       DT_FECHAMENTO_LIG    TIMESTAMP,
       FONE1                VARCHAR(15),
       FONE2                VARCHAR(15),
       FONE3                VARCHAR(15),
       FONE4                VARCHAR(15),
       CONTATO              VARCHAR(50),
       RAMAL1               VARCHAR(4),
       RAMAL2               VARCHAR(4),
       RAMAL3               VARCHAR(4),
       RAMAL4               VARCHAR(4),
       COD_FUNC_CAD         NUMERIC(9,0),
       OBS_LIG              VARCHAR(255),
       QUEMFALA             VARCHAR(1),
       PRIMARY KEY (COD_LIGACAO), 
       FOREIGN KEY (COD_FUNC)
                             REFERENCES GC_FUNCIONARIO, 
       FOREIGN KEY (COD_CLIENTE)
                             REFERENCES GC_CLIENTE, 
       FOREIGN KEY (COD_FUNC_CAD)
                             REFERENCES GC_FUNCIONARIO, 
       FOREIGN KEY (COD_DEPTO)
                             REFERENCES GC_DEPARTAMENTO
);


CREATE TABLE GC_VISITA (
       COD_VISITA           NUMERIC(9,0) NOT NULL,
       COD_FUNC             NUMERIC(9,0) NOT NULL,
       DT_VISITA            TIMESTAMP NOT NULL,
       DT_PREV_RET          TIMESTAMP,
       MOTIVO_VISITA        VARCHAR(1000),
       OBS_VISITA           VARCHAR(255),
       CONTATO_VISITA       VARCHAR(50) NOT NULL,
       STATUS_VISITA        VARCHAR(1),
       COD_FUNC_CAD_VIS     NUMERIC(9,0),
       COD_CLIENTE          NUMERIC(9,0) NOT NULL,
       PRIMARY KEY (COD_VISITA, COD_FUNC), 
       FOREIGN KEY (COD_FUNC)
                             REFERENCES GC_FUNCIONARIO, 
       FOREIGN KEY (COD_FUNC_CAD_VIS)
                             REFERENCES GC_FUNCIONARIO, 
       FOREIGN KEY (COD_CLIENTE)
                             REFERENCES GC_CLIENTE
);


CREATE TABLE GC_ATENDIMENTO (
       COD_ATENDIMENTO      NUMERIC(9,0) NOT NULL,
       COD_CLIENTE          NUMERIC(9,0) NOT NULL,
       DESCRICAO_ATEND      VARCHAR(1000),
       STATUS_ATEND         VARCHAR(1),
       PRIORIDADE_ATEND     VARCHAR(1),
       DT_ATEND             TIMESTAMP,
       PRIMARY KEY (COD_ATENDIMENTO, COD_CLIENTE), 
       FOREIGN KEY (COD_CLIENTE)
                             REFERENCES GC_CLIENTE
);


CREATE TABLE GC_OCORRENCIA (
       COD_OCORRENCIA       NUMERIC(9,0) NOT NULL,
       COD_ATENDIMENTO      NUMERIC(9,0) NOT NULL,
       COD_CLIENTE          NUMERIC(9,0) NOT NULL,
       COD_FUNC             NUMERIC(9,0),
       DT_OCORRENCIA        TIMESTAMP NOT NULL,
       STATUS_OCORR         VARCHAR(1),
       COD_FUNC_TRANS       NUMERIC(9,0),
       DT_FECHAMENTO_OCORR  TIMESTAMP,
       DESCRICAO_OCORR      VARCHAR(255),
       PRIMARY KEY (COD_OCORRENCIA),
       FOREIGN KEY (COD_FUNC_TRANS)
                             REFERENCES GC_FUNCIONARIO,
       FOREIGN KEY (COD_FUNC)
                             REFERENCES GC_FUNCIONARIO,
       FOREIGN KEY (COD_ATENDIMENTO, COD_CLIENTE)
                             REFERENCES GC_ATENDIMENTO
);

CREATE TABLE GC_FICHA (
       COD_FICHA            NUMERIC(9,0) NOT NULL,
       COD_DEPTO            NUMERIC(9,0),
       COD_FUNC             NUMERIC(9,0),
       TIPO_PROCESSO        VARCHAR(1),
       RAZAO1               VARCHAR(50),
       RAZAO2               VARCHAR(50),
       RAZAO3               VARCHAR(50),
       RAZAO_VALIDA1        VARCHAR(1),
       RAZAO_VALIDA2        VARCHAR(1),
       RAZAO_VALIDA3        VARCHAR(1),
       OBJETO_SOCIAL        VARCHAR(250),
       ENDERECO             VARCHAR(50),
       GERENCIA             VARCHAR(1),
       CONTATO              VARCHAR(30),
       FONE1                VARCHAR(15),
       FONE2                VARCHAR(15),
       CAPITAL_SOCIAL       DOUBLE PRECISION,
       INTEGRALIZADO        DOUBLE PRECISION,
       A_INTEGRALIZAR       DOUBLE PRECISION,
       PRAZO                VARCHAR(30),
       FORMA_INTEGRALIZAR   VARCHAR(1),
       BENS                 VARCHAR(255),
       VALOR_TAXA           DOUBLE PRECISION,
       VALOR_SERVICO        DOUBLE PRECISION,
       VALOR_OUTROS         DOUBLE PRECISION,
       ORGAO1               VARCHAR(20),
       ORGAO2               VARCHAR(20),
       ORGAO3               VARCHAR(20),
       ORGAO4               VARCHAR(20),
       ORGAO5               VARCHAR(20),
       ORGAO6               VARCHAR(20),
       ORGAO7               VARCHAR(20),
       ORGAO8               VARCHAR(20),
       SIGLA_CONSELHO       VARCHAR(20),
       ALVARA_REGULAR       VARCHAR(1),
       PEDIDO_LICENCA       VARCHAR(1),
       TRIBUTACAO           VARCHAR(15),
       DT_CONTATO           TIMESTAMP,
       DT_INICIO            TIMESTAMP,
       DT_PREV_TERMINO      TIMESTAMP,
       DT_TERMINO           TIMESTAMP,
       OBS                  VARCHAR(255),
       OUTRA_TRIB           VARCHAR(20),
       PRIMARY KEY (COD_FICHA),
       FOREIGN KEY (COD_DEPTO) REFERENCES GC_DEPARTAMENTO,
       FOREIGN KEY (COD_FUNC)  REFERENCES GC_FUNCIONARIO
);

CREATE TABLE GC_FICHA_SOC (
       COD_FICHA            NUMERIC(9,0) NOT NULL,
       COD_SOCIO            NUMERIC(9,0) NOT NULL,
       NOME_RAZAO           VARCHAR(50),
       ENDERECO             VARCHAR(100),
       CPF_CNPJ             VARCHAR(20),
       ORGAO_EMISSOR        VARCHAR(20),
       PROFISSAO            VARCHAR(20),
       ESTADO_CIVIL         VARCHAR(1),
       ORGAO_CLASSE         VARCHAR(20),
       RG                   VARCHAR(20),
       SEXO                 VARCHAR(1),
       ORGAO_NUMERO         VARCHAR(30),
       TITULO               VARCHAR(20),
       VALOR_CAP_SOC        DOUBLE PRECISION,
       PORC_CAP_SOC         DOUBLE PRECISION,
       PRIMARY KEY (COD_FICHA, COD_SOCIO),
       FOREIGN KEY (COD_FICHA) REFERENCES GC_FICHA
);

CREATE TABLE "GC_FICHA_PAG"
(
  "COD_FICHA"	   NUMERIC(9, 0) NOT NULL,
  "COD_PAG"        NUMERIC(9, 0) NOT NULL,
  "DT_PREV_PAG"    TIMESTAMP,
  "DT_PAG"         TIMESTAMP,
  "VALOR_PAG"	   DOUBLE PRECISION,
  PRIMARY KEY ("COD_FICHA", "COD_PAG")
);
ALTER TABLE "GC_FICHA_PAG" ADD FOREIGN KEY ("COD_FICHA") REFERENCES GC_FICHA ("COD_FICHA");
