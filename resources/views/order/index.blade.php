@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Orders</h2>
            </div>

        </div>
    </div>


    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif

    <table class="table table-bordered">
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Products</th>
            <th>Date</th>
            <th width="150px">Status</th>
        </tr>
        @foreach ($orders as $order)
            <tr>
                <td>{{ ++$i }}</td>
                <td>{{ $order->name }}</td>
                <td>{{ $order->address }}</td>
                <td>{{ $order->phone }}</td>
                <td>
                @foreach($order->cart->items as $item)
                    {{ $item['item']['name'] }} <div class="badge">{{$item['qty']}}</div>  <br>
                @endforeach
                </td>
                <td>{{ $order->created_at }}</td>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle"
                                type="button" id="dropdownMenu1" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false" style="display: flex; align-items: center">
                            Статус <i class="material-icons" aria-hidden="true" style="font-size: 20px;">expand_more</i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu1" style="width: 200px; padding: 10px">
                            <a class="dropdown-item" href="{{route('order.setStatus',['id' => $order->id, 'status' => 'Готується до відправлення'])}}">Готується до відправлення</a>
                            <a class="dropdown-item" href="{{route('order.setStatus',['id' => $order->id, 'status' => 'Відправлено'])}}">Відправлено</a>
                        </div>
                    </div>
                    <span class="text-primary">{{$order->status}}</span>
                </td>
            </tr>
        @endforeach
    </table>





@endsection