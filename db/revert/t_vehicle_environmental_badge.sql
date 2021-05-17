-- Revert lab-postgrest-sqitch:t_vehicle_environmental_badge from pg

BEGIN;

DROP TABLE "public".t_vehicle_environmental_badge;

COMMIT;
