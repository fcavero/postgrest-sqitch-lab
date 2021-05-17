# docker-postgrest-sqitch

Ejecuta una instancia de [PostgREST](https://postgrest.com/) habiendo desplegado el esquema de la base de datos usando [Sqitch](http://sqitch.org), e, incluso, cargado en las tablas maestras la información mínima. También incluye un contenedor con [Swagger UI](https://github.com/swagger-api/swagger-ui), por su indudable interés.

## Variables de entorno

- `PGRST_DB_URI` (obligatoria) - Cadena de conexión de la BBDD.
- `SQITCH_DEPLOY` (por defecto `deploy`) - Comando de Sqitch para desplegar cosas. Es posible añadirle opciones (v.g. `deploy --verify`).
- `SQITCH_VERIFY` (por defecto `verify`) - Comando de Sqitch para validaciones.
- `PGRST_QUIET` (por defecto `false`)



## Uso

### Arrancar los contenedores

```docker-compose up -d```


### Echar abajo los contenedores

```docker-compose down --remove-orphans -v```


### Postgrest

Se encuentra aquí → http://localhost:3000

Es posible jugar con los datos ya cargados de las maestras:

- http://localhost:3000/vehicle_brand
- http://localhost:3000/tt_vehicle_brand?txt_name=eq.SEAT
- http://localhost:3000/tt_vehicle_brand?txt_name=like.*NAULT*
- http://localhost:3000/tt_vehicle_category?select=txt_description,json_vehicles


### Swagger UI

Se encuentra aquí → http://localhost:8080

