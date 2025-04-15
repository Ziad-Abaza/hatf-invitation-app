<?php

namespace App\View\Components;

use Illuminate\View\Component;

class LinkButton extends Component
{
    public $url;
    public $class;
    public $textColor;
    public $style;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($url, $class = 'btn-primary', $textColor = '#fff', $style = '')
    {
        $this->url = $url;
        $this->class = $class;
        $this->textColor = $textColor;
        $this->style = $style;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\View\View|string
     */
    public function render()
    {
        return view('components.link-button');
    }
}

