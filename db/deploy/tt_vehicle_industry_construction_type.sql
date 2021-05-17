-- Deploy lab-postgrest-sqitch:tt_vehicle_industry_construction_type to pg
-- requires: appschema

BEGIN;

CREATE TABLE IF NOT EXISTS "public".tt_vehicle_industry_construction_type ( 
    id              char(2) NOT NULL,
    txt_description text,
    CONSTRAINT pk_tt_vehicle_industry_construction_type_id PRIMARY KEY ( id )
);

COMMENT ON TABLE "public".tt_vehicle_industry_construction_type IS 'Master table of construction industry types of vehicles, according to the DGT data.';
COMMENT ON COLUMN "public".tt_vehicle_industry_construction_type.id IS 'Construction industry type id.';
COMMENT ON COLUMN "public".tt_vehicle_industry_construction_type.txt_description IS 'Description of the construction industry type.';

-- DGT data
INSERT INTO "public".tt_vehicle_industry_construction_type ( id, txt_description ) VALUES
 ('00',NULL)
,('01','Vehículos de tracción animal')
,('02','Bicicletas')
,('03','Ciclomotores')
,('04','Motocicletas')
,('05','Motocarros')
,('06','Automóviles de tres ruedas')
,('10','Turismos')
,('11','Autobuses o autocares de MMA no superior a 3 500 kg')
,('12','Autobuses de MMA superior a 3 500 kg')
,('13','Autobuses o autocares articulados')
,('14','Autobuses o autocares mixtos')
,('15','Trolebuses')
,('16','Autobuses o autocares de dos pisos')
,('17',NULL)
,('20','Camiones de MMA igual o inferior a 3 500 kg')
,('21','Camiones de MMA superior a 3 500 kg e inferior o igual a 12 000 kg')
,('22','Camiones de MMA superior a 12 000 kg')
,('23','Tractocamiones')
,('24','Furgones / furgonetas de MMA igual o inferior a 3 500 kg')
,('25','Furgones de MMA superior a 3 500 kg e inferior o igual a 12 000 kg')
,('26','Furgones de MMA superior a 12 000 kg')
,('27',NULL)
,('29',NULL)
,('30','Derivados del turismo')
,('31','Vehículos mixtos adaptables')
,('32','Autocaravanas de MMA igual o inferior a 3 500 kg')
,('33','Autocaravanas de MMA superior a 3 500 kg')
,('40','Remolques y semirremolques ligeros con MMA inferior a 750 kg')
,('41','Remolques y semirremolques con MMA superior a 750 kg e inferior o igual a 3 500 kg')
,('42','Remolques y semirremolques con MMA superior a 3 500 kg e inferior o igual a 10 000 kg')
,('43','Remolques o semirremolques superiores a 10 000 kg')
,('50','Tractores agrícolas')
,('51','Motocultores')
,('52','Portadores')
,('53','Tractocarros')
,('54','Remolques agrícolas')
,('55','Máquinas agrícolas automotrices')
,('56','Máquinas agrícolas remolcadas')
,('60','Tractores de obras')
,('61','Máquinas de obras automotrices')
,('62','Máquinas de obras remolcadas')
,('63','Tractores de servicios')
,('64','Máquinas de servicios automotrices')
,('65','Barredoras')
,('66','Quads-Atv')
,('70','Vehículos militares')
,('80','Trenes turísticos')
,('97',NULL);

COMMIT;
