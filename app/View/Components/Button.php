<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Button extends Component
{
    public $bgColor;
    public $textColor;
    public $borderColor;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($bgColor = '#000000', $textColor = '#ffffff', $borderColor = '#000000')
    {
        $this->bgColor = $bgColor;
        $this->textColor = $textColor;
        $this->borderColor = $borderColor;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\View\View|string
     */
    public function render()
    {
        return view('components.button');
    }
}

