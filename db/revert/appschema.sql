-- Revert lab-postgrest-sqitch:appschema from pg

BEGIN;

DROP SCHEMA "public";

COMMIT;
