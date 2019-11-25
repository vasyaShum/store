<?php


namespace App\Widgets;


use Arrilot\Widgets\AbstractWidget;

class AdminMenuWidgets extends AbstractWidget
{
    public function run()
    {
        return view('widgets.admin_menu_widgets');
    }
}