SET SQL DIALECT 3;

/* CREATE DATABASE '192.168.0.250:C:\Arquiv~1\Uni-KI~1\Contro~1\Atendimento.gdb' PAGE_SIZE 4096

 DEFAULT CHARACTER SET  */

/*  External Function declarations */

DECLARE EXTERNAL FUNCTION ABS
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_abs' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION ACOS
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_acos' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION ASCII_CHAR
INTEGER
RETURNS CHAR(1) CHARACTER SET NONE FREE_IT
ENTRY_POINT 'IB_UDF_ascii_char' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION ASCII_VAL
CHAR(1) CHARACTER SET NONE
RETURNS INTEGER BY VALUE 
ENTRY_POINT 'IB_UDF_ascii_val' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION ASIN
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_asin' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION ATAN
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_atan' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION ATAN2
DOUBLE PRECISION, DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_atan2' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION BIN_AND
INTEGER, INTEGER
RETURNS INTEGER BY VALUE 
ENTRY_POINT 'IB_UDF_bin_and' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION BIN_OR
INTEGER, INTEGER
RETURNS INTEGER BY VALUE 
ENTRY_POINT 'IB_UDF_bin_or' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION BIN_XOR
INTEGER, INTEGER
RETURNS INTEGER BY VALUE 
ENTRY_POINT 'IB_UDF_bin_xor' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION CEILING
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_ceiling' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION COS
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_cos' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION COSH
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_cosh' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION COT
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_cot' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION DIV
INTEGER, INTEGER
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_div' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION FLOOR
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_floor' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION LN
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_ln' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION LOG
DOUBLE PRECISION, DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_log' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION LOG10
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_log10' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION LOWER
CSTRING(80) CHARACTER SET NONE
RETURNS CSTRING(80) CHARACTER SET NONE FREE_IT
ENTRY_POINT 'IB_UDF_lower' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION LTRIM
CSTRING(80) CHARACTER SET NONE
RETURNS CSTRING(80) CHARACTER SET NONE FREE_IT
ENTRY_POINT 'IB_UDF_ltrim' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION MOD
INTEGER, INTEGER
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_mod' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION PI

RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_pi' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION RAND

RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_rand' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION RTRIM
CSTRING(80) CHARACTER SET NONE
RETURNS CSTRING(80) CHARACTER SET NONE FREE_IT
ENTRY_POINT 'IB_UDF_rtrim' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION SIGN
DOUBLE PRECISION
RETURNS INTEGER BY VALUE 
ENTRY_POINT 'IB_UDF_sign' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION SIN
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_sin' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION SINH
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_sinh' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION SQRT
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_sqrt' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION STRLEN
CSTRING(32767) CHARACTER SET NONE
RETURNS INTEGER BY VALUE 
ENTRY_POINT 'IB_UDF_strlen' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION SUBSTR
CSTRING(80) CHARACTER SET NONE, SMALLINT, SMALLINT
RETURNS CSTRING(80) CHARACTER SET NONE FREE_IT
ENTRY_POINT 'IB_UDF_substr' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION TAN
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_tan' MODULE_NAME 'ib_udf';


DECLARE EXTERNAL FUNCTION TANH
DOUBLE PRECISION
RETURNS DOUBLE PRECISION BY VALUE 
ENTRY_POINT 'IB_UDF_tanh' MODULE_NAME 'ib_udf';



/* Table: EMISSAO_DOCTO, Owner: SYSDBA */

CREATE TABLE "EMISSAO_DOCTO" 
(
  "COD_CLIENTE"	NUMERIC(9, 0) NOT NULL,
  "COD_DOCTO"	NUMERIC(9, 0) NOT NULL,
 PRIMARY KEY ("COD_CLIENTE", "COD_DOCTO")
);

/* Table: GC_AGENDA, Owner: SYSDBA */

