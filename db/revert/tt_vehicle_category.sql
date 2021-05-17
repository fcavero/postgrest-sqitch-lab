-- Revert lab-postgrest-sqitch:tt_vehicle_category from pg

BEGIN;

DROP TABLE "public".tt_vehicle_category;

COMMIT;
