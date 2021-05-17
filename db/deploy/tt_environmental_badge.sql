-- Deploy lab-postgrest-sqitch:tt_environmental_badge to pg
-- requires: appschema

BEGIN;

CREATE TABLE IF NOT EXISTS "public".tt_environmental_badge ( 
    id              smallint NOT NULL,
    txt_label       char(4) NOT NULL,
    txt_description text NOT NULL,
    CONSTRAINT pk_tt_environmental_badge_id PRIMARY KEY ( id )
);

COMMENT ON TABLE "public".tt_environmental_badge IS 'Master table of environmental badges of vehicles.';
COMMENT ON COLUMN "public".tt_environmental_badge.id IS 'Badge id.';
COMMENT ON COLUMN "public".tt_environmental_badge.txt_label IS 'Label of the environmental badge.';
COMMENT ON COLUMN "public".tt_environmental_badge.txt_description IS 'Human readable description of the environmental badge (aka «letter»).';

-- DGT data
INSERT INTO "public".tt_environmental_badge ( id, txt_label, txt_description ) VALUES
 (1,'16T0','CERO EMISIONES')
,(2,'16TE','ECO')
,(3,'16TC','C')
,(4,'16TB','B')
,(5,'16M0','CERO EMISIONES')
,(6,'16ME','ECO')
,(7,'16MC','C')
,(8,'16MB','B')
,(9,'A','SIN DISTINTIVO');

COMMIT;
