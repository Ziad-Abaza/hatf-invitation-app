<?php

namespace App\Services;

use Illuminate\Http\Request;
use Intervention\Image\ImageManagerStatic as Image;


class ImageTemplate
{

    public static function process($image, $name, $userInvitation)
    {
        if (!$image->isValid()) {
            throw new \Exception('Invalid image file.');
        }

        $imageName = time() . '.' . $image->extension();
        $tempPath  = public_path('processed_images/' . $imageName);

        $img = Image::make($image->path());
        $originalWidth  = $img->width();
        $originalHeight = $img->height();
        $newHeight      = $originalHeight + 20;
        $canvas = Image::canvas($originalWidth, $newHeight, '#000000');
        $canvas->insert($img, 'top-left', 0, 20);

        $isArabic = (bool) preg_match('/\p{Arabic}/u', $name);
        if ($isArabic) {
            $fontFile  = public_path('fonts/Lateef.ttf');
            $fontSize  =  22;
            $alignH    = 'right';
            $xPosition = $originalWidth - 10;
        } else {
            $fontFile  = public_path('front/Arial_Bold.ttf');
            $fontSize  = 30;
            $alignH    = 'center';
            $xPosition = $originalWidth / 2;
        }

        $canvas->text($name, $xPosition, 10, function ($font) use ($fontFile, $fontSize, $alignH) {
            $font->file($fontFile);
            $font->size($fontSize);
            $font->color('#ffffff');
            $font->align($alignH);
            $font->valign('middle');
        });

        $canvas->save($tempPath);
        $userInvitation->addMedia($tempPath)
            ->toMediaCollection('qr');
        @unlink($tempPath);

        return $imageName;
    }
}

