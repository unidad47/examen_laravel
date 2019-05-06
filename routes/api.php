<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1', 'middleware' => 'cors'], function(){
    Route::resource('prospecto', 'ProspectoController');
});

Route::group(['prefix' => 'v1', 'middleware' => 'cors'], function(){
    Route::resource('genero', 'GeneroController');
});

Route::group(['prefix' => 'v1', 'middleware' => 'cors'], function(){
    Route::resource('estadoCivil', 'EstadoCivilController');
});

Route::group(['prefix' => 'v1', 'middleware' => 'cors'], function(){
    Route::resource('nivelInteres', 'NivelInteresController');
});

Route::group(['prefix' => 'v1', 'middleware' => 'cors'], function(){
    Route::resource('programa', 'ProgramaController');
});

Route::group(['prefix' => 'v1', 'middleware' => 'cors'], function(){
    Route::resource('login', 'LoginController');
});
