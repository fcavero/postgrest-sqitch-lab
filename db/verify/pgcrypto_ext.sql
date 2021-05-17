-- Verify lab-postgrest-sqitch:pgcrypto_ext on pg

BEGIN;

-- Force an error dividing by zero if object does not exists
SELECT 1/COUNT(*)
    FROM pg_extension
    WHERE extname = 'pgcrypto';

ROLLBACK;
