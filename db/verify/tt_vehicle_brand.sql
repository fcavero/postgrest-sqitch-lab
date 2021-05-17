-- Verify lab-postgrest-sqitch:tt_vehicle_brand on pg

BEGIN;

    SELECT id
        , id_dgt
        , txt_name
        FROM "public".tt_vehicle_brand;

ROLLBACK;
