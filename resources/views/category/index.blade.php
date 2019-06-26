@extends('layouts.app')


@section('content')

    @if ($message = Session::get('success'))
    <div class="alert alert-success">
        <p>{{ $message }}</p>
    </div>
@endif

    <div class="row">
        <div class="col-xs-12 col-md-12 col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Усі товари</h2>
            </div>

        </div>
        @foreach ($products as $product)
            <div class="col-sm-12  col-md-6 col-lg-3" style="background: white;margin: 5px;padding: 10px;height: 380px">
                <a href="{{ route('products.show',$product->id) }}"><img src="../img/{{$product->photo}}" alt="{{$product->name}}" style="max-width: 100%;
      height: auto;"></a>
                <a href="{{ route('products.show',$product->id) }}">{{$product->name}}</a>
                <p class="h3">{{$product->price}} грн.</p>
                <a href="{{route('cart.addToCart', ['id' => $product->id])}}" class="btn btn-success">Купити</a>
            </div>

        @endforeach
    </div>

    {!! $products->links() !!}

@endsection