<?php

use Illuminate\Database\Seeder;
use App\Prospecto;
use Faker\Factory as Faker;

class ProspectoTableSeeder extends Seeder
{

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('es_ES');

        for($i = 0; $i < 10; $i++) {

            Prospecto::create([
                        'nombre' => $faker->name,
                        'apellido_paterno' => $faker->lastName,
                        'apellido_materno'  => $faker->lastName,
                        'edad' => $faker->numberBetween( $min = 14, $max =100 ),
                        'email' => $faker->email,
                        'password' => $faker->password,
                        'genero_id' => $faker->numberBetween($min = 1, $max = 4) ,
                        'estado_civil_id' => $faker->numberBetween($min = 1, $max = 4),
                        'programa_id' => $faker->numberBetween($min = 2, $max = 3),
                        'fecha_creacion' => $faker->dateTime($max = 'now', $timezone = null),
                        'fecha_actualizacion' => $faker->dateTime($max = 'now', $timezone = null)
                ]);

        }


    }
}
