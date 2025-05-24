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

    public static function processOpening(
        UserInvitation $userInvitation,
        string $name,
        array $textSettings
    ): string {
        Log::info("========= بدء معالجة دعوة {$name} =========");

        // upload the base image
        $baseImagePath = $userInvitation->getFirstMediaPath('userInvitation');
        if (!$baseImagePath || !file_exists($baseImagePath)) {
            Log::error("❌ القالب غير موجود: {$baseImagePath}");
            Log::info("the base image path: {$baseImagePath}");
            // Log::info("the data user Invitation : {$userInvitation}");
            throw new \Exception('القالب غير موجود');
        }
        Log::info("✅ تم تحميل القالب من: {$baseImagePath}");

        // font settings
        $fontPath = public_path("fonts/{$textSettings['font']}.ttf");
        if (!file_exists($fontPath)) {
            Log::error("❌ الخط غير موجود: {$textSettings['font']}");
            throw new \Exception("الخط {$textSettings['font']} غير موجود");
        }
        Log::info("✅ تم تحميل الخط من: {$fontPath}");

        // generate a unique name for the processed image
        $imageName = md5(uniqid()) . '.jpg';
        $tempPath  = public_path("processed_images/{$imageName}");
        Log::info("📁 سيتم حفظ الصورة المؤقتة باسم: {$imageName}");

        // upload the base image
        $img = Image::make($baseImagePath);
        Log::info("🖼️ تم تحميل صورة القالب بنجاح");

        // add the date and time text
        $img->text(
            "{$userInvitation->invitation_date} | {$userInvitation->invitation_time}",
            150,
            250,
            function ($font) use ($fontPath, $textSettings) {
                $font->file($fontPath);
                $font->size($textSettings['size']);
                $font->color($textSettings['color']);
            }
        );
        Log::info("🕒 تم إضافة التاريخ والوقت");

        // add the name text
        $img->text(
            $name,
            $textSettings['x'],
            $textSettings['y'],
            function ($font) use ($fontPath, $textSettings) {
                $font->file($fontPath);
                $font->size($textSettings['size']);
                $font->color($textSettings['color']);
                $font->align('center');
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