CREATE TABLE "GC_AGENDA" 
(
  "COD_CONTATO"	NUMERIC(9, 0) NOT NULL,
  "NOME_CONTATO"	VARCHAR(40),
  "EMPRESA_CONTATO"	VARCHAR(40),
  "EMAIL_CONTATO"	VARCHAR(50),
  "FONE1_CONTATO"	VARCHAR(15),
  "FONE2_CONTATO"	VARCHAR(15),
  "FONE3_CONTATO"	VARCHAR(15),
  "FONE4_CONTATO"	VARCHAR(15),
  "OBS_CONTATO"	VARCHAR(255),
 PRIMARY KEY ("COD_CONTATO")
);

/* Table: GC_ATENDIMENTO, Owner: SYSDBA */

CREATE TABLE "GC_ATENDIMENTO" 
(
  "COD_ATENDIMENTO"	NUMERIC(9, 0) NOT NULL,
  "COD_CLIENTE"	NUMERIC(9, 0) NOT NULL,
  "DESCRICAO_ATEND"	VARCHAR(1000),
  "STATUS_ATEND"	VARCHAR(1),
  "PRIORIDADE_ATEND"	VARCHAR(1),
  "DT_ATEND"	TIMESTAMP,
  "TIPO_ATEND"	VARCHAR(1),
  "DT_COMPET_INI"	TIMESTAMP,
  "DT_COMPET_FIN"	TIMESTAMP,
  "DT_VENCTO"	TIMESTAMP,
  "VALOR_DOCTO"	DOUBLE PRECISION,
  "COD_DOCTO"	NUMERIC(9, 0),
  "COD_DEPTO"	NUMERIC(9, 0),
  "NOME_CLIFUNC"	VARCHAR(40),
  "COD_FUNC"	NUMERIC(9, 0),
 PRIMARY KEY ("COD_ATENDIMENTO", "COD_CLIENTE")
);

/* Table: GC_CLIENTE, Owner: SYSDBA */

CREATE TABLE "GC_CLIENTE" 
(
  "COD_CLIENTE"	NUMERIC(9, 0) NOT NULL,
  "COD_CLIENTE_ALT"	NUMERIC(9, 0),
  "CNPJCPF_CLI"	VARCHAR(18),
  "TIPO_CLI"	VARCHAR(1),
  "NOME_CLI"	VARCHAR(50),
  "FANTASIA_CLI"	VARCHAR(50),
  "ENDERECO_CLI"	VARCHAR(50),
  "END_COB_CLI"	VARCHAR(60),
  "COMPLEMENTO_CLI"	VARCHAR(20),
  "BAIRRO_CLI"	VARCHAR(20),
  "CIDADE_CLI"	VARCHAR(20),
  "UF_CLI"	VARCHAR(2),
  "FONE1_CLI"	VARCHAR(15),
  "FONE2_CLI"	VARCHAR(15),
  "FONE3_CLI"	VARCHAR(15),
  "EMAIL_CLI"	VARCHAR(50),
  "CONTATO_CLI"	VARCHAR(20),
  "ATIVO_CLI"	VARCHAR(1) NOT NULL,
  "STATUS_CLI"	VARCHAR(1),
  "VALOR_MENSAL"	DOUBLE PRECISION,
  "DIA_VENCTO"	NUMERIC(2, 0),
  "CEP_CLI"	VARCHAR(9),
 PRIMARY KEY ("COD_CLIENTE")
);

/* Table: GC_CLIENTE_FUNC, Owner: SYSDBA */

CREATE TABLE "GC_CLIENTE_FUNC" 
(
  "COD_CLIENTE"	NUMERIC(9, 0) NOT NULL,
  "COD_CLI_FUNC"	NUMERIC(9, 0) NOT NULL,
  "NOME_CLI_FUNC"	VARCHAR(40),
 PRIMARY KEY ("COD_CLI_FUNC")
);

/* Table: GC_DEPARTAMENTO, Owner: SYSDBA */

CREATE TABLE "GC_DEPARTAMENTO" 
(
  "COD_DEPTO"	NUMERIC(9, 0) NOT NULL,
  "DESC_DEPTO"	VARCHAR(20),
 PRIMARY KEY ("COD_DEPTO")
);

