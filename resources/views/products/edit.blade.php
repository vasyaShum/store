@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Edit Product</h2>
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


    {{--{!! Form::open(array('route' => 'products.update','method'=>'POST')) !!}--}}
    {!! Form::model($product,['route' => ['products.update',$product->id],'method'=>'PATCH', 'files' =>'true']) !!}

        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Name:</strong>
                    {{--<input type="text" name="name" value="{{ $product->name }}" class="form-control" placeholder="Name">--}}
                    {!! Form::text('name', null, array( 'placeholder' => 'Name','class' => 'form-control')) !!}
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Price:</strong>
                    {!! Form::text('price', null, array( 'placeholder' => 'Price','class' => 'form-control')) !!}
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Count:</strong>
                    {!! Form::text('count', null, array( 'placeholder' => 'Count','class' => 'form-control')) !!}
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Photo:</strong><br>
                    <a href="/img/{{$product->photo}} ">{{ $product->photo }}</a><br><br>
                    Змінити зображення
                    {!! Form::text('photo', null, array('class' => 'hidden')) !!}
                    {!! Form::file('update_photo') !!}
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Category:</strong>
{{--                    {!! Form::text('category_id', null, array( 'placeholder' => 'Category ID','class' => 'form-control')) !!}--}}
{{--                    take from chose selector($product['category_id']) -1--}}
                        {!! Form::select('categories[]', $categories, $product['category_id'] - 1, array('class' => 'form-control','name'=> 'category_id' , 'multiple')) !!}

                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Detail:</strong><br>
                    <div id="add_field_area">
                        {{--<textarea class="form-control" style="height:150px" name="detail" placeholder="Detail"></textarea>--}}
                        {{--                {!! Form::textarea('detail', null, array('placeholder' => 'Detail','class' => 'form-control textareas')) !!}--}}
                            <?php $i = 1?>
                            @foreach($product->detail as $key => $value)
                                <?php ?>
                                <div id="add{{$i}}" class="row add py-2">
                                    <input type="text" width="120" name="key[]" class="col-4 form-control" id="key" value="{{$key}}">
                                    <input type="text" width="120" name="value[]" class="col-6 offset-1 form-control" id="value" value="{{$value}}">
                                    <div onclick="removeField({{$i}})" class="close col-1" style="font-size: 30px" aria-label="Close">
                                        &times;
                                    </div>
                                </div>
                                <?php $i++ ?>
                            @endforeach
                    </div>
                    <div class="add-field"><span onclick="addField();" id="add_field_btn" class="text-info">Додати нове поле</span></div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>


    </form>


@endsection