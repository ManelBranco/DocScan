-- ============================================================
--  DocScan — Drop Schema MySQL
--  Apaga todas as tabelas (útil para resetar)
-- ============================================================

USE docscan;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS artigos_fatura;
DROP TABLE IF EXISTS documentos;

SET FOREIGN_KEY_CHECKS = 1;