/* Table: GC_DOCUMENTO, Owner: SYSDBA */

CREATE TABLE "GC_DOCUMENTO" 
(
  "COD_DOCTO"	NUMERIC(9, 0) NOT NULL,
  "COD_DEPTO"	NUMERIC(9, 0),
  "DESC_DOCTO"	VARCHAR(50),
  "COMPETENCIA_DOCTO"	VARCHAR(1),
  "DIAS_DOCTO"	NUMERIC(9, 0),
  "STATUS_DIAS_DOCTO"	VARCHAR(1),
 PRIMARY KEY ("COD_DOCTO")
);

/* Table: GC_DOCUMENTO_EMITIDO, Owner: SYSDBA */

CREATE TABLE "GC_DOCUMENTO_EMITIDO" 
(
  "COD_PROTOCOLO"	NUMERIC(9, 0) NOT NULL,
  "COD_DOCTO_EMI"	NUMERIC(9, 0) NOT NULL,
  "COD_DOCTO"	NUMERIC(9, 0) NOT NULL,
  "OBS_DOCTO_EMI"	VARCHAR(30),
  "DT_VENCIMENTO"	TIMESTAMP,
 PRIMARY KEY ("COD_PROTOCOLO", "COD_DOCTO_EMI")
);

/* Table: GC_EMAIL, Owner: SYSDBA */

CREATE TABLE "GC_EMAIL" 
(
  "COD_EMAIL"	NUMERIC(9, 0) NOT NULL,
  "COD_FUNC"	NUMERIC(9, 0),
  "ASSUNTO_EMAIL"	VARCHAR(255),
  "DT_EMAIL"	TIMESTAMP,
  "CC_EMAIL"	VARCHAR(255),
  "TEXTO_EMAIL"	VARCHAR(255),
  "ARQUIVOS_EMAIL"	VARCHAR(255),
 PRIMARY KEY ("COD_EMAIL")
);

/* Table: GC_EMAIL_CLI, Owner: SYSDBA */

CREATE TABLE "GC_EMAIL_CLI" 
(
  "COD_EMAIL"	NUMERIC(9, 0) NOT NULL,
  "EMAIL_CLI_CONT"	NUMERIC(9, 0) NOT NULL,
  "COD_CLIENTE"	NUMERIC(9, 0),
  "COD_CONTATO"	NUMERIC(9, 0),
 PRIMARY KEY ("EMAIL_CLI_CONT")
);

/* Table: GC_FICHA, Owner: SYSDBA */

