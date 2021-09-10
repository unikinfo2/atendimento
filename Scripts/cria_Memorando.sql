/* Cria��o das tabelas de Memorando 16-10-2002 */

CREATE TABLE GC_MEMORANDO (
       ASSUNTO_MEMO         VARCHAR(100),
       RELATO_MEMO          BLOB,
       COD_MEMO             NUMERIC(9,0) NOT NULL,
       DT_MEMO              TIMESTAMP,
       STATUS_MEMO          VARCHAR(1),
       DT_FECHA_MEMO        TIMESTAMP,
       COD_FUNC             NUMERIC(9,0),
       GRAU_MEMO            VARCHAR(1)
);

CREATE UNIQUE INDEX XPKGC_MEMORANDO ON GC_MEMORANDO
(
       COD_MEMO
);


ALTER TABLE GC_MEMORANDO
       ADD PRIMARY KEY (COD_MEMO);


CREATE TABLE GC_MEMORANDO_FUNC (
       COD_FUNC             NUMERIC(9,0) NOT NULL,
       COD_MEMO             NUMERIC(9,0) NOT NULL,
       STATUS_MEMO_FUNC     VARCHAR(1),
       DT_FECHA_MEMO        TIMESTAMP
);

CREATE UNIQUE INDEX XPKGC_MEMORANDO_FUNC ON GC_MEMORANDO_FUNC
(
       COD_FUNC,
       COD_MEMO
);


ALTER TABLE GC_MEMORANDO_FUNC
       ADD PRIMARY KEY (COD_FUNC, COD_MEMO);


ALTER TABLE GC_MEMORANDO_FUNC
       ADD FOREIGN KEY (COD_MEMO)
                             REFERENCES GC_MEMORANDO;


