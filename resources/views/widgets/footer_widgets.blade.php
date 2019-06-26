<div class="row text-center" style="width: 100%">
    <div class="col-lg-6">
        <div class="row">
            <div class="col-lg-12 d-flex justify-content-center pb-2">
                <h4 class="">Категорії</h4>
            </div>
            <div class="col-lg-12">

                @foreach($category as $categorie)
                    <div class="col-lg-6">
                        <a href="{{ route('category.show',$categorie->id) }}">{{$categorie->name}}</a>
                    </div>
                @endforeach

            </div>
        </div>
    </div>
    <div class="col-lg-4 col-lg-offset-2">
        <div class="row" style="width: 100%">
            <div class="col-8">
                <div class="row" style="color: #D8D8D8">
                    <div class="col-lg-12">
                        <h4>ЗВОРОТНІЙ ЗВ'ЯЗОК</h4>
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-12">
                                <h5>СЛУЖБА ПІДТРИМКИ</h5>
                            </div>
                            <div class="col-lg-12">

                                <h3 style="display: flex; align-items: center; justify-content: center"><i class="material-icons" aria-hidden="true" style="font-size: 25px">phone_in_talk</i>098 075 7076</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-12">
                                <h6>ГРАФІК РОБОТИ</h6>
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-12">ПН-ПТ з 9:00 до
                                        20:00
                                    </div>
                                    <div class="col-12">СБ з 9:00 до 19:00
                                    </div>
                                    <div class="col-12">НД з 10:00 до 19:00
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row" style="padding-top: 20px">
    <div class="col-lg-2 col-lg-offset-10">&#169 Vasya Shumskyi 2019</div>
</div>