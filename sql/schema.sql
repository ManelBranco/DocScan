-- ============================================================
--  DocScan — Schema MySQL
--  Cria a base de dados e as tabelas
-- ============================================================

CREATE DATABASE IF NOT EXISTS docscan
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE docscan;

-- ------------------------------------------------------------
--  Tabela principal: documentos (contactos e faturas)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS documentos (
    id              BIGINT          NOT NULL,
    ts              BIGINT          NOT NULL,
    source          VARCHAR(255),
    doc_type        VARCHAR(20)     NOT NULL,       -- 'contacto' ou 'fatura'

    -- Fornecedor / Contacto
    company         VARCHAR(255),
    address         TEXT,
    email           VARCHAR(255),
    phone           VARCHAR(50),
    nif_fornecedor  VARCHAR(20),

    -- Cabeçalho da fatura
    invoice_number  VARCHAR(100),
    invoice_date    VARCHAR(20),                    -- DD/MM/YYYY
    due_date        VARCHAR(20),                    -- DD/MM/YYYY

    -- Cliente
    client_name     VARCHAR(255),
    client_nif      VARCHAR(20),
    client_address  TEXT,

    -- Totais
    subtotal        DECIMAL(10,2),
    total_iva       DECIMAL(10,2),
    total           DECIMAL(10,2),

    -- Extra
    notas           TEXT,

    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ------------------------------------------------------------
--  Tabela de linhas de fatura
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS artigos_fatura (
    id              INT             NOT NULL AUTO_INCREMENT,
    documento_id    BIGINT          NOT NULL,
    descricao       TEXT,
    quantidade      DECIMAL(10,3),
    preco_unit      DECIMAL(10,2),
    iva_pct         DECIMAL(5,2),
    total           DECIMAL(10,2),

    PRIMARY KEY (id),
    CONSTRAINT fk_artigos_documento
        FOREIGN KEY (documento_id)
        REFERENCES documentos(id)
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
