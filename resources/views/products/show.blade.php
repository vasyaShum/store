@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>{{$product->name }}</h2>
            </div>
            {{--<div class="pull-right">--}}
                {{--<a class="btn btn-primary" href="{{ route('products.index') }}"> Back</a>--}}
            {{--</div>--}}
        </div>
    </div>


<div class="row">
    <div class="col-lg-7 img">
        <img src="../img/{{$product->photo}}" alt="{{$product->name}}" style="height: 500px">
    </div>
    <div class="col-lg-5 info h4">
        <div class="form-group">
        <strong>Ціна:</strong>
        <h1>{{ $product->price }} грн.</h1><br>
        </div>
        <div class="form-group">
            <strong>Кількість:</strong>
            {{ $product->count }} шт.
        </div>
        <div class="form-group">
            <strong>Опис:</strong>
            {{ $product->detail }}
        </div>
        <div class="form-group">
            <a href="{{route('cart.addToCart', ['id' => $product->id])}}" class="btn-lg btn-success">Купити</a>
        </div>
    </div>
</div>
@endsection