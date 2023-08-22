
CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';

-- arquivo create_pessoas_table.sql

CREATE TABLE pessoas (
  uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome VARCHAR(100) NOT NULL,
  apelido VARCHAR(32) NOT NULL,
  nascimento DATE NOT NULL,
  stack VARCHAR[],
  pesquisa TEXT
);

CREATE INDEX pessoas_pesquisa_gin_trgm_ops ON pessoas USING gin(pesquisa gin_trgm_ops);
CREATE UNIQUE INDEX pessoas_apelido_unique ON pessoas (apelido);

