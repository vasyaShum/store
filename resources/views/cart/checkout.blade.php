@extends('layouts.app')

@section('title')
    Shoping Cart
@endsection

@section('content')
    <div class="row">
        <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
            <h1>Перевірка</h1>
            <h4>Вся сумма: {{ $total }} грн.</h4>
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
                        <label for="name">Адреса</label>
                        {!! Form::text('address', null, array('class' => 'form-control', 'id' => 'address','required')) !!}
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
                        <button type="submit" class="btn btn-success">Купити</button>
                    </div>
                </div>
            </div>
            {!! Form::close() !!}
        </div>
    </div>
@endsection;