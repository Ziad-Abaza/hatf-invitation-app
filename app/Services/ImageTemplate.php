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

        // تحميل الصورة الأصلية
        $img = Image::make($image->path());
        $originalWidth  = $img->width();
        $originalHeight = $img->height();

        // كائن لإعادة تشكيل النص العربي
        $arabic = new Arabic();

        // فحص وجود نص عربي وإعادة تشكيله إذا وجد
        $isArabic = (bool) preg_match('/\p{Arabic}/u', $name);
        if ($isArabic) {
            $name = $arabic->utf8Glyphs($name);
            $fontFile  = public_path('fonts/Cairo.ttf'); // أو الخط المناسب للعربي
            $fontSize  = 22;
            $alignH    = 'right';
            $xPosition = $originalWidth - 10;
            $yPosition = 20; // يمكن تعديل حسب الحاجة
        } else {
            $fontFile  = public_path('fonts/Cairo.ttf'); // أو أي خط لاتيني
            $fontSize  = 30;
            $alignH    = 'center';
            $xPosition = $originalWidth / 2;
            $yPosition = 20;
        }

        // كتابة النص مباشرة على الصورة الأصلية
        $img->text($name, $xPosition, $yPosition, function ($font) use ($fontFile, $fontSize, $alignH) {
            if (!file_exists($fontFile)) {
                throw new \Exception("Font file not found at: " . $fontFile);
            }
            $font->file($fontFile);
            $font->size($fontSize);
            $font->color('#ffffff');
            $font->align($alignH);
            $font->valign('top');
        });

        // حفظ الصورة بعد التعديل
        $img->save($tempPath);

        // رفع الصورة إلى الميديا
        $userInvitation->addMedia($tempPath)
            ->toMediaCollection('qr');

        @unlink($tempPath);

        return $imageName;
    }

    // دالة processOpening كما هي، تعمل بشكل جيد
    public static function processOpening(
        UserInvitation $userInvitation,
        string $name,
        array $textSettings
    ): string {
        Log::info("========= بدء معالجة دعوة {$name} =========");

        $arabic = new Arabic();  // كائن لإعادة تشكيل النص العربي

        $baseImagePath = $userInvitation->getFirstMediaPath('userInvitation');
        if (!$baseImagePath || !file_exists($baseImagePath)) {
            Log::error("❌ القالب غير موجود: {$baseImagePath}");
            throw new \Exception('القالب غير موجود');
        }
        Log::info("✅ تم تحميل القالب من: {$baseImagePath}");

        $fontPath = public_path("fonts/{$textSettings['font']}.ttf");
        if (!file_exists($fontPath)) {
            Log::error("❌ الخط غير موجود: {$textSettings['font']}");
            throw new \Exception("الخط {$textSettings['font']} غير موجود");
        }
        Log::info("✅ تم تحميل الخط من: {$fontPath}");

        if (preg_match('/\p{Arabic}/u', $name)) {
            $name = $arabic->utf8Glyphs($name);
        }

        $imageName = md5(uniqid()) . '.jpg';
        $tempPath  = public_path("processed_images/{$imageName}");
        Log::info("📁 سيتم حفظ الصورة المؤقتة باسم: {$imageName}");

        $img = Image::make($baseImagePath);
        Log::info("🖼️ تم تحميل صورة القالب بنجاح");

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

        $img->save($tempPath);
        Log::info("💾 تم حفظ الصورة المؤقتة في: {$tempPath}");

        $media = $userInvitation->addMedia($tempPath)
            ->toMediaCollection('userInvitation');
        Log::info("☁️ تم رفع الصورة إلى ميديا: {$media->getUrl()}");

        @unlink($tempPath);
        Log::info("🗑️ تم حذف الصورة المؤقتة من المسار: {$tempPath}");

        Log::info("========= انتهاء معالجة دعوة {$name} =========");
        return $media->getUrl();
    }
}
