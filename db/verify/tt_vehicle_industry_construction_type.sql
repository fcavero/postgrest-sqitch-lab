-- Verify lab-postgrest-sqitch:tt_vehicle_industry_construction_type on pg

BEGIN;

    SELECT id
         , txt_description
         FROM "public".tt_vehicle_industry_construction_type;

ROLLBACK;
