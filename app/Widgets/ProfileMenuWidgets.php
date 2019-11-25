<?php


namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;


class ProfileMenuWidgets extends AbstractWidget
{
    public function run()
    {
        return view('widgets.profile_menu_widgets');
    }
}