-- Verify lab-postgrest-sqitch:tt_environmental_badge on pg

BEGIN;

    SELECT id
         , txt_label
         , txt_description
         FROM "public".tt_environmental_badge;

ROLLBACK;
