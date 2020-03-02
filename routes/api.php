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

Route::post('login', 'API\UserController@login');
Route::post('register', 'API\UserController@register');
Route::post('details', 'API\UserController@details');
Route::post('signup', 'API\RegisterController@register');
Route::get('/product/all', 'ProductController@all');
Route::get('/product/detailed', 'ProductController@detailed');
Route::get('/order/all', 'OrderController@all');
Route::get('/order/detailed', 'OrderController@detailed');
Route::get('/supplier/all', 'SupplierController@index');
Route::post('/supplier/add', 'SupplierController@create');
Route::put('/supplier/{supplier}/edit', 'SupplierController@update');
Route::put('/supplier/edit/{supplier}', 'SupplierController@update'); //postman
Route::delete('/supplier/{supplier}', 'SupplierController@destroy');
Route::delete('/supplier/delete/{supplier}', 'SupplierController@destroy');// postman
Route::get('/api/product/getCompany', 'SupplierController@getSuppliers');


Route::group(['middleware' => 'auth:api'], function(){
Route::post('orders', 'API\UserController@orders');
});
