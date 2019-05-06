<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Prospecto extends Model
{

    protected $table = 'prospecto';
    public $timestamps = false;

    protected $fillable = [
        'nombre',
        'apellido_paterno',
        'apellido_materno',
        'edad',
        'email',
        'password',
        'genero_id',
        'estado_civil_id',
        'programa_id',
        'fecha_creacion',
        'fecha_actualizacion'

    ];

    public function getName()
    {
        return $this->nombre;
    }

}
