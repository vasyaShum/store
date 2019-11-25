<?php


namespace App\Http\Controllers;


use App\Category;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
//use Illuminate\Support\Facades\Hash;


class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
        $this->middleware('permission:product-list');
        $this->middleware('permission:product-create', ['only' => ['create','store']]);
        $this->middleware('permission:product-edit', ['only' => ['edit','update']]);
        $this->middleware('permission:product-delete', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::latest()->paginate(5);
        return view('products.index',compact('products'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }




    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::pluck('name')->all();
        return view('products.create',compact('categories'));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        request()->validate([
            'name' => 'required',
            'detail' => 'required',
            'price' => 'required',
            'count' => 'required',
            'photo' => 'required | mimes:jpeg,jpg,png',
            'category_id' => 'required'
        ]);


        $path = '../public/img/';
        $photo_src = $_FILES['photo']['name'];
        copy($_FILES['photo']['tmp_name'], $path . $_FILES['photo']['name']);

        Product::create(['name' => $request->name,
            'detail' => $request->detail,
            'price' => $request->price,
            'count' => $request->count,
            'photo' => $photo_src,
            'category_id' => $request->category_id + 1
        ]);


        return redirect()->route('products.index')
            ->with('success','Product created successfully.');
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        return view('products.show',compact('product'));
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        $categories = Category::pluck('name')->all();
        return view('products.edit',compact('product','categories'));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request['category_id'] += 1;

        if ($_FILES['update_photo']['name']) {
//          update new photo
            $this->validate($request, ['update_photo' => 'required | mimes:jpeg,jpg,png']);
            $path = '../public/img/';

//          copy filename old photo

            $old_photo = $path . $request['photo'];
//          check if new file has unique name
            if (file_exists($path . $_FILES['update_photo']['name'])) {
                $i = 1;

                do {
                    $ext = pathinfo($_FILES['update_photo']['name'], PATHINFO_EXTENSION);
                    $file = pathinfo($_FILES['update_photo']['name'], PATHINFO_FILENAME);
                    $temp = $file . "($i)" . '.' . $ext;
                    $i++;
                } while (file_exists($path . $temp));
                $_FILES['update_photo']['name'] = $temp;
            }

            copy($_FILES['update_photo']['tmp_name'], $path . $_FILES['update_photo']['name']);
            $request['photo'] = $_FILES['update_photo']['name'];
        }
        $this->validate($request,[
            'name' => 'required',
            'detail' => 'required',
            'price' => 'required',
            'count' => 'required',
            'photo' => 'required',
            'category_id' => 'required'
        ]);


        $input = $request->all();
        $product = Product::find($id);
        $product->update($input);

//      delete old_photo
        if (isset($old_photo))
            if (file_exists($old_photo))
                unlink($old_photo);

        return redirect()->route('products.index')
            ->with('success','Product updated successfully');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $path = '../public/img/';
        $file = DB::table('products')->where('id',$id)->first();
        $image = $path . $file->photo;

        if (file_exists($image))
            unlink($image);

        DB::table("products")->where('id',$id)->delete();
        DB::table("comments")->where('product_id',$id)->delete();

        return redirect()->route('products.index')
            ->with('success','Product deleted successfully');
    }
}