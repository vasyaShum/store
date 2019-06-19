@if($data)
    <div class="nav flex-column">
        <div class="h3">Категорії</div>
        <a class="nav-link" href="{{ route('category.index') }}">Усі категорії</a><br>
        @foreach($data as $category)
            <a class="nav-link" href="{{ route('category.show',$category->id) }}">{{$category->name}}</a><br>
        @endforeach
    </div>
@endif

