-- Revert lab-postgrest-sqitch:tt_environmental_badge from pg

BEGIN;

DROP TABLE "public".tt_environmental_badge;

COMMIT;
