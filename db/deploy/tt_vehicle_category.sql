-- Deploy lab-postgrest-sqitch:tt_vehicle_category to pg
-- requires: appschema

BEGIN;

CREATE TABLE IF NOT EXISTS "public".tt_vehicle_category ( 
    id                   smallserial NOT NULL,
    txt_description      text NOT NULL DEFAULT 'OTROS',
    txt_fa_icon_name     text NOT NULL DEFAULT 'fa-question-circle',
    json_vehicles        jsonb NOT NULL,
    CONSTRAINT pk_tt_vehicle_category_id PRIMARY KEY ( id )
);

COMMENT ON TABLE "public".tt_vehicle_category IS 'Master table of categories of vehicles.';
COMMENT ON COLUMN "public".tt_vehicle_category.id IS 'Category id.';
COMMENT ON COLUMN "public".tt_vehicle_category.txt_description IS 'Description of the category of vehicles.';
COMMENT ON COLUMN "public".tt_vehicle_category.txt_fa_icon_name IS 'Representative icon of the category, thanks to Font Awesome.';
COMMENT ON COLUMN "public".tt_vehicle_category.json_vehicles IS 'Associated industry type codes, vehicle types or service codes, in JSON format.';

-- DGT data
INSERT INTO "public".tt_vehicle_category (id, txt_description, txt_fa_icon_name, json_vehicles ) VALUES
 (1,'TURISMO','fa-car-side','{"type": ["40"], "industry": {"use": ["02", "06", "07", "08", "33"], "construction": ["10"]}}')
,(2,'MOTOCICLETA / CICLOMOTOR','fa-motorcycle','{"type": ["50", "51", "52", "54", "90", "91", "92"], "industry": {"construction": ["03", "04", "06"]}}')
,(3,'INDUSTRIAL LIGERO','fas fa-truck','{"type": ["0G", "03", "02", "0E", "0B", "07", "7A", "20", "21", "24"], "industry": {"use": ["09", "10", "11", "20", "23", "24", "25", "26"], "construction": ["05", "17", "20", "24", "30", "31"]}}')
,(4,'INDUSTRIAL PESADO','fa-truck-moving','{"type": ["01", "04", "05", "06", "10", "11", "12", "13", "14", "15", "16", "17", "18", "0A", "0C", "0D"], "industry": {"use": ["12", "13", "14", "15", "16", "17", "18", "19", "27", "28", "29", "30", "31", "32"], "construction": ["21", "22", "25", "26"]}}')
,(5,'TAXI','fa-taxi','{"service": ["A04"], "industry": {"use": ["40"]}}')
,(6,'VTC','fa-taxi','{"service": ["A02"], "industry": {"use": ["41"]}}')
,(7,'AUTOBÚS / AUTOCAR','fa-bus-alt','{"type": ["30", "31", "32", "33", "34", "35", "36"], "industry": {"construction": ["11", "12", "13", "14", "16"]}}')
,(8,'VEHÍCULO ESPECIAL','fa-tractor','{"type": ["09", "19", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "82", "1C", "7C", "7B", "7D", "7G", "7H", "7I", "7J", "7K", "1D", "SH", "RH"], "service": ["A05", "B06", "A07", "B07", "A08", "A09", "B09", "A10", "A11", "A13", "A14", "A15", "A16"], "industry": {"use": ["21", "22", "43", "46", "47", "49", "53", "54", "55", "56", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "75", "76", "77", "78"], "construction": ["50", "51", "52", "53", "55", "56", "60", "61", "62", "63", "64", "65", "66", "70", "80"]}}')
,(9,'AUTOESCUELA','fa-graduation-cap','{"service": ["A03"], "industry": {"use": ["05"]}}')
,(10,'VEHÍCULO ADAPTADO','fa-wheelchair','{"type": ["60"], "industry": {"use": ["01"]}}')
,(11,'VEHÍCULO DE SERVICIOS','fa-ambulance','{"type": ["08", "22", "23", "1E", "1F", "7E", "7F"], "industry": {"use": ["03", "04", "42", "44", "45", "50", "51", "52"]}}')
,(12,'TRACTOCAMIÓN','fa-truck-pickup','{"type": ["81"], "industry": {"construction": ["23"]}}')
,(13,'CARAVANA / AUTOCARAVANA','fa-caravan','{"type": ["1A", "7A"], "service": ["B17"], "industry": {"use": ["48"], "construction": ["32", "33"]}}')
,(14,'REMOLQUE / SEMIRREMOLQUE','fa-trailer','{"type": ["R0", "R4", "R2", "R5", "RF", "RE", "RB", "R7", "R3", "RC", "R6", "R9", "R1", "R8", "RA", "RD", "S0", "S4", "S2", "S9", "S5", "SF", "S7", "S3", "SE", "SC", "S6", "S1", "S8", "SB", "SA", "SD"], "industry": {"construction": ["40", "41", "42", "43", "54"]}}')
,(15,'SIN DATO','fa-question-circle','{}');

COMMIT;
