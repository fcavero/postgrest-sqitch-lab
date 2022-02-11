# postgrest-sqitch-lab

Ejecuta una instancia de [PostgREST](https://postgrest.com/) habiendo desplegado el esquema de la base de datos usando [Sqitch](http://sqitch.org), e, incluso, cargado en las tablas maestras la información mínima. También incluye un contenedor con [Swagger UI](https://github.com/swagger-api/swagger-ui), por su indudable interés.

## Variables de entorno 🔖

- *PGRST_DB_URI* (obligatoria) - Cadena de conexión de la BBDD.
- *SQITCH_DEPLOY* (por defecto *deploy*) - Comando de Sqitch para desplegar cosas. Es posible añadirle opciones (v.g. `deploy --verify`).
- *SQITCH_VERIFY* (por defecto *verify*) - Comando de Sqitch para validaciones.
- *PGRST_QUIET* (por defecto *false*)


## Uso  🔧 

### Arrancar los contenedores

```shell
$ docker-compose up -d
```


### Echar abajo los contenedores

```shell
$ docker-compose stop
```


Sin embargo, si queremos, además, cepillarnos los contenedores ─y perder tristemente todo─ haremos esto:

```docker-compose down --remove-orphans -v```


## PostgREST

Una vez levantado el contenedor, lo encontraremos aquí → http://localhost:3000

Es posible jugar con los datos ya cargados de las tablas maestras:

- `http://localhost:3000/vehicle_brand`
- `http://localhost:3000/tt_vehicle_brand?txt_name=eq.SEAT`
- `http://localhost:3000/tt_vehicle_brand?txt_name=like.*NAULT*`

La lista completa de operadores para realizar consultas es tremendito → https://postgrest.org/en/v7.0.0/api.html#operators

Podemos indicar qué columnas queremos recuperar de una tabla dada (`?select=col1,col2,col3...,coln`):

```
GET http://localhost:3000/tt_vehicle_category?select=txt_description,json_vehicles

[{
		"id": 1,
		"txt_description": "TURISMO"
	},
	{
		"id": 2,
		"txt_description": "MOTOCICLETA / CICLOMOTOR"
	},
	{
		"id": 3,
		"txt_description": "INDUSTRIAL LIGERO"
	},
	{
		"id": 4,
		"txt_description": "INDUSTRIAL PESADO"
	},
	{
		"id": 5,
		"txt_description": "TAXI"
	},
	{
		"id": 6,
		"txt_description": "VTC"
	},
	{
		"id": 7,
		"txt_description": "AUTOBÚS / AUTOCAR"
	},
	{
		"id": 8,
		"txt_description": "VEHÍCULO ESPECIAL"
	},
	{
		"id": 9,
		"txt_description": "AUTOESCUELA"
	},
	{
		"id": 10,
		"txt_description": "VEHÍCULO ADAPTADO"
	},
	{
		"id": 11,
		"txt_description": "VEHÍCULO DE SERVICIOS"
	},
	{
		"id": 12,
		"txt_description": "TRACTOCAMIÓN"
	},
	{
		"id": 13,
		"txt_description": "CARAVANA / AUTOCARAVANA"
	},
	{
		"id": 14,
		"txt_description": "REMOLQUE / SEMIRREMOLQUE"
	},
	{
		"id": 15,
		"txt_description": "SIN DATO"
	}
]
```

Incluso están soportadas, incluso, las consultas a columnas ```JSON``` o ```JSONB```, por amor de Dios:

```
GET http://localhost:3000/t_vehicle?select=id,txt_plate,json_capture_data->datosTecnicos->potencias

[{
	"id": "9872a2b6-7d51-47dd-8e91-54b339a142c4",
	"txt_plate": "0000HFT",
	"potencias": {
		"cilindrada": 1598.0,
		"potenciaFiscal": 11.64,
		"potenciaNetaMax": 77.0,
		"relPotenciaPeso": 0.0
	}
}]
```
Más información aquí, precisamente aquí → https://postgrest.org/en/v7.0.0/api.html#json-columns

Pero, un momento, que para hacer esta última consulta ha sido necesario insertar ese vehículo. Y es que también podemos ejecutar sentencias *INSERT* y sentencias *UPSERT*:
```
POST http://localhost:3000/t_vehicle

{
	"txt_plate": "0000HFT",
	"id_industry_type": "1000",
	"id_vehicle_type": "40",
	"id_service": "B00",
	"bool_state": true,
	"json_capture_data": {
		"datosGenerales": {
			"descripcionVehiculo": {
				"marca": {
					"codigo": "01709",
					"descripcion": "SEAT"
				},
				"modelo": "LEON",
				"nive": "",
				"servicio": {
					"codigo": "B00",
					"descripcion": "PART-SIN ESPECIFICAR"
				},
				"tipoIndustria": {
					"codigo": "1000",
					"descripcion": "1000"
				},
				"tipoVehiculo": {
					"codigo": "40",
					"descripcion": "TURISMO"
				}
			},
		},
		"datosTecnicos": {
			"masas": {
				"masaMaxTecnica": 1860,
				"masaServicio": 1365,
				"pesoMaximo": 1860,
				"tara": 1290
			},
			"potencias": {
				"cilindrada": 1598.0,
				"potenciaFiscal": 11.64,
				"potenciaNetaMax": 77.0,
				"relPotenciaPeso": 0.0
			}
		}
	}
}
```

Ojo cuidao, que para que funcione lo anterior el usuario de PostgREST debe tener privilegios suficientes, porque en caso contrario recibiremos este error:
```
{
    "hint": null,
    "details": null,
    "code": "42501",
    "message": "permission denied for table t_vehicle"
}
```
La definición de roles adecuados y su relación con la autenticación de PostgREST no es baladí; no se ha incluido en el laboratorio en aras de simplificar conceptos. Puede echarse un ojirri aquí, precisamente aquí → `https://postgrest.org/en/stable/auth.html#`

Bueno, esto es muy grande, potente y rápido. Consúltese la documentación oficial para regocijo de sus autores → https://postgrest.org/en/stable/index.html

Recordad que un par de horas de prueba y error os pueden ahorrar diez minutos de leer la documentación.

### Swagger UI 📑

Una vez levantado el contenedor, lo encontraremos aquí → `http://localhost:8080`

Está lleno de estr... de colorines, y el que avisa no es traidor.
