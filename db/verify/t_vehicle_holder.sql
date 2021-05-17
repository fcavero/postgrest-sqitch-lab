-- Verify lab-postgrest-sqitch:t_vehicle_holder on pg

BEGIN;

    SELECT id_vehicle
         , txt_holder_doc
         , date_ownership_registration
         , date_ownership_withdrawal
         FROM "public".t_vehicle_holder;

ROLLBACK;
