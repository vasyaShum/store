@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-xs-12 col-md-12 col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>{{$category->name}}</h2>
            </div>

        </div>
        @foreach ($products as $product)
            <div class="col-sm-12  col-md-6 col-lg-3" style="background: white;margin: 5px;padding: 10px">
                <a href="{{ route('products.show',$product->id) }}"><img src="../img/{{$product->photo}}" alt="{{$product->name}}" style="height: 200px" ></a>
                <a href="{{ route('products.show',$product->id) }}">{{$product->name}}</a>
                <p class="h3">{{$product->price}} грн.</p>
                <button class="btn btn-success">Купити</button>

            </div>
            <div class="col-sm-12  col-md-6 col-lg-3" style="background: white;margin: 5px;padding: 10px">
                <a href="{{ route('products.show',$product->id) }}"> <img src="../img/{{$product->photo}}" alt="{{$product->name}}" style="height: 200px" ></a>
                <a href="{{ route('products.show',$product->id) }}">{{$product->name}}</a>
                <p class="h3">{{$product->price}} грн.</p>
                <button class="btn btn-success">Купити</button>

            </div>
            <div class="col-sm-12  col-md-6 col-lg-3" style="background: white;margin: 5px;padding: 10px">
                <a href="{{ route('products.show',$product->id) }}"><img src="../img/{{$product->photo}}" alt="{{$product->name}}" style="height: 200px" ></a>
                <a href="{{ route('products.show',$product->id) }}">{{$product->name}}</a>
                <p class="h3">{{$product->price}} грн.</p>
                <button class="btn btn-success">Купити</button>

            </div>
            <div class="col-sm-12  col-md-6 col-lg-3" style="background: white;margin: 5px;padding: 10px">
                <a href="{{ route('products.show',$product->id) }}"><img src="../img/{{$product->photo}}" alt="{{$product->name}}" style="height: 200px" ></a>
                <a href="{{ route('products.show',$product->id) }}">{{$product->name}}</a>
                <p class="h3">{{$product->price}} грн.</p>
                <button class="btn btn-success">Купити</button>

            </div>

        @endforeach
    </div>


    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif


    {{--<table class="table table-bordered">--}}
        {{--<tr>--}}
            {{--<th>No</th>--}}
            {{--<th>Name</th>--}}
            {{--<th>Details</th>--}}
            {{--<th>Price</th>--}}
            {{--<th>Count</th>--}}
            {{--<th>Photo</th>--}}
            {{--<th>Category ID</th>--}}
            {{--<th width="280px">Action</th>--}}
        {{--</tr>--}}
        {{--@foreach ($products as $product)--}}
            {{--<tr>--}}
                {{--<td>{{ ++$i }}</td>--}}
                {{--<td>{{ $product->name }}</td>--}}
                {{--<td>{{ $product->detail }}</td>--}}
                {{--<td>{{ $product->price }}</td>--}}
                {{--<td>{{ $product->count }}</td>--}}
                {{--<td>{{ $product->photo }}</td>--}}
                {{--<td>{{ $product->category_id }}</td>--}}
                {{--<td>--}}
                    {{--<a class="btn btn-info" href="{{ route('products.show',$product->id) }}">Show</a>--}}
                {{--</td>--}}
            {{--</tr>--}}
        {{--@endforeach--}}
    {{--</table>--}}
    {{--<div class="products row">--}}
    {{--@foreach ($products as $product)--}}
        {{--<div class="col-md-4">--}}
            {{--<img src="../img/{{$product->photo}}" alt="{{$product->name}}" class="container-fluid">--}}

        {{--</div>--}}
    {{--@endforeach--}}
    {{--</div>--}}
@endsection