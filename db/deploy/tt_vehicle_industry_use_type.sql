-- Deploy lab-postgrest-sqitch:tt_vehicle_industry_use_type to pg
-- requires: appschema

BEGIN;

CREATE TABLE IF NOT EXISTS "public".tt_vehicle_industry_use_type ( 
    id              char(2) NOT NULL,
    txt_description text,
    CONSTRAINT pk_tt_vehicle_industry_use_type_id PRIMARY KEY ( id )
);

COMMENT ON TABLE "public".tt_vehicle_industry_use_type IS 'Master table of use industry types of vehicles, according to the DGT data.';
COMMENT ON COLUMN "public".tt_vehicle_industry_use_type.id IS 'Use industry type id.';
COMMENT ON COLUMN "public".tt_vehicle_industry_use_type.txt_description IS 'Use of the construction industry type.';

-- DGT data
INSERT INTO "public".tt_vehicle_industry_use_type ( id, txt_description ) VALUES
 ('00','Sin especificar')
,('01','Personas de movilidad reducida')
,('02','Familiar')
,('03','Escolar')
,('04','Escolar no exclusivo')
,('05','Escuela de conductores')
,('06','Urbano')
,('07','Corto recorrido')
,('08','Largo recorrido')
,('09','Derivado de camión')
,('10','Plataforma')
,('11','Caja abierta')
,('12','Portacontenedores')
,('13','Jaula')
,('14','Botellero')
,('15','Portavehículos')
,('16','Silo')
,('17','Basculante')
,('18','Dumper')
,('19','Batería de recipientes')
,('20','Caja cerrada')
,('21','Capitoné')
,('22','Blindado')
,('23','Isotermo')
,('24','Refrigerante')
,('25','Frigorífico')
,('26','Calorífico')
,('27','Cisterna')
,('28','Cisterna isoterma')
,('29','Cisterna refrigerante')
,('30','Cisterna frigorífica')
,('31','Cisterna calorífica')
,('32','Góndola')
,('33','Todo terreno')
,('38',NULL)
,('40','Taxi')
,('41','Alquiler')
,('42','Autoturismo')
,('43','Ambulancia')
,('44','Servicio médico')
,('45','Funerario')
,('46','Bomberos')
,('47','RTV')
,('48','Vivienda')
,('49','Taller o laboratorio')
,('50','Biblioteca')
,('51','Tienda')
,('52','Exposición u oficinas')
,('53','Grúa de arrastre')
,('54','Grúa de elevación')
,('55','Basurero')
,('56','Hormigonera')
,('57',NULL)
,('58','Vehículo para ferias')
,('59','Estación transformadora móvil')
,('60','Extractor de fangos')
,('61','Autobomba')
,('62','Grupo electrógeno')
,('63','Compresor')
,('64','Carretilla transportadora elevadora')
,('65','Barredora')
,('66','Bomba de hormigonar')
,('67','Perforadora')
,('68','Excavadora')
,('69','Retroexcavadora')
,('70','Cargadora')
,('71','Cargadora retroexcavadora')
,('72','Traílla')
,('73','Niveladora')
,('74','Compactador vibratorio')
,('75','Compactador estático')
,('76','Riego asfáltico')
,('77','Pintabandas')
,('78','Quitanieves')
,('80',NULL)
,('92',NULL);

COMMIT;