CREATE TABLE "GC_FICHA" 
(
  "COD_FICHA"	NUMERIC(9, 0) NOT NULL,
  "RAZAO1"	VARCHAR(50),
  "RAZAO2"	VARCHAR(50),
  "RAZAO3"	VARCHAR(50),
  "RAZAO_VALIDA1"	VARCHAR(1),
  "RAZAO_VALIDA2"	VARCHAR(1),
  "RAZAO_VALIDA3"	VARCHAR(1),
  "OBJETO_SOCIAL"	VARCHAR(250),
  "ENDERECO"	VARCHAR(50),
  "GERENCIA"	VARCHAR(1),
  "CONTATO"	VARCHAR(30),
  "FONE1"	VARCHAR(15),
  "FONE2"	VARCHAR(15),
  "CAPITAL_SOCIAL"	DOUBLE PRECISION,
  "INTEGRALIZADO"	DOUBLE PRECISION,
  "A_INTEGRALIZAR"	DOUBLE PRECISION,
  "PRAZO"	VARCHAR(30),
  "FORMA_INTEGRALIZAR"	VARCHAR(1),
  "BENS"	VARCHAR(255),
  "VALOR_TAXA"	DOUBLE PRECISION,
  "VALOR_SERVICO"	DOUBLE PRECISION,
  "VALOR_OUTROS"	DOUBLE PRECISION,
  "ORGAO1"	VARCHAR(20),
  "ORGAO2"	VARCHAR(20),
  "ORGAO3"	VARCHAR(20),
  "ORGAO4"	VARCHAR(20),
  "ORGAO5"	VARCHAR(20),
  "ORGAO6"	VARCHAR(20),
  "ORGAO7"	VARCHAR(20),
  "ORGAO8"	VARCHAR(20),
  "SIGLA_CONSELHO"	VARCHAR(20),
  "ALVARA_REGULAR"	VARCHAR(1),
  "PEDIDO_LICENCA"	VARCHAR(1),
  "TRIBUTACAO"	VARCHAR(15),
  "DT_CONTATO"	TIMESTAMP,
  "DT_INICIO"	TIMESTAMP,
  "DT_PREV_TERMINO"	TIMESTAMP,
  "DT_TERMINO"	TIMESTAMP,
  "OBS"	VARCHAR(255),
  "TIPO_PROCESSO"	VARCHAR(1),
  "OUTRA_TRIB"	VARCHAR(20),
  "COD_DEPTO"	NUMERIC(9, 0),
  "COD_FUNC"	NUMERIC(9, 0),
  "PREFEITURA"	VARCHAR(20),
  "ORGAO1_PROC"	VARCHAR(1000),
  "ORGAO2_PROC"	VARCHAR(1000),
  "ORGAO3_PROC"	VARCHAR(1000),
  "ORGAO4_PROC"	VARCHAR(1000),
  "ORGAO5_PROC"	VARCHAR(1000),
  "ORGAO6_PROC"	VARCHAR(1000),
  "ORGAO7_PROC"	VARCHAR(1000),
  "ORGAO8_PROC"	VARCHAR(1000),
 PRIMARY KEY ("COD_FICHA")
);

/* Table: GC_FICHA_AND, Owner: SYSDBA */

CREATE TABLE "GC_FICHA_AND" 
(
  "COD_FICHA"	NUMERIC(9, 0) NOT NULL,
  "COD_ANDAMENTO"	NUMERIC(9, 0) NOT NULL,
  "DT_ANDAMENTO"	TIMESTAMP,
  "DT_PREV_RET"	TIMESTAMP,
  "DT_FECHA"	TIMESTAMP,
  "DESC_ANDAMENTO"	VARCHAR(150),
  "COD_FUNC"	NUMERIC(9, 0),
 PRIMARY KEY ("COD_FICHA", "COD_ANDAMENTO")
);

/* Table: GC_FICHA_SOC, Owner: SYSDBA */

CREATE TABLE "GC_FICHA_SOC" 
(
  "COD_FICHA"	NUMERIC(9, 0) NOT NULL,
  "COD_SOCIO"	NUMERIC(9, 0) NOT NULL,
  "NOME_RAZAO"	VARCHAR(50),
  "CPF_CNPJ"	VARCHAR(20),
  "ORGAO_EMISSOR"	VARCHAR(20),
  "PROFISSAO"	VARCHAR(20),
  "ESTADO_CIVIL"	VARCHAR(1),
  "ORGAO_CLASSE"	VARCHAR(20),
  "VALOR_CAP_SOC"	DOUBLE PRECISION,
  "PORC_CAP_SOC"	DOUBLE PRECISION,
  "ENDERECO"	VARCHAR(100),
  "RG"	VARCHAR(20),
  "TITULO"	VARCHAR(20),
  "SEXO"	VARCHAR(1),
  "ORGAO_NUMERO"	VARCHAR(30),
  "PROCURADOR"	VARCHAR(1),
  "SITUACAO_SOC"	VARCHAR(1),
 PRIMARY KEY ("COD_FICHA", "COD_SOCIO")
);

/* Table: GC_FUNCIONARIO, Owner: SYSDBA */

