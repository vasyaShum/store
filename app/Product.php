<?php


namespace App;


use Illuminate\Database\Eloquent\Model;


class Product extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'detail','price','count','photo','category_id'
    ];

    public function category() {
        return $this->hasOne('App\Category');
    }
}