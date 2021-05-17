-- Verify lab-postgrest-sqitch:tt_vehicle_type on pg

BEGIN;

    SELECT id
         , txt_description
         FROM "public".tt_vehicle_type;

ROLLBACK;
