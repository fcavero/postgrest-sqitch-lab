-- Verify lab-postgrest-sqitch:anonymous on pg

BEGIN;

-- Force an error dividing by zero if object does not exists
SELECT 1/COUNT(*)
    FROM pg_roles
    WHERE rolname='anon';

ROLLBACK;
