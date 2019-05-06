<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\SanitizedRequest as SanitizedRequest;
use App\Traits\HashedRequest;

class LoginController extends Controller
{
    use HashedRequest;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(\Illuminate\Http\Request $request)
    {
        $found = false;
        $id = '';
        $email = $request->header( 'php-auth-user' );
        $password = $request->header( 'php-auth-pw' );
        //
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

            $result = DB::table('prospecto')
                                            ->select( 'prospecto.id' )
                                            ->where([
                                                      ['prospecto.email',
                                                        '=', $email],
                                                      ['prospecto.password',
                                                        '=', $this->sha( $password )],
                                                     ])
                                            ->first();
            $id = $result->id;
            $found = true;

          } else {

            $found = false;

          }

        $response = Response::json([ 'found' => $found, 'id' => $id ], 201);

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
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //

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
}
