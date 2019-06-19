<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/add-to-cart/{id}', [
    'uses' => 'CartController@getAddToCart',
    'as' => 'cart.addToCart'
]);

Route::get('/shopping-cart', [
    'uses' => 'CartController@getCart',
    'as' => 'cart.shoppingCart'
]);

Route::get('/checkout', [
    'uses' => 'CartController@getCheckout',
    'as' => 'checkout'
]);

Route::post('/checkout', [
    'uses' => 'CartController@postCheckout',
    'as' => 'checkout'
]);

Route::group(['middleware' => ['auth']], function() {
    Route::resource('roles','RoleController');
    Route::resource('users','UserController');


});
Route::resource('category','CategoryController');
Route::resource('products','ProductController');

Route::get('/{lang}', function ($lang){
    App::setlocale($lang);
    return view('welcome');
});

