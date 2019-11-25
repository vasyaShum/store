@extends('layouts.app')


@section('content')
    <div class="row">
        @widget('AdminMenuWidgets')
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Керування продуктами</h2>
            </div>
            <div class="pull-right">
                @can('product-create')
                    <a class="btn btn-success" href="{{ route('products.create') }}"> Create New Product</a>
                @endcan
            </div>
        </div>
    </div>


    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif


    <table class="table table-bordered">
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Details</th>
            <th>Price</th>
            <th>Count</th>
            <th>Photo</th>
            <th>Category ID</th>
            <th width="210px">Action</th>
        </tr>
        @foreach ($products as $product)
            <tr>
                <td>{{ ++$i }}</td>
                <td>{{ $product->name }}</td>
                <td>{!! $product->detail !!}</td>
                <td>{{ $product->price }}</td>
                <td>{{ $product->count }}</td>
                <td><a href="img/{{$product->photo}} ">{{ $product->photo }}</a></td>
                <td>{{ $product->category_id }}</td>
                <td>
                    {!! Form::open(['method'=>'DELETE','route' => ['products.destroy',$product->id]]) !!}
                        <a class="btn btn-info" href="{{ route('products.show',$product->id) }}">Show</a>
                        @can('product-edit')
                            <a class="btn btn-primary" href="{{ route('products.edit',$product->id) }}">Edit</a>
                        @endcan

                        @can('product-delete')
                        {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
                        @endcan
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
    </table>


    {!! $products->links() !!}


@endsection