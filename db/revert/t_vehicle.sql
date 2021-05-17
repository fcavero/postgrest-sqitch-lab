-- Revert lab-postgrest-sqitch:t_vehicle from pg

BEGIN;

DROP TABLE "public".t_vehicle;

COMMIT;
