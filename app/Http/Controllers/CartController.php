<?php


namespace App\Http\Controllers;


use App\Cart;
use App\Order;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Session;

//use Illuminate\Support\Facades\Hash;


class CartController extends Controller
{
    public function getAddToCart(Request $request, $id)
    {
        $product = Product::find($id);
        $oldCart = Session::has('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart);
        $cart->add($product,$product->id);

        $request->session()->put('cart',$cart);
//        dd($request->session()->get('cart'));
        return redirect()->route('category.index');
    }

    public function getCart() {
        if (!Session::has('cart')) {
            return view('cart.index');
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
        return view('cart.index', ['products' => $cart->items, 'totalPrice' => $cart->totalPrice]);
    }

    public function getCheckout() {
        if (!Session::has('cart')) {
            return view('cart.index');
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
        $total = $cart->totalPrice;
        return view('cart.checkout',['total' => $total]);
    }
    public function postCheckout(Request $request) {
        if (!Session::has('cart')) {
            return redirect()->route('cart.index');
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);

        try {

            $order = new Order();
            $order->cart = serialize($cart);
            $order->address = $request->input('address');
            $order->email = $request->input('email');
            $order->name = $request->input('name');
            $order->phone = $request->input('phone');

            $order->save();

        } catch (\Exception $e) {
            return redirect()->route('checkout')->with('error', $e->getMessage());
        }

        Session::forget('cart');
        return redirect()->route('category.index')->with('success', 'Успішно придбано товари');
    }
}