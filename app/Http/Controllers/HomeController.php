<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home');
    }

    public function getOrders() {
        $orders = Auth::user()->orders;

        $orders->transform(function ($order, $key){
            $order->cart = unserialize($order->cart);
            return $order;
        });
        return view('users.orders',['orders' => $orders]);
    }

    public function getProfile() {

        return view('users.profile');
    }

    public function editProfile(Request $request)
    {

        if ($request['email'] != Auth::user()->email) {
            $this->validate($request, [
                'email' => 'required|string|email|max:255|unique:users',
            ]);
        }
        if ($request['phone'] != Auth::user()->phone) {
            $this->validate($request, [
                'phone' => 'required|string|max:12|unique:users',
            ]);
        }
        else {
            $this->validate($request, [
                'name' => 'required|string|max:255',
                'last_name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255',
                'phone' => 'required|string|max:12',
            ]);
        }

        $input = $request->all();
        $user = User::find(Auth::user()->id);
        $user->update($input);

        return redirect()->route('profile')
            ->with('success','Дані успішно збережено.');
    }
}
