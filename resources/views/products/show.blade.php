@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>{{$product->name }}</h2><br>
            </div>
        </div>
    </div>


<div class="row">
    <div class="col-lg-6">
        <img src="../img/{{$product->photo}}" class="img-fluid" alt="{{$product->name}}">
    </div>
    <div class="col-lg-6 info h4">
        <div class="form-group">
        <strong>Ціна:</strong>
        <h1>{{ $product->price }} грн.</h1>
        </div>
        @if ($product->count <= 0)
        <div class="form-group">
            <span class="text-danger">Немає в наявності</span>
        </div>
        @else
        <div class="form-group py-4">
            <a href="{{route('cart.addToCart', ['id' => $product->id])}}" class="btn-lg btn-success px-5">Купити</a>
        </div>
        @endif

{{--        <div class="form-group">--}}
{{--            <span class="badge badge-pill"><div class="h6 font-weight-bold">{{ $product->count }} шт.</div></span>--}}
{{--        </div>--}}
        <div class="form-group">
            {{--<strong>Опис:</strong>--}}
            <div style="padding-bottom: 10px; padding-top: 20px">
                {!! $product->detail !!}
            </div>
        </div>
    </div>
</div>

    <hr>
    <div class="row comments p-xs-3 p-sm-3 p-md-0">
        <h2>Коментарі</h2>
        <div class="w-100"></div>



        @if(Auth::check())
            {!! Form::open(array('route' => array('comment.add',$product->id),'method'=>'POST')) !!}

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group row">
                        <div class="col-12">
                            <div class="text-secondary">Новий коментар:</div>

                            <textarea name="text" cols="150" rows="3" maxlength="500" style="width: 100% " required></textarea>
                            <button type="submit" class="btn btn-primary my-3">Додати</button>
                        </div>
    {{--                    {!! Form::text('text', null, array('placeholder' => 'Ваш коментар','class' => 'form-control')) !!}--}}
                    </div>
                </div>



            </div><div class="col-xs-12 col-sm-12 col-md-12">
                @if ($message = Session::get('success'))
                    <div class="alert alert-success">
                        <p>{{ $message }}</p>
                    </div>
                @endif
            </div>

            {!! Form::close() !!}
        @endif

        <div class="row container">
            @if(count($comments))
                @foreach($comments as $comment)
                    <div class="comment-item col-lg-12 bg-white m-2 p-4" style="font-size: 17px">
                        <div class="row">
                            <div class="col-lg-9 pb-1 d-flex align-items">
                                <i class="material-icons pr-1" aria-hidden="true" style="font-size: 25px;">account_circle</i>
                                <strong>{{$comment->name}}</strong>
                            </div>
                            <div class="col-lg-3"><i style="font-size: 16px; color: #cccccc;">{{$comment->created_at}}</i>
                                @if(Auth::check())
                                    @if($comment->user_id == Auth::user()->id)
                                        @if(strtotime($comment->created_at) > strtotime(date("Y-m-d H:i:s")) - (5*60))
                                            <a href="{{route('comment.delete',['comment_id' => $comment->id, 'product_id' => $product->id])}}" class="close" style="font-size: 30px" aria-label="Close">
                                                &times;
                                            </a>
                                        @endif
                                    @elseif(Auth::user()->hasAnyRole('admin'))
                                        <a href="{{route('comment.delete',['comment_id' => $comment->id, 'product_id' => $product->id])}}" class="close" style="font-size: 30px" aria-label="Close">
                                            &times;
                                        </a>
                                    @endif
                                @endif
                            </div>
                        </div>
                        <div class="pt-2">{{$comment->text}}</div>
                    </div>
                @endforeach
            @else
                <div class="comment-item col bg-white m-2 p-3" style="font-size: 17px">
                    Немає коментарів
                </div>
            @endif
        </div>
    </div>
@endsection