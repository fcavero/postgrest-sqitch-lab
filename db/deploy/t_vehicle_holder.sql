-- Deploy lab-postgrest-sqitch:t_vehicle_holder to pg
-- requires: t_vehicle
-- requires: appschema

DO $$
BEGIN
    BEGIN

        CREATE TABLE IF NOT EXISTS "public".t_vehicle_holder (
	        id_vehicle                  uuid NOT NULL,
            txt_holder_doc              text NOT NULL,
            date_ownership_registration date,
            date_ownership_withdrawal   date,
            CONSTRAINT pk_t_vehicle_holder PRIMARY KEY ( id_vehicle, txt_holder_doc )
         );

        CREATE INDEX IF NOT EXISTS idx_t_vehicle_holder_txt_holder_doc ON "public".t_vehicle_holder ( txt_holder_doc );
        CREATE INDEX IF NOT EXISTS idx_t_vehicle_holder_id_vehicle ON "public".t_vehicle_holder ( id_vehicle );

        COMMENT ON TABLE "public".t_vehicle_holder IS 'Table of holders of vehicles.';
        COMMENT ON COLUMN "public".t_vehicle_holder.id_vehicle IS 'Vehicle id.';
        COMMENT ON COLUMN "public".t_vehicle_holder.txt_holder_doc IS 'Id document of the holder of the vehicle.';
        COMMENT ON COLUMN "public".t_vehicle_holder.date_ownership_registration IS 'Ownership registration date, if available.';
        COMMENT ON COLUMN "public".t_vehicle_holder.date_ownership_withdrawal IS 'Ownership withdrawal date, if available.';

        ALTER TABLE "public".t_vehicle_holder ADD CONSTRAINT fk_t_vehicle_holder_id_vehicle FOREIGN KEY ( id_vehicle ) REFERENCES "public".t_vehicle( id ) ON DELETE RESTRICT ON UPDATE CASCADE;

    EXCEPTION
        WHEN duplicate_object THEN RAISE NOTICE 'Table constraint already exists';
    END;
END $$;
