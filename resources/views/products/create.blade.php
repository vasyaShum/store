@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Add New Product</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{ route('products.index') }}"> Back</a>
            </div>
        </div>
    </div>


    @if ($errors->any())
        <div class="alert alert-danger">
            <strong>Whoops!</strong> There were some problems with your input.<br><br>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    {!! Form::open(array('route' => 'products.store','method'=>'POST','files' =>'true')) !!}

        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Name:</strong>
                    {{--<input type="text" name="name" class="form-control" placeholder="Name">--}}
                    {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control', 'autocomplete' => 'off')) !!}
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Price:</strong>
                    {{--<input type="text" class="form-control" name="price" placeholder="Price">--}}
                    {!! Form::text('price', null, array('placeholder' => 'Price','class' => 'form-control', 'autocomplete' => 'off')) !!}
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Count:</strong>
                    {{--<input type="text" class="form-control"  name="count" placeholder="Count">--}}
                    {!! Form::text('count', null, array('placeholder' => 'Count','class' => 'form-control', 'autocomplete' => 'off')) !!}
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Photo:</strong>
                    {{--<input type="text" class="form-control" name="photo" placeholder="Photo">--}}
                    {!! Form::file('photo')!!}
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Category ID:</strong>
                    {{--<input type="text" class="form-control" name="category_id" placeholder="Category ID">--}}
                    {!! Form::select('categories[]', $categories,[], array('class' => 'form-control','name'=> 'category_id' , 'multiple')) !!}
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Detail:</strong><br>
                    <div id="add_field_area">
{{--                        <textarea class="form-control" style="height:150px" name="detail" placeholder="Detail"></textarea>--}}
{{--                    {!! Form::textarea('detail', null, array('placeholder' => 'Detail','class' => 'form-control textareas')) !!}--}}
                        <div id="add1" class="row justify-content-between add py-2">
                            <input type="text" width="120" name="key[]" class="col-4 form-control" id="key" value="" autocomplete="off" required>
                            <input type="text" width="120" name="value[]" class="col-7 offset-1 form-control" id="value" value="" autocomplete="off" required>
                        </div>
                    </div>
                    <div class="add-field"><span onclick="addField();" id="add_field_btn" class="text-info">Додати нове поле</span></div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>

    {!! Form::close() !!}
    {{--</form>--}}


@endsection