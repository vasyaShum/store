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
        <img src="../img/{{$product->photo}}" alt="{{$product->name}}" style="max-width: 100%;
      height: auto;">
    </div>
    <div class="col-lg-6 info h4">
        <div class="form-group">
        <strong>Ціна:</strong>
        <h1>{{ $product->price }} грн.</h1><br>
        </div>
        <div class="form-group">
            <strong>Кількість:</strong>
            {{ $product->count }} шт.
        </div>
        <div class="form-group">
            {{--<strong>Опис:</strong>--}}
            <div style="padding-bottom: 10px; padding-top: 20px">
                {!! $product->detail !!}
            </div>
        </div>
        <div class="form-group">
            <a href="{{route('cart.addToCart', ['id' => $product->id])}}" class="btn-lg btn-success">Купити</a>
        </div>
    </div>
</div>

    <br><br><br><hr>
    <div class="row comments">
        <h2>Коментарі</h2>

        @if ($message = Session::get('success'))
            <div class="alert alert-success">
                <p>{{ $message }}</p>
            </div>
        @endif

        @if(Auth::check())
            {!! Form::open(array('route' => array('comment.add',$product->id),'method'=>'POST')) !!}

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group">
                        <strong>Новий коментар:</strong>
    {{--                    {!! Form::text('text', null, array('placeholder' => 'Ваш коментар','class' => 'form-control')) !!}--}}
                        <textarea name="text" cols="130" rows="3" maxlength="500"></textarea>
                    </div>
                </div>


                <div class="col-xs-12 col-sm-12 col-md-12">
                    <button type="submit" class="btn btn-primary">Додати</button>
                </div>
            </div>

            {!! Form::close() !!}
        @endif

        <div class="row">
            @if(count($comments))
                @foreach($comments as $comment)
                    <div class="comment-item col-lg-11 bg-light" style="margin: 10px; padding: 20px; background: white; font-size: 17px">
                        <div class="row">
                            <div class="col-lg-9" style="display: flex; align-items: center; padding-bottom: 5px">
                                <i class="material-icons" aria-hidden="true" style="font-size: 25px; padding-right: 5px ">account_circle</i>
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
                        <span>{{$comment->text}}</span>
                    </div>
                @endforeach
            @else
                <div class="comment-item col-lg-11 bg-light" style="margin: 10px; padding: 20px; background: white; font-size: 17px">
                    Немає коментарів
                </div>
            @endif
        </div>
    </div>
@endsection