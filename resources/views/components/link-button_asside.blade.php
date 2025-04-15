<li class="{{ $isActive ? 'active' : '' }}" style="background-color: {{ $isActive ? 'black' : 'transparent' }}; 
    width: 100%; 
    height: 50px; 
    display: flex; 
    align-items: center; 
    padding: 0 15px; 
    border-radius: 5px; 
    margin-bottom: 10px;
    transition: background-color 0.3s ease;">

    <a href="{{ $url }}" class="{{ $class ?? '' }}" style="width: 100%; text-decoration: none; display: flex; align-items: center;">
        @isset($icon)
            <i class="menu-icon {{ $icon }}" style="font-size: 20px; color: {{ $isActive ? 'white' : '#888' }}; margin-right: 10px;"></i>
        @endisset
        <div style="flex-grow: 1; color: {{ $isActive ? 'white' : '#333' }}; font-size: 16px;">
            {{ $slot }}
        </div>
    </a>
</li>
