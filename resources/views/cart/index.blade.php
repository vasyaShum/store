@extends('layouts.app')

@section('title')
Shoping Cart
@endsection

@section('content')
    <div class="pull-right">
    <a class="btn btn-primary" href="{{ route('category.index') }}"> Back</a>
    </div>
    @if(Session::has('cart'))
        <div class="row">
            <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
                <ul class="list-group">
                    @foreach($products as $product)
                        <li class="list-group-item">
                            <a href="{{route('cart.remove',['id' => $product['item']['id']])}}" class="close" style="margin-left: 10px" aria-label="Close">
                                &times;
                            </a>
                            <span class="badge">{{ $product['qty'] }}</span>
                            <strong>{{ $product['item']['name'] }}</strong>
                            <span class="label label-success">{{ $product['price'] }}</span>

                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
                <strong>Всього: {{$totalPrice}} грн.</strong>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
                <a href="{{route('checkout')}}" class="btn btn-success">Перевірити</a>
            </div>
        </div>
    @else
        <div class="row">
            <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
                    <p class="list-group-item">Ваш кошик пустий.</p>
            </div>
        </div>
    @endif
@endsection