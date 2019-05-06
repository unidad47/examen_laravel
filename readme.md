## Examen

Proporciona los endpoints para el examen.

Se generaron rutas en routes/api.php, archivos 'frontend' en public/unitec, seeder para pruebas de usuarios, traits para hash de passwords y sanitización básica de entradas, cambios en Http/Controllers/Middleware/Cors.php, creación de múltiples archivos en Http/Controllers.

Rutas principales:


    +--------+-----------+----------------------------------------+----------------------+-----------------------------------------------------+--------------+
    | Domain | Method    | URI                                    | Name                 | Action                                              | Middleware   |
    +--------+-----------+----------------------------------------+----------------------+-----------------------------------------------------+--------------+
    |        | GET|HEAD  | api/v1/estadoCivil                     | estadoCivil.index    | App\Http\Controllers\EstadoCivilController@index    | api,cors     |
    |        | GET|HEAD  | api/v1/genero                          | genero.index         | App\Http\Controllers\GeneroController@index         | api,cors     |
    |        | GET|HEAD  | api/v1/login/{login}                   | login.show           | App\Http\Controllers\LoginController@show           | api,cors     |
    |        | GET|HEAD  | api/v1/nivelInteres                    | nivelInteres.index   | App\Http\Controllers\NivelInteresController@index   | api,cors     |
    |        | GET|HEAD  | api/v1/programa                        | programa.index       | App\Http\Controllers\ProgramaController@index       | api,cors     |
    |        | GET|HEAD  | api/v1/prospecto                       | prospecto.index      | App\Http\Controllers\ProspectoController@index      | api,cors     |
    |        | GET|HEAD  | api/v1/prospecto/{prospecto}           | prospecto.show       | App\Http\Controllers\ProspectoController@show       | api,cors     |
    |        | POST      | api/v1/prospecto                       | prospecto.store      | App\Http\Controllers\ProspectoController@store      | api,cors     |
    +--------+-----------+----------------------------------------+----------------------+-----------------------------------------------------+--------------+

### Base de datos

La información de la base de datos se encuentra en estructura_y_datos_db/

- Archivos:

        EXAMEN_UNITEC_estado_civil.sql
        EXAMEN_UNITEC_genero.sql
        EXAMEN_UNITEC_licenciatura.sql
        EXAMEN_UNITEC_nivel_interes.sql
        EXAMEN_UNITEC_posgrado.sql
        EXAMEN_UNITEC_programa.sql
        EXAMEN_UNITEC_prospecto.sql


