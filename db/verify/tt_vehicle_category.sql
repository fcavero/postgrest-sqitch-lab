-- Verify lab-postgrest-sqitch:tt_vehicle_category on pg

BEGIN;

    SELECT id
         , txt_description
         , txt_fa_icon_name
         , json_vehicles
         FROM "public".tt_vehicle_category;

ROLLBACK;
