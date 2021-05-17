-- Revert lab-postgrest-sqitch:pgcrypto_ext from pg

BEGIN;

DROP EXTENSION "pgcrypto";

COMMIT;
