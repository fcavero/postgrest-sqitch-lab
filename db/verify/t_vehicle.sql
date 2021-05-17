-- Verify lab-postgrest-sqitch:t_vehicle on pg

BEGIN;

    SELECT id
         , tms_creation
         , tms_update
         , txt_plate
         , id_category
         , id_brand
         , id_industry_type
         , id_vehicle_type
         , id_service
         , bool_state
         , json_capture_data
         FROM "public".t_vehicle;

ROLLBACK;
