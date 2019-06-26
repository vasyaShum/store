@extends('layouts.app')

@section('title')
    Shoping Cart
@endsection

@section('content')
    <div class="row">
        <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
            <h1>Перевірка</h1>
            <h4>Вся сумма: {{ $total }} грн.</h4>
            @if(Auth::check())
                {!! Form::open(array('route' => 'checkout','method'=>'POST')) !!}
                <div class="row">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="name">Ім'я</label>
                            {!! Form::text('name', Auth::user()->name, array('class' => 'form-control', 'id' => 'name','required')) !!}
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="last_name">Прізвище</label>
                            {!! Form::text('last_name', Auth::user()->last_name, array('class' => 'form-control', 'id' => 'last_name','required')) !!}
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="name">Адреса</label>
                            {!! Form::text('address', null, array('class' => 'form-control', 'id' => 'address', 'placeholder' => 'Місто, вулиця, номер', 'required')) !!}
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="email">Електронна адреса</label>
                            {!! Form::email('email', Auth::user()->email, array('class' => 'form-control', 'id' => 'email','required')) !!}
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="phone">Телефон</label>
                            {!! Form::text('phone', Auth::user()->phone, array('class' => 'form-control', 'id' => 'phone','required')) !!}
                        </div>
                    </div>

                    <div class="col-xs-12">
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">Оформити</button>
                        </div>
                    </div>
                </div>
                {!! Form::close() !!}
            @else
                {!! Form::open(array('route' => 'checkout','method'=>'POST')) !!}
                <div class="row">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="name">Ім'я</label>
                            {!! Form::text('name', null, array('class' => 'form-control', 'id' => 'name','required')) !!}
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="last_name">Прізвище</label>
                            {!! Form::text('last_name', null, array('class' => 'form-control', 'id' => 'last_name','required')) !!}
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="name">Адреса</label>
                            {!! Form::text('address', null, array('class' => 'form-control', 'id' => 'address', 'placeholder' => 'Місто, вулиця, номер', 'required')) !!}
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="email">Електронна адреса</label>
                            {!! Form::email('email', null, array('class' => 'form-control', 'id' => 'email','required')) !!}
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="phone">Телефон</label>
                            {!! Form::text('phone', null, array('class' => 'form-control', 'id' => 'phone','required')) !!}
                        </div>
                    </div>

                    <div class="col-xs-12">
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">Оформити</button>
                        </div>
                    </div>
                </div>
                {!! Form::close() !!}
            @endif
        </div>
    </div>
@endsection;