CREATE TABLE "GC_FUNCIONARIO" 
(
  "COD_FUNC"	NUMERIC(9, 0) NOT NULL,
  "COD_DEPTO"	NUMERIC(9, 0),
  "NOME_FUNC"	VARCHAR(50),
  "FONE1"	VARCHAR(15),
  "FONE2"	VARCHAR(15),
  "RESPONSAVEL"	VARCHAR(20),
  "EMAIL_FUNC"	VARCHAR(50),
  "APELIDO_FUNC"	VARCHAR(50),
  "SENHA_FUNC"	VARCHAR(50),
  "NIVEL_FUNC"	VARCHAR(1),
 PRIMARY KEY ("COD_FUNC")
);

/* Table: GC_LIGACAO, Owner: SYSDBA */

CREATE TABLE "GC_LIGACAO" 
(
  "COD_LIGACAO"	NUMERIC(9, 0) NOT NULL,
  "COD_CLIENTE"	NUMERIC(9, 0),
  "COD_CONTATO"	NUMERIC(9, 0),
  "COD_FUNC"	NUMERIC(9, 0),
  "COD_DEPTO"	NUMERIC(9, 0),
  "DESC_LIG"	VARCHAR(100),
  "PRIORIDADE_LIG"	VARCHAR(1),
  "STATUS_LIG"	VARCHAR(1),
  "DT_PEDIDO_LIG"	TIMESTAMP NOT NULL,
  "DT_FECHAMENTO_LIG"	TIMESTAMP,
  "FONE1"	VARCHAR(15),
  "FONE2"	VARCHAR(15),
  "FONE3"	VARCHAR(15),
  "FONE4"	VARCHAR(15),
  "CONTATO"	VARCHAR(50),
  "RAMAL1"	VARCHAR(4),
  "RAMAL2"	VARCHAR(4),
  "RAMAL3"	VARCHAR(4),
  "RAMAL4"	VARCHAR(4),
  "COD_FUNC_CAD"	NUMERIC(9, 0),
  "OBS_LIG"	VARCHAR(255),
  "QUEMFALA"	VARCHAR(1),
 PRIMARY KEY ("COD_LIGACAO")
);

/* Table: GC_OCORRENCIA, Owner: SYSDBA */

CREATE TABLE "GC_OCORRENCIA" 
(
  "COD_OCORRENCIA"	NUMERIC(9, 0) NOT NULL,
  "COD_ATENDIMENTO"	NUMERIC(9, 0) NOT NULL,
  "COD_CLIENTE"	NUMERIC(9, 0) NOT NULL,
  "COD_FUNC"	NUMERIC(9, 0),
  "DT_OCORRENCIA"	TIMESTAMP NOT NULL,
  "STATUS_OCORR"	VARCHAR(1),
  "COD_FUNC_TRANS"	NUMERIC(9, 0),
  "DT_FECHAMENTO_OCORR"	TIMESTAMP,
  "DESCRICAO_OCORR"	VARCHAR(255),
 PRIMARY KEY ("COD_OCORRENCIA")
);

/* Table: GC_PROTOCOLO, Owner: SYSDBA */

CREATE TABLE "GC_PROTOCOLO" 
(
  "COD_PROTOCOLO"	NUMERIC(9, 0) NOT NULL,
  "COD_CLIENTE"	NUMERIC(9, 0) NOT NULL,
  "OBS_PROTOCOLO"	VARCHAR(255),
  "DT_EMISSAO_PROTO"	TIMESTAMP,
  "DT_ENTREGA_PREV"	TIMESTAMP,
  "DT_ENTREGA_PROTO"	TIMESTAMP,
  "STATUS_ENTREGA"	VARCHAR(1),
  "COD_FUNC"	NUMERIC(9, 0),
  "COD_FUNC_CAD"	NUMERIC(9, 0),
 PRIMARY KEY ("COD_PROTOCOLO")
);

/* Table: GC_VISITA, Owner: SYSDBA */

