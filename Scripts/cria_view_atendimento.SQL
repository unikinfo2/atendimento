create view ATENDIMENTO ( "COD_ATENDIMENTO", "COD_CLIENTE", "DESCRICAO_ATEND",
  "STATUS_ATEND", "PRIORIDADE_ATEND", "DT_ATEND", "TIPO_ATEND",
  "DT_COMPET_INI","DT_COMPET_FIN", "DT_VENCTO", "VALOR_DOCTO",
  "COD_DOCTO", "COD_DEPTO", "NOME_CLIFUNC", "COD_FUNC") AS
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
FROM GC_ATENDIMENTO;

