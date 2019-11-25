@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col">

                @widget('ProfileMenuWidgets')
            @if(count($orders))
                @foreach($orders as $order)
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <ul class="list-group">
                                @foreach($order->cart->items as $item)
                                <li class="list-group-item">
                                    <span class="badge">{{$item['price']}}</span>
                                    {{$item['item']['name']}}  <span class="label label-primary">{{$item['qty']}} шт.</span>
                                </li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <strong class="col-xs-8 col-sm-8 col-md-7">Всього: {{$order->cart->totalPrice}} грн.</strong>
                                <span class="text-success col-xs-4 col-sm-4 col-md-5 d-flex justify-content-end">{{$order->status}}</span>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <p class="list-group-item">Немає замовлень</p>
                    </div>
                </div>
            @endif
        </div>
    </div>
@endsection


