-- Deploy lab-postgrest-sqitch:pgcrypto_ext to pg
-- requires: appschema

BEGIN;

CREATE EXTENSION IF NOT EXISTS "pgcrypto" SCHEMA "public";

COMMIT;
