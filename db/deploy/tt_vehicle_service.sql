-- Deploy lab-postgrest-sqitch:tt_vehicle_service to pg
-- requires: appschema

BEGIN;

CREATE TABLE IF NOT EXISTS "public".tt_vehicle_service ( 
    id              char(3) NOT NULL,
    txt_description text NOT NULL,
    CONSTRAINT pk_tt_vehicle_service_id PRIMARY KEY ( id )
);

COMMENT ON TABLE "public".tt_vehicle_service IS 'Master table of services of vehicles, according to the DGT data.';
COMMENT ON COLUMN "public".tt_vehicle_service.id IS 'Service of the vehicle id.';
COMMENT ON COLUMN "public".tt_vehicle_service.txt_description IS 'Description of the service of the vehicle.';

-- DGT data
INSERT INTO "public".tt_vehicle_service ( id, txt_description ) VALUES
 ('-  ','SERVICIO NO ENCONTRADO')
,('A00','PUBL-SIN ESPECIFICAR')
,('A01','PUBL-ALQUILER SIN CONDUCTOR')
,('A02','PUBL-ALQUILER CON CONDUCTOR')
,('A04','PUBL-TAXI')
,('A05','PUBL-AUXILIO EN CARRETERA')
,('A07','PUBL-AMBULANCIA')
,('A08','PUBL-FUNERARIO')
,('A09','PUBL-OBRAS')
,('A11','PUBL-BASURERO')
,('A12','PUBL-TRANSPORTE ESCOLAR')
,('A14','PUBL-BOMBEROS')
,('A15','PUBL-PROTECCION CIVIL Y SALVAMENTO')
,('A16','PUBL-DEFENSA')
,('B00','PART-SIN ESPECIFICAR')
,('B07','PART-AMBULANCIA')
,('B17','PART-VIVIENDA')
,('B19','PART-RECREATIVO')
,('B09','PART-OBRAS')
,('A03','PUBL-APRENDIZAJE DE CONDUCCIÓN')
,('A10','PUBL-MERCANCÍAS PELIGROSAS')
,('A13','PUBL-POLICÍA')
,('A18','PUBL-ACTIVIDAD ECONÓMICA')
,('A20','PUBL-MERCANCÍAS PERECEDERAS')
,('B18','PART-ACTIVIDAD ECONÓMICA')
,('B21','PART-VEHÍCULO PARA FERIAS')
,('B06','PART-AGRÍCOLA');

COMMIT;
