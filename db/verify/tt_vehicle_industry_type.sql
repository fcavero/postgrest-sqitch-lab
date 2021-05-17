-- Verify lab-postgrest-sqitch:tt_vehicle_industry_type on pg

BEGIN;

    SELECT id
         , id_construction
         , id_use
         FROM "public".tt_vehicle_industry_type;

ROLLBACK;
