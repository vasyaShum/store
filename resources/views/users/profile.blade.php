@extends('layouts.app')

@section('content')

    @widget('ProfileMenuWidgets')

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif

    {!! Form::open(array('route' => 'editProfile','method'=>'POST')) !!}
    <div class="row">
        <div class="col-xs-12">
            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                <label for="name">Ім'я</label>
                @if ($errors->has('name'))
                    <span class="help-block">
                        <strong>{{ $errors->first('name') }}</strong>
                    </span>
                @endif
                {!! Form::text('name', Auth::user()->name, array('class' => 'form-control', 'id' => 'name','required')) !!}
            </div>
        </div>

        <div class="col-xs-12">
            <div class="form-group{{ $errors->has('last_name') ? ' has-error' : '' }}">
                <label for="last_name">Прізвище</label>
                @if ($errors->has('last_name'))
                    <span class="help-block">
                        <strong>{{ $errors->first('last_name') }}</strong>
                    </span>
                @endif
                {!! Form::text('last_name', Auth::user()->last_name, array('class' => 'form-control', 'id' => 'last_name','required')) !!}
            </div>
        </div>

{{--        <div class="col-xs-12">--}}
{{--            <div class="form-group">--}}
{{--                <label for="name">Адреса</label>--}}
{{--                {!! Form::text('address', null, array('class' => 'form-control', 'id' => 'address', 'placeholder' => 'Місто, вулиця, номер', 'required')) !!}--}}
{{--            </div>--}}
{{--        </div>--}}

        <div class="col-xs-12">
            <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                <label for="email">Електронна адреса</label>
                @if ($errors->has('email'))
                    <span class="help-block">
                        <strong>{{ $errors->first('email') }}</strong>
                    </span>
                @endif

                {!! Form::email('email', Auth::user()->email, array('class' => 'form-control', 'id' => 'email','required')) !!}
            </div>
        </div>
        <div class="col-xs-12">
            <div class="form-group{{ $errors->has('phone') ? ' has-error' : '' }}">
                <label for="phone">Телефон</label>
                @if ($errors->has('phone'))
                    <span class="help-block">
                        <strong>{{ $errors->first('phone') }}</strong>
                    </span>
                @endif

                {!! Form::text('phone', Auth::user()->phone, array('class' => 'form-control', 'id' => 'phone','required')) !!}
            </div>
        </div>

        <div class="col-xs-12">
            <div class="form-group">
                <button type="submit" class="btn btn-success">Зберегти</button>
                <a href="{{route('orders')}}" class="btn btn-primary">Вийти</a>
            </div>
        </div>
    </div>
    {!! Form::close() !!}

@endsection