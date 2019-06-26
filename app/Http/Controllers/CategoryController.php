<?php

namespace App\Http\Controllers;

use App\Category;
use App\Comment;
use Illuminate\Http\Request;
use App\Product;

class CategoryController extends Controller
{
    public function index(Category $category)
    {
        $products = Product::latest()->paginate(15);
        return view('category.index',compact('products'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    public function show(Category $category)
    {
        $products = Product::where('category_id',$category->id)->latest()->paginate(15);
        return view('category.show',compact('products','category'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    public function productShow($id) {
        $product = Product::find($id);
        $comments = Comment::where('product_id',$id)->get();
            return view('products.show',compact(['product','comments']));
    }

}
