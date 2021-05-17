-- Revert lab-postgrest-sqitch:anonymous_role from pg

BEGIN;

DROP ROLE "anon";

COMMIT;
