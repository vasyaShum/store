@if($data)
    <div class="nav">
        <div class="d-flex flex-column">
            <div class="h3">Категорії</div>
            <div class="p-1">
                <a class="nav-link p-1" href="{{ route('category.index') }}">Усі категорії</a>
            </div>
            @foreach($data as $category)
                <div class="p-1">
                    <a class="nav-link p-1" href="{{ route('category.show',$category->id) }}">{{$category->name}}</a>
                </div>
            @endforeach
        </div>
    </div>
@endif

