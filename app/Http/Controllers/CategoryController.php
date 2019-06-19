<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use App\Product;

class CategoryController extends Controller
{
    public function index(Category $category)
    {
        $products = Product::latest()->paginate(5);
        return view('category.index',compact('products'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    public function show(Category $category)
    {
        $products = Product::where('category_id',$category->id)->get();
        return view('category.show',compact('products','category'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

}