CREATE TABLE "GC_VISITA" 
(
  "COD_VISITA"	NUMERIC(9, 0) NOT NULL,
  "COD_FUNC"	NUMERIC(9, 0) NOT NULL,
  "DT_VISITA"	TIMESTAMP NOT NULL,
  "DT_PREV_RET"	TIMESTAMP,
  "MOTIVO_VISITA"	VARCHAR(1000),
  "OBS_VISITA"	VARCHAR(255),
  "CONTATO_VISITA"	VARCHAR(50) NOT NULL,
  "STATUS_VISITA"	VARCHAR(1),
  "COD_FUNC_CAD_VIS"	NUMERIC(9, 0),
  "COD_CLIENTE"	NUMERIC(9, 0) NOT NULL,
  "TIPO_COMPROMISSO"	VARCHAR(1),
 PRIMARY KEY ("COD_VISITA", "COD_FUNC")
);

/*  Index definitions for all user tables */

CREATE INDEX "XIF20EMISSAO_DOCTO" ON "EMISSAO_DOCTO"("COD_CLIENTE");
CREATE INDEX "XIF21EMISSAO_DOCTO" ON "EMISSAO_DOCTO"("COD_DOCTO");
CREATE UNIQUE INDEX "XPKEMISSAO_DOCTO" ON "EMISSAO_DOCTO"("COD_CLIENTE", "COD_DOCTO");
CREATE UNIQUE INDEX "XPKGC_AGENDA" ON "GC_AGENDA"("COD_CONTATO");
CREATE INDEX "XIF14GC_ATENDIMENTO" ON "GC_ATENDIMENTO"("COD_CLIENTE");
CREATE UNIQUE INDEX "XPKGC_ATENDIMENTO" ON "GC_ATENDIMENTO"("COD_ATENDIMENTO", "COD_CLIENTE");
CREATE UNIQUE INDEX "XPKGC_CLIENTE_FUNC" ON "GC_CLIENTE_FUNC"("COD_CLI_FUNC", "COD_CLIENTE");
CREATE UNIQUE INDEX "XPKGC_DEPARTAMENTO" ON "GC_DEPARTAMENTO"("COD_DEPTO");
CREATE INDEX "XIF29GC_DOCUMENTO" ON "GC_DOCUMENTO"("COD_DEPTO");
CREATE UNIQUE INDEX "XPKGC_DOCUMENTO" ON "GC_DOCUMENTO"("COD_DOCTO");
CREATE INDEX "XIF16GC_EMAIL" ON "GC_EMAIL"("COD_FUNC");
CREATE UNIQUE INDEX "XPKGC_EMAIL" ON "GC_EMAIL"("COD_EMAIL");
CREATE INDEX "XIF18GC_EMAIL_CLI" ON "GC_EMAIL_CLI"("COD_EMAIL");
CREATE INDEX "XIF19GC_EMAIL_CLI" ON "GC_EMAIL_CLI"("COD_CLIENTE");
CREATE INDEX "XIF24GC_EMAIL_CLI" ON "GC_EMAIL_CLI"("COD_CONTATO");
CREATE UNIQUE INDEX "XPKGC_EMAIL_CLI" ON "GC_EMAIL_CLI"("EMAIL_CLI_CONT");
CREATE INDEX "XIF26GC_FUNCIONARIO" ON "GC_FUNCIONARIO"("COD_DEPTO");
CREATE UNIQUE INDEX "XPKGC_FUNCIONARIO" ON "GC_FUNCIONARIO"("COD_FUNC");
CREATE INDEX "XIF23GC_LIGACAO" ON "GC_LIGACAO"("COD_CONTATO");
CREATE INDEX "XIF15GC_OCORRENCIA" ON "GC_OCORRENCIA"("COD_ATENDIMENTO", "COD_CLIENTE");
CREATE INDEX "XIF17GC_OCORRENCIA" ON "GC_OCORRENCIA"("COD_FUNC");
CREATE INDEX "XIF25GC_OCORRENCIA" ON "GC_OCORRENCIA"("COD_FUNC_TRANS");
CREATE UNIQUE INDEX "XPKGC_OCORRENCIA" ON "GC_OCORRENCIA"("COD_OCORRENCIA");
CREATE INDEX "XIF20GC_VISITA" ON "GC_VISITA"("COD_FUNC");
CREATE INDEX "XIF20GC_VISITA_CAD" ON "GC_VISITA"("COD_FUNC_CAD_VIS");
CREATE UNIQUE INDEX "XPKGC_VISITA" ON "GC_VISITA"("COD_VISITA", "COD_FUNC");
ALTER TABLE "EMISSAO_DOCTO" ADD FOREIGN KEY ("COD_DOCTO") REFERENCES GC_DOCUMENTO ("COD_DOCTO");
ALTER TABLE "EMISSAO_DOCTO" ADD FOREIGN KEY ("COD_CLIENTE") REFERENCES GC_CLIENTE ("COD_CLIENTE");
ALTER TABLE "GC_ATENDIMENTO" ADD FOREIGN KEY ("COD_DOCTO") REFERENCES GC_DOCUMENTO ("COD_DOCTO");
ALTER TABLE "GC_ATENDIMENTO" ADD FOREIGN KEY ("COD_DEPTO") REFERENCES GC_DEPARTAMENTO ("COD_DEPTO");
ALTER TABLE "GC_ATENDIMENTO" ADD FOREIGN KEY ("COD_FUNC") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_ATENDIMENTO" ADD FOREIGN KEY ("COD_CLIENTE") REFERENCES GC_CLIENTE ("COD_CLIENTE");
ALTER TABLE "GC_CLIENTE_FUNC" ADD FOREIGN KEY ("COD_CLIENTE") REFERENCES GC_CLIENTE ("COD_CLIENTE");
ALTER TABLE "GC_DOCUMENTO" ADD FOREIGN KEY ("COD_DEPTO") REFERENCES GC_DEPARTAMENTO ("COD_DEPTO");
ALTER TABLE "GC_DOCUMENTO_EMITIDO" ADD FOREIGN KEY ("COD_DOCTO") REFERENCES GC_DOCUMENTO ("COD_DOCTO");
ALTER TABLE "GC_EMAIL" ADD FOREIGN KEY ("COD_FUNC") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_EMAIL_CLI" ADD FOREIGN KEY ("COD_CONTATO") REFERENCES GC_AGENDA ("COD_CONTATO");
ALTER TABLE "GC_EMAIL_CLI" ADD FOREIGN KEY ("COD_CLIENTE") REFERENCES GC_CLIENTE ("COD_CLIENTE");
ALTER TABLE "GC_EMAIL_CLI" ADD FOREIGN KEY ("COD_EMAIL") REFERENCES GC_EMAIL ("COD_EMAIL");
ALTER TABLE "GC_FICHA" ADD FOREIGN KEY ("COD_DEPTO") REFERENCES GC_DEPARTAMENTO ("COD_DEPTO");
ALTER TABLE "GC_FICHA" ADD FOREIGN KEY ("COD_DEPTO") REFERENCES GC_DEPARTAMENTO ("COD_DEPTO");
ALTER TABLE "GC_FICHA" ADD FOREIGN KEY ("COD_FUNC") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_FICHA_AND" ADD FOREIGN KEY ("COD_FICHA") REFERENCES GC_FICHA ("COD_FICHA");
ALTER TABLE "GC_FICHA_AND" ADD FOREIGN KEY ("COD_FUNC") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_FICHA_SOC" ADD FOREIGN KEY ("COD_FICHA") REFERENCES GC_FICHA ("COD_FICHA");
ALTER TABLE "GC_FUNCIONARIO" ADD FOREIGN KEY ("COD_DEPTO") REFERENCES GC_DEPARTAMENTO ("COD_DEPTO");
ALTER TABLE "GC_LIGACAO" ADD FOREIGN KEY ("COD_CONTATO") REFERENCES GC_AGENDA ("COD_CONTATO");
ALTER TABLE "GC_LIGACAO" ADD FOREIGN KEY ("COD_FUNC") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_LIGACAO" ADD FOREIGN KEY ("COD_CLIENTE") REFERENCES GC_CLIENTE ("COD_CLIENTE");
ALTER TABLE "GC_LIGACAO" ADD FOREIGN KEY ("COD_FUNC_CAD") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_LIGACAO" ADD FOREIGN KEY ("COD_DEPTO") REFERENCES GC_DEPARTAMENTO ("COD_DEPTO");
ALTER TABLE "GC_OCORRENCIA" ADD FOREIGN KEY ("COD_FUNC_TRANS") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_OCORRENCIA" ADD FOREIGN KEY ("COD_FUNC") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_OCORRENCIA" ADD FOREIGN KEY ("COD_ATENDIMENTO", "COD_CLIENTE") REFERENCES GC_ATENDIMENTO ("COD_ATENDIMENTO", "COD_CLIENTE");
ALTER TABLE "GC_PROTOCOLO" ADD FOREIGN KEY ("COD_CLIENTE") REFERENCES GC_CLIENTE ("COD_CLIENTE");
ALTER TABLE "GC_PROTOCOLO" ADD FOREIGN KEY ("COD_FUNC") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_PROTOCOLO" ADD FOREIGN KEY ("COD_FUNC_CAD") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_VISITA" ADD FOREIGN KEY ("COD_FUNC") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_VISITA" ADD FOREIGN KEY ("COD_FUNC_CAD_VIS") REFERENCES GC_FUNCIONARIO ("COD_FUNC");
ALTER TABLE "GC_VISITA" ADD FOREIGN KEY ("COD_CLIENTE") REFERENCES GC_CLIENTE ("COD_CLIENTE");

