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

Route::get('/profile', [
    'uses' => 'HomeController@getProfile',
    'as' => 'profile'
]);

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

Route::get('/remove/{id}', [
    'uses' => 'CartController@getRemoveItem',
    'as' => 'cart.remove'
]);

Route::group(['middleware' => ['auth']], function() {
    Route::resource('roles','RoleController');
    Route::resource('users','UserController');
    Route::resource('products','ProductController');
    Route::resource('order','OrderController');
    Route::get('/set-status/{id}/{status}', [
        'uses' => 'OrderController@setStatus',
        'as' => 'order.setStatus'
    ]);

});
Route::resource('category','CategoryController');

Route::get('/product/{id}', [
    'uses' => 'CategoryController@productShow',
    'as' => 'products.show'
]);

Route::post('/comment-add/{id}', [
    'uses' => 'CommentController@addComment',
    'as' => 'comment.add'
]);

Route::get('/comment-delete/{comment_id}/{product_id}', [
    'uses' => 'CommentController@deleteComment',
    'as' => 'comment.delete'
]);


Route::get('/{lang}', function ($lang){
    App::setlocale($lang);
    return view('welcome');
});

