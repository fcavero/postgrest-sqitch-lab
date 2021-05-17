-- Deploy lab-postgrest-sqitch:t_vehicle to pg
-- requires: tt_vehicle_category
-- requires: tt_vehicle_industry_type
-- requires: tt_vehicle_type
-- requires: tt_vehicle_service
-- requires: tt_vehicle_brand
-- requires: appschema

DO $$
BEGIN
    BEGIN

        CREATE TABLE IF NOT EXISTS "public".t_vehicle (
            id                  uuid DEFAULT gen_random_uuid() NOT NULL,
	        tms_creation        timestamp DEFAULT now() NOT NULL,
            tms_update          timestamp DEFAULT now() NOT NULL,
            txt_plate           text NOT NULL,
            id_category         smallint,
            id_brand            smallint,
	        id_industry_type    char(4),
            id_vehicle_type     char(2),
            id_service          char(3),            
            bool_state          boolean DEFAULT true NOT NULL,
            json_capture_data   jsonb,
	        CONSTRAINT pk_t_vehicle_id PRIMARY KEY ( id ),
            CONSTRAINT uniq_t_vehicle_txt_plate UNIQUE ( txt_plate ) 
        );
        
        CREATE INDEX IF NOT EXISTS idx_t_vehicle_id_category ON "public".t_vehicle ( id_category );
        CREATE INDEX IF NOT EXISTS idx_t_vehicle_id_brand ON "public".t_vehicle ( id_brand );
        CREATE INDEX IF NOT EXISTS idx_t_vehicle_id_industry_type ON "public".t_vehicle ( id_industry_type );
        CREATE INDEX IF NOT EXISTS idx_t_vehicle_id_vehicle_type ON "public".t_vehicle ( id_vehicle_type );
        CREATE INDEX IF NOT EXISTS idx_t_vehicle_id_service ON "public".t_vehicle ( id_service );

        COMMENT ON TABLE "public".t_vehicle IS 'Table of vehicles.';
        COMMENT ON COLUMN "public".t_vehicle.id IS 'Vehicle id.';
        COMMENT ON COLUMN "public".t_vehicle.tms_creation IS 'Moment of row creation.';
        COMMENT ON COLUMN "public".t_vehicle.tms_update IS 'Moment of row last update.';
        COMMENT ON COLUMN "public".t_vehicle.txt_plate IS 'Plate of the vehicle.';
        COMMENT ON COLUMN "public".t_vehicle.id_category IS 'Category of the vehicle id.';
        COMMENT ON COLUMN "public".t_vehicle.id_brand IS 'Brand of the vehicle id.';
        COMMENT ON COLUMN "public".t_vehicle.id_industry_type IS 'Industry type of the vehicle id.';
        COMMENT ON COLUMN "public".t_vehicle.id_vehicle_type IS 'Type of the vehicle id.';
        COMMENT ON COLUMN "public".t_vehicle.id_service IS 'Service of the vehicle id.';
        COMMENT ON COLUMN "public".t_vehicle.bool_state IS 'State of the vehicle.';
        COMMENT ON COLUMN "public".t_vehicle.json_capture_data IS 'Vehicle data of the capture device in JSON format.';
        
        ALTER TABLE "public".t_vehicle ADD CONSTRAINT fk_t_vehicle_tt_vehicle_category FOREIGN KEY ( id_category ) REFERENCES "public".tt_vehicle_category( id ) ON DELETE RESTRICT ON UPDATE CASCADE;
        ALTER TABLE "public".t_vehicle ADD CONSTRAINT fk_t_vehicle_tt_vehicle_brand FOREIGN KEY ( id_brand ) REFERENCES "public".tt_vehicle_brand( id ) ON DELETE RESTRICT ON UPDATE CASCADE;
        ALTER TABLE "public".t_vehicle ADD CONSTRAINT fk_t_vehicle_tt_vehicle_industry_type FOREIGN KEY ( id_industry_type ) REFERENCES "public".tt_vehicle_industry_type( id ) ON DELETE RESTRICT ON UPDATE CASCADE;
        ALTER TABLE "public".t_vehicle ADD CONSTRAINT fk_t_vehicle_tt_vehicle_type FOREIGN KEY ( id_vehicle_type ) REFERENCES "public".tt_vehicle_type( id ) ON DELETE RESTRICT ON UPDATE CASCADE;
        ALTER TABLE "public".t_vehicle ADD CONSTRAINT fk_t_vehicle_tt_vehicle_service FOREIGN KEY ( id_service ) REFERENCES "public".tt_vehicle_service( id ) ON DELETE RESTRICT ON UPDATE CASCADE;

    EXCEPTION
        WHEN duplicate_object THEN RAISE NOTICE 'Table constraints already exist';
    END;
END $$;
