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

        $arabic = new Arabic();

        $isArabic = (bool) preg_match('/\p{Arabic}/u', $name);
        if ($isArabic) {
            $fontFile  = public_path('fonts/Cairo.ttf');
            $fontSize  =  22;
            $alignH    = 'right';
            $xPosition = $originalWidth - 10;

            $name = $arabic->utf8Glyphs($name);
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

    public static function processOpening(
        UserInvitation $userInvitation,
        string $name
    ): string {
        Log::info("========= بدء معالجة دعوة {$name} =========");

        $arabic = new Arabic();

        // upload the base image
        $baseImagePath = $userInvitation->getFirstMediaPath('userInvitation');
        if (!$baseImagePath || !file_exists($baseImagePath)) {
            Log::error("❌ القالب غير موجود: {$baseImagePath}");
            Log::info("the base image path: {$baseImagePath}");
            throw new \Exception('القالب غير موجود');
        }
        Log::info("✅ تم تحميل القالب من: {$baseImagePath}");

        // font settings
        $textSettings = $userInvitation->text_settings ?? [
            'font'  => 'Cairo',
            'size'  => 30,
            'color' => '#ffffff',
            'x'     => 0,
            'y'     => 0,
        ];

        Log::info("📄 إعدادات النص: " . json_encode($textSettings));

        $fontPath = public_path("fonts/{$textSettings['font']}.ttf");
        if (!file_exists($fontPath)) {
            Log::error("❌ الخط غير موجود: {$textSettings['font']}");
            throw new \Exception("الخط {$textSettings['font']} غير موجود");
        }
        Log::info("✅ تم تحميل الخط من: {$fontPath}");

        if (preg_match('/\p{Arabic}/u', $name)) {
            $name = $arabic->utf8Glyphs($name);
            $alignText = 'right';
        }else{
            $alignText = 'left';
        }

        // generate a unique name for the processed image
        $imageName = md5(uniqid()) . '.jpg';
        $tempPath  = public_path("processed_images/{$imageName}");
        Log::info("📁 سيتم حفظ الصورة المؤقتة باسم: {$imageName}");


        // upload the base image
        $img = Image::make($baseImagePath);
        Log::info("🖼️ تم تحميل صورة القالب بنجاح");

        // حساب الإحداثيات بناءً على النسبة
        $x = $textSettings['x'] * $img->width();
        $y = $textSettings['y'] * $img->height();

        // إضافة النص
        $img->text(
            $name,
            $x,
            $y,
            function ($font) use ($fontPath, $textSettings, $alignText) {
                $font->file($fontPath);
                $font->size($textSettings['size']);
                $font->color($textSettings['color']);
                $font->align($alignText);
                $font->valign('top');
            }
        );

        Log::info("👤 تم إضافة اسم المدعو: {$name}");

        // save the processed image to a temporary path
        $img->save($tempPath);
        Log::info("💾 تم حفظ الصورة المؤقتة في: {$tempPath}");

        // add the processed image to the media collection
        $media = $userInvitation->addMedia($tempPath)
            ->toMediaCollection('userInvitation');
        Log::info("☁️ تم رفع الصورة إلى ميديا: {$media->getUrl()}");

        @unlink($tempPath); // delete the temporary file
        Log::info("🗑️ تم حذف الصورة المؤقتة من المسار: {$tempPath}");

        Log::info("========= انتهاء معالجة دعوة {$name} =========");
        return $media->getUrl();
    }
}
