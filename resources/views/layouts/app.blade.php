<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Laravel') }}</title>
    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    {{--    Conected my styles--}}
    <link href="{{ asset('css/mystyle.css') }}" rel="stylesheet">
    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script type="text/javascript">
        tinymce.init({
            selector: '.textareas'
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</head>
<body>
<div id="app">
    <nav class="navbar-expand-md navbar-lg-light bg-lg-light navbar-dark bg-dark navbar-laravel">
        <div class="container">
            <div class="row">
                <div class="d-flex justify-content-between col col-md-6">
                    <a class="navbar-brand" href="{{ url('/') }}">
                        {{ config('app.name', 'Store') }}
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>

                <div class="collapse navbar-collapse col col-md-6" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav px-5">
                        {{-- If window less than md, then connected this --}}
                        <div class="d-block d-md-none">
                            @widget('CategoryWidgets')
                            <hr>
                        </div>
                    </ul>


                    <!-- Right Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-right px-5">
                        <!-- Authentication Links -->
                        <li class="px-md-4">
                            <a class="nav-link d-flex align-items-center" href="{{route('cart.shoppingCart')}}">
                                <i class="material-icons" aria-hidden="true" style="font-size: 20px">shopping_cart</i>Кошик
                                <span class="badge badge-info ml-1">{{Session::has('cart') ? Session::get('cart')->totalQty : ''}}</span>
                            </a>
                        </li>
                        @guest
                            <li class="px-md-4"><a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a></li>
                            <li class="px-md-4"><a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a></li>
                        @else
                            @if(Auth::user()->hasAnyRole('admin'))
                                <li class="px-md-4"><a class="nav-link d-flex align-items-center" href="{{route('products.index')}}">
                                    <i class="material-icons" style="font-size: 20px;">settings</i>
                                    Управління
                                </a>
                                </li>

                            @endif

                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre style="display: flex; align-items: center">
                                    <i class="material-icons" aria-hidden="true" style="font-size: 20px">account_box</i>
                                    {{ Auth::user()->name }}
                                </a>

                                <div class="dropdown-menu text-center" aria-labelledby="navbarDropdown">
                                    <a href="{{route('profile')}}" class="dropdown-item p-2">Мій профіль</a><br>
                                    <a href="{{route('orders')}}" class="dropdown-item p-2">Мої замовлення</a><br>
                                    <a class="dropdown-item p-2" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                         document.getElementById('logout-form').submit();">
                                        {{ __('Вийти') }}
                                    </a>
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </div>
    </nav>


    <main class="py-4">
        <div class="container">
            <div class="row">
                <div class="d-none d-md-block col-md-3 col-lg-2">
                    @widget('CategoryWidgets')
                </div>
                <div class="col-md-9 col-lg-10">
                    @yield('content')
                </div>
            </div>
        </div>

    </main>

    <footer style="background: #4D525C; padding: 25px; margin-top: 300px; color: lightgray">
        @widget('FooterWidgets')
    </footer>

</div>

</body>
</html>