<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Prospecto;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\SanitizedRequest as SanitizedRequest;
use App\Traits\HashedRequest;

class ProspectoController extends Controller
{
    use SanitizedRequest, HashedRequest;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(\Illuminate\Http\Request $request)
    {

        $prospecto = Prospecto::all();
        $response = Response::json($request->header(), 200);

        return $response;

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //

        if ( (!$request->nombre) || (!$request->apellidoPaterno) ||
             (!$request->apellidoMaterno) || (!$request->edad) ||
             (!$request->email) || (!$request->password) ||
             (!$request->generoId) || (!$request->estadoCivilId) ||
             (!$request->programaId) ) {

                $response = Response::json([
                    'message' => 'Por favor escriba todos los campos requeridos.'
                ], 422);
                return $response;
        }


        $apellidoMaterno = $this->sanitize( $request->apellidoMaterno );
        $apellidoPaterno = $this->sanitize( $request->apellidoPaterno );
        $confirmarPassword = $this->sanitize( $request->confirmarPassword );
        $edad = $this->sanitize( $request->edad );
        $email = $this->sanitize( $request->email );
        $estadoCivilId = $this->sanitize( $request->estadoCivilId );
        $generoId = $this->sanitize( $request->generoId );
        $programaId = $this->sanitize( $request->programaId );
        $licenciaturaId = $this->sanitize( $request->licenciaturaId );
        $nivelId = $this->sanitize( $request->nivelId );
        $nombre = $this->sanitize( $request->nombre );
        $password = $this->sha( $this->sanitize( $request->password ));
        $postgraduateId = $this->sanitize( $request->postgraduateId );

/*
        $apellidoMaterno = $this->sanitize( 'Botello');
        $apellidoPaterno = $this->sanitize( 'Osornio' );
        $edad = $this->sanitize( 34 );
        $email = $this->sanitize( 'osornio1@live.com' );
        $estadoCivilId = $this->sanitize( 1 );
        $generoId = $this->sanitize( 2 );
        $programaId = $this->sanitize( 2 );
        $licenciaturaId = $this->sanitize( 2 );
        $nivelId = $this->sanitize( 2 );
        $nombre = $this->sanitize( 'Erik' );
        $password = $this->sha( $this->sanitize( '1234567890' ));
*/


        $prospecto = new Prospecto;
        $prospecto->nombre = $nombre;
        $prospecto->apellido_paterno = $apellidoPaterno;
        $prospecto->apellido_materno = $apellidoMaterno;
        $prospecto->edad = $edad;
        $prospecto->email = $email;
        $prospecto->password = $password;
        $prospecto->genero_id = $generoId;
        $prospecto->estado_civil_id = $estadoCivilId;
        $prospecto->programa_id = $programaId;
        $prospecto->fecha_creacion = date("Y-m-d H:i:s");
        $prospecto->fecha_actualizacion = date("Y-m-d H:i:s");

        $saved = $prospecto->save();

        if ( !$saved ) {

            $response = Response::json([
                'message' => 'No fue posible realizar el registro.'
            ], 422);
            return $response;

        }

        $response = Response::json(['id' => $prospecto->id,
                                    'mensaje' => 'Se creó el usuario.',
                                    'params' => $request], 201);

        return $response;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id, \Illuminate\Http\Request $request)
    {
        //
        $email = $request->header( 'php-auth-user' );
        $password = $request->header( 'php-auth-pw' );

        if ( !$this->checkUser( $email, $password ) ) {
            $response = Response::json([
                                    'message' => 'No está autorizado.'
                                ], 422);
            return $response;
        }

        $prospecto = DB::table('prospecto')
                          ->select('prospecto.nombre',
                                   'prospecto.apellido_paterno',
                                   'prospecto.apellido_materno',
                                   'prospecto.edad',
                                   'prospecto.email',
                                   'prospecto.genero_id',
                                   'prospecto.estado_civil_id',
                                   'prospecto.programa_id',
                                   'prospecto.fecha_creacion',
                                   'genero.etiqueta_genero',
                                   'estado_civil.etiqueta_edo_civil',
                                   'nivel_interes.etiqueta_nivel_int',
                                   'programa.etiqueta_programa')
                          ->join('genero', 'prospecto.genero_id', '=', 'genero.id')
                          ->join('estado_civil', 'prospecto.estado_civil_id', '=', 'estado_civil.id')
                          ->join('programa', 'prospecto.programa_id', '=', 'programa.id')
                          ->join('nivel_interes', 'nivel_interes.id', '=', 'programa.nivel_interes_id')
                          ->where('prospecto.id', $id)
                          ->first();

        $response = Response::json($prospecto, 200);

        return $response;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    private function checkUser( $email, $password ) {

       $count = DB::table('prospecto')
                        ->select( 'prospecto.email' )
                        ->where([
                                  ['prospecto.email',
                                    '=', $email],
                                  ['prospecto.password',
                                    '=', $this->sha( $password )],
                                 ])
                        ->count();

      if ( $count > 0 ) {

        return true;

      } else {

        return false;

      }

    }

}
