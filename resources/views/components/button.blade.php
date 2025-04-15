<button class="btn d-grid w-100" style="background-color: {{ $bgColor ?? '#000000' }}; color: {{ $textColor ?? '#ffffff' }}; border-color: {{ $borderColor ?? '#000000' }};">
    {{ $slot }}
</button>
