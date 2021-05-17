-- Deploy lab-postgrest-sqitch:appschema to pg

BEGIN;

CREATE SCHEMA IF NOT EXISTS "vehicle";

COMMIT;
