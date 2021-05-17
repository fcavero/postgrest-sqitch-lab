-- Verify lab-postgrest-sqitch:t_vehicle_environmental_badge on pg

BEGIN;

    SELECT id
         , tms_creation
         , tms_update 
         , id_env_badge
         , id_vehicle
         FROM "public".t_vehicle_environmental_badge;

ROLLBACK;
