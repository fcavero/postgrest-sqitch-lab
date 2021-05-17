-- Revert lab-postgrest-sqitch:t_vehicle_holder from pg

BEGIN;

DROP TABLE "public".t_vehicle_holder;

COMMIT;
