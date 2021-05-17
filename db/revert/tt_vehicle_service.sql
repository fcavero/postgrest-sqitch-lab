-- Revert lab-postgrest-sqitch:tt_vehicle_service from pg

BEGIN;

DROP TABLE "public".tt_vehicle_service;

COMMIT;
