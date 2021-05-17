-- Revert lab-postgrest-sqitch:tt_vehicle_industry_construction_type from pg

BEGIN;

DROP TABLE "public".tt_vehicle_industry_construction_type;

COMMIT;
