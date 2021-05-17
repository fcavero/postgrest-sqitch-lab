-- Deploy lab-postgrest-sqitch:t_vehicle_environmental_badge to pg
-- requires: t_vehicle
-- requires: tt_environmental_badge
-- requires: appschema

DO $$
BEGIN
    BEGIN

        CREATE TABLE IF NOT EXISTS "public".t_vehicle_environmental_badge (
            id              text NOT NULL,
            tms_creation    timestamp DEFAULT now() NOT NULL,
            tms_update      timestamp DEFAULT now() NOT NULL,
            id_env_badge    smallint NOT NULL,
            id_vehicle      uuid NULL,
	        CONSTRAINT pk_t_vehicle_environmental_badge_id PRIMARY KEY ( id )
        );
        
        CREATE INDEX IF NOT EXISTS idx_t_vehicle_environmental_badge_id_env_badge ON "public".t_vehicle_environmental_badge ( id_env_badge );
        CREATE INDEX IF NOT EXISTS idx_t_vehicle_environmental_badge_id_vehicle ON "public".t_vehicle_environmental_badge ( id_vehicle );        

        COMMENT ON TABLE "public".t_vehicle_environmental_badge IS 'Table of official environmental badges of vehicles.';
        COMMENT ON COLUMN "public".t_vehicle_environmental_badge.id IS 'Vehicle id, aka, the official plate.';
        COMMENT ON COLUMN "public".t_vehicle_environmental_badge.tms_creation IS 'Moment of row creation.';
        COMMENT ON COLUMN "public".t_vehicle_environmental_badge.tms_update IS 'Moment of row last update.';
        COMMENT ON COLUMN "public".t_vehicle_environmental_badge.id_env_badge IS 'Environmental badge id.';
        COMMENT ON COLUMN "public".t_vehicle_environmental_badge.id_vehicle IS 'Vehicle id.';
        
        ALTER TABLE "public".t_vehicle_environmental_badge ADD CONSTRAINT fk_t_vehicle_environmental_badge_tt_environmental_badge FOREIGN KEY ( id_env_badge ) REFERENCES "public".tt_environmental_badge( id ) ON DELETE RESTRICT ON UPDATE CASCADE;
        ALTER TABLE "public".t_vehicle_environmental_badge ADD CONSTRAINT fk_t_vehicle_environmental_badge_t_vehicle FOREIGN KEY ( id_vehicle ) REFERENCES "public".t_vehicle( id ) ON DELETE RESTRICT ON UPDATE CASCADE;

    EXCEPTION
        WHEN duplicate_object THEN RAISE NOTICE 'Table constraints already exist';
    END;
END $$;