CREATE GENERATOR "GEN_AGENDA";
CREATE GENERATOR "GEN_ATEND";
CREATE GENERATOR "GEN_CLIENTE_FUNC";
CREATE GENERATOR "GEN_DOC_EMI";
CREATE GENERATOR "GEN_LIG";
CREATE GENERATOR "GEN_OCORRENCIA";
CREATE GENERATOR "GEN_VIS";

/* View: ATENDIMENTO, Owner: SYSDBA */

CREATE VIEW "ATENDIMENTO" (
  "COD_ATENDIMENTO", 
  "COD_CLIENTE", 
  "DESCRICAO_ATEND", 
  "STATUS_ATEND", 
  "PRIORIDADE_ATEND", 
  "DT_ATEND", 
  "TIPO_ATEND", 
  "DT_COMPET_INI", 
  "DT_COMPET_FIN", 
  "DT_VENCTO", 
  "VALOR_DOCTO", 
  "COD_DOCTO", 
  "COD_DEPTO", 
  "NOME_CLIFUNC", 
  "COD_FUNC"
) AS

SELECT "COD_ATENDIMENTO", "COD_CLIENTE",
  SUBSTR("DESCRICAO_ATEND",1,100),
  "STATUS_ATEND",
  "PRIORIDADE_ATEND",
  "DT_ATEND",
  "TIPO_ATEND",
  "DT_COMPET_INI",
  "DT_COMPET_FIN",
  "DT_VENCTO",
  "VALOR_DOCTO",
  "COD_DOCTO",
  "COD_DEPTO",
  "NOME_CLIFUNC",
  "COD_FUNC"
FROM GC_ATENDIMENTO
;
SET TERM ^ ;


/* Triggers only will work for SQL triggers */

CREATE TRIGGER "TRI_GEN_EGENDA" FOR "GC_AGENDA" 
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
  NEW.COD_CONTATO = GEN_ID (GEN_AGENDA, 1);
END
 ^

CREATE TRIGGER "TRI_GEN_ATEND" FOR "GC_ATENDIMENTO" 
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
  NEW.COD_ATENDIMENTO = GEN_ID (GEN_ATEND, 1);
END
 ^

CREATE TRIGGER "TRI_GEN_OCORRENCIA" FOR "GC_OCORRENCIA" 
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
  NEW.COD_OCORRENCIA = GEN_ID (GEN_OCORRENCIA, 1);
END
 ^

CREATE TRIGGER "TRI_GEN_VIS" FOR "GC_VISITA" 
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
  NEW.COD_VISITA = GEN_ID (GEN_VIS, 1);
END
 ^

COMMIT WORK ^
SET TERM ;^

/* Grant Roles for this database */


/* Grant permissions for this database */

