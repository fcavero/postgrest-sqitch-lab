-- Verify lab-postgrest-sqitch:tt_vehicle_service on pg

BEGIN;

    SELECT id
         , txt_description
         FROM "public".tt_vehicle_service;

ROLLBACK;
