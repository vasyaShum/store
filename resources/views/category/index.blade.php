@extends('layouts.app')


@section('content')

    @if ($message = Session::get('success'))
    <div class="alert alert-success">
        <p>{{ $message }}</p>
    </div>
@endif

    <div class="row p-4">
        <div class="col-xs-12 col-md-12 col-lg-12">
            <div class="pull-left">
                <h2>Усі товари</h2>
            </div>

        </div>
        @foreach ($products as $product)
            <div class="col-xs-8 col-sm-5  col-md-5 col-lg-3 bg-white m-2 p-4">

                <div class="row">
                    <div class="col-12">
                        <a href="{{ route('products.show',$product->id) }}"><img class="img-fluid" src="../img/{{$product->photo}}" alt="{{$product->name}}"></a>
                    </div>
                    <div class="col-12">
                        <a href="{{ route('products.show',$product->id) }}">
                            @if (strlen($product->name) > 55)
                                {{substr($product->name,0,55) . " ..."}}
                            @else
                                {{$product->name}}
                            @endif
                        </a>
                    </div>

                    <div class="col-12">
                        <p class="h3">{{$product->price}} грн.</p>
                        @if ($product->count <= 0)
                            <span class="text-danger">Немає в наявності</span>
                        @else
                            <a href="{{route('cart.addToCart', ['id' => $product->id])}}" class="btn btn-success">Купити</a>
                        @endif
                    </div>

                </div>

            </div>

        @endforeach
    </div>

    {!! $products->links() !!}

@endsection