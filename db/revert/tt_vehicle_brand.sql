-- Revert lab-postgrest-sqitch:tt_vehicle_brand from pg

BEGIN;

DROP TABLE "public".tt_vehicle_brand;

COMMIT;
