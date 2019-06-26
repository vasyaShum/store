<?php
/**
 * Created by PhpStorm.
 * User: T430s
 * Date: 19.06.2019
 * Time: 16:41
 */

namespace App\Http\Controllers;


use App\Order;

class OrderController extends Controller
{

    function __construct()
    {
        $this->middleware('permission:role-list');
        $this->middleware('permission:role-create', ['only' => ['create','store']]);
        $this->middleware('permission:role-edit', ['only' => ['edit','update']]);
        $this->middleware('permission:role-delete', ['only' => ['destroy']]);
    }

    public function index()
    {
        $orders = Order::latest()->paginate(5);
        $orders->transform(function ($order, $key){
            $order->cart = unserialize($order->cart);
            return $order;
        });

        return view('order.index',compact('orders'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    public function setStatus($id,$status) {
        $order = Order::find($id);
        $order->status = $status;
        $order->save();
        return redirect()->route('order.index');
    }

}