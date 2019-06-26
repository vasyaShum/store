    @extends('layouts.app')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Привіт, {{ Auth::user()->name }}</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif

                    Ви увійшли в <a href="{{route('profile')}}">особистий кабінет</a>!
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
