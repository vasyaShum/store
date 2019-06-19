<?php

namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use App\Category;

class CategoryWidgets extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        //
        $data = Category::get();
        return view('widgets.category_widgets', compact('data'));
    }
}
