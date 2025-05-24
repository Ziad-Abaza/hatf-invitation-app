<?php

namespace App\Services;

use Illuminate\Http\Request;
use Intervention\Image\ImageManagerStatic as Image;
use App\Models\UserInvitation;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use ArPHP\I18N\Arabic;
use Illuminate\Support\Facades\Log;


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
        $newHeight      = $originalHeight + 30;
        $canvas = Image::canvas($originalWidth, $newHeight, '#000000');
        $canvas->insert($img, 'top-left', 0, 30);

        $isArabic = (bool) preg_match('/\p{Arabic}/u', $name);
        if ($isArabic) {
            $fontFile  = public_path('fonts/Amiri.ttf');
            $fontSize  =  22;
            $alignH    = 'right';
            $xPosition = $originalWidth - 10;
        } else {
            $fontFile  = public_path('fonts/Cairo.ttf');
            $fontSize  = 30;
            $alignH    = 'center';
            $xPosition = $originalWidth / 2;
        }

        $canvas->text($name, $xPosition, 10, function ($font) use ($fontFile, $fontSize, $alignH) {
            if (!file_exists($fontFile)) {
                throw new \Exception("Font file not found at: " . $fontFile);
            }

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



    // public static function processOpening($image, $name, $userInvitation, $textSettings)
    // {
    //     if (!$image->isValid()) {
    //         throw new \Exception('Invalid image file.');
    //     }

    //     $imageName = time() . '.' . $image->extension();
    //     $tempPath = public_path('processed_images/' . $imageName);

    //     $img = Image::make($image->path());

    //     $x = $textSettings['x'];
    //     $y = $textSettings['y'];

    //     $color = $textSettings['color'];
    //     $size = $textSettings['size'];
    //     $font = $textSettings['font'];

    //     $fontPath = public_path('fonts/' . $font . '.ttf');
    //     if (!file_exists($fontPath)) {
    //         throw new \Exception('Font file not found: ' . $fontPath);
    //     }

    //     $img->text($userInvitation->invitation_date . ' | ' . $userInvitation->invitation_time, 150, 250, function ($fontObj) use ($fontPath, $size, $color) {
    //         $fontObj->file($fontPath);
    //         $fontObj->size($size);
    //         $fontObj->color($color);
    //     });

    //     $img->text($name, $x, $y, function ($fontObj) use ($fontPath, $size, $color) {
    //         $fontObj->file($fontPath);
    //         $fontObj->size($size);
    //         $fontObj->color($color);
    //         $fontObj->align('center');
    //         $fontObj->valign('top');
    //     });

    //     $img->save($tempPath);

    //     $userInvitation->image = 'processed_images/' . $imageName;
    //     $userInvitation->save();

    //     return $userInvitation->image;
    // }


    public static function processOpening($image, $name, UserInvitation $userInvitation, array $textSettings): string
    {
        // التحقق من صحة الصورة
        if (!$image->isValid()) {
            throw new \Exception('الصورة غير صالحة');
        }

        // مسار القالب الأساسي
        $baseImagePath = $userInvitation->getFirstMediaPath('userInvitation');
        if (!$baseImagePath || !file_exists($baseImagePath)) {
            throw new \Exception('القالب غير موجود');
        }

        // التحقق من توفر الخط
        $fontPath = public_path("fonts/{$textSettings['font']}.ttf");
        if (!file_exists($fontPath)) {
            throw new \Exception("الخط {$textSettings['font']} غير موجود");
        }

        // إنشاء اسم فريد للصورة
        $imageName = md5(uniqid()) . '.jpg';
        $tempPath = public_path("processed_images/{$imageName}");

        // معالجة الصورة
        $img = Image::make($baseImagePath);

        // إضافة النص (الاسم) على الصورة
        $img->text($name, $textSettings['x'], $textSettings['y'], function ($font) use ($fontPath, $textSettings) {
            $font->file($fontPath);
            $font->size($textSettings['size']);
            $font->color($textSettings['color']);
            $font->align('center');
        });

        // حفظ الصورة المعالجة
        $img->save($tempPath);

        // رفع الصورة إلى قاعدة البيانات
        $userInvitation->addMedia($tempPath)->toMediaCollection('userInvitation');

        // حذف الملف المؤقت
        @unlink($tempPath);

        return $imageName;
    }
}

