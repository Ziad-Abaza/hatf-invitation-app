<?php

namespace App\View\Components;

use Illuminate\View\Component;

class LinkButtonAsside extends Component
{
    public $url;
    public $class;
    public $style;
    public $icon;
    public $isActive;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($url, $class = '', $style = '', $icon = '', $isActive = false)
    {
        $this->url = $url;
        $this->class = $class;
        $this->style = $style;
        $this->icon = $icon;
        $this->isActive = $isActive;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\View\View|string
     */
    public function render()
    {
        return view('components.link-button_asside');
    }
}

