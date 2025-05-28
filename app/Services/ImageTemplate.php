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

        // تحميل صورة القاعدة
        $baseImagePath = $userInvitation->getFirstMediaPath('userInvitation');
        if (!$baseImagePath || !file_exists($baseImagePath)) {
            Log::error("❌ القالب غير موجود: {$baseImagePath}");
            throw new \Exception('القالب غير موجود');
        }
        Log::info("✅ تم تحميل القالب من: {$baseImagePath}");

        // إعدادات النص مع قيم افتراضية
        $textSettings = array_merge([
            'font'  => 'Cairo',
            'size'  => 30,
            'color' => '#ffffff',
            'x'     => 0.5, // المركز الافتراضي
            'y'     => 0.5, // المركز الافتراضي
            'anchor' => 'center' // نقطة الارتكاز الافتراضية
        ], $userInvitation->text_settings ?? []);

        Log::info("📄 إعدادات النص: " . json_encode($textSettings));

        $fontPath = public_path("fonts/{$textSettings['font']}.ttf");
        if (!file_exists($fontPath)) {
            Log::error("❌ الخط غير موجود: {$textSettings['font']}");
            throw new \Exception("الخط {$textSettings['font']} غير موجود");
        }
        Log::info("✅ تم تحميل الخط من: {$fontPath}");

        // معالجة النص العربي
        if (preg_match('/\p{Arabic}/u', $name)) {
            $name = $arabic->utf8Glyphs($name);
            $alignText = 'right';
        } else {
            $alignText = 'left';
        }

        // إنشاء اسم فريد للصورة
        $imageName = md5(uniqid()) . '.jpg';
        $tempPath  = public_path("processed_images/{$imageName}");
        Log::info("📁 سيتم حفظ الصورة المؤقتة باسم: {$imageName}");

        // تحميل صورة القاعدة
        $img = Image::make($baseImagePath);
        Log::info("🖼️ تم تحميل صورة القالب بنجاح");

        // حساب الإحداثيات المطلقة
        $x = $textSettings['x'] * $img->width();
        $y = $textSettings['y'] * $img->height();

        // حساب صندوق النص لتحديد الأبعاد الدقيقة
        $textBox = self::calculateTextBox(
            $textSettings['size'],
            $fontPath,
            $name
        );

        if ($textBox) {
            // ضبط نقطة الارتكاز (Anchor Point)
            switch ($textSettings['anchor'] ?? 'center') {
                case 'top':
                    $y += $textBox['ascent'];
                    break;
                case 'bottom':
                    $y -= $textBox['descent'];
                    break;
                case 'center':
                default:
                    // لا حاجة لتعديل المركز (الإعداد الافتراضي)
                    break;
            }
        }

        // إضافة النص مع ضبط المحاذاة
        $img->text($name, $x, $y, function ($font) use ($fontPath, $textSettings, $alignText) {
            $font->file($fontPath);
            $font->size($textSettings['size']);
            $font->color($textSettings['color']);
            $font->align($alignText);
            $font->valign('top'); // ثابت للتحكم الدقيق
        });

        Log::info("👤 تم إضافة اسم المدعو: {$name}");

        // حفظ الصورة المؤقتة
        $img->save($tempPath);
        Log::info("💾 تم حفظ الصورة المؤقتة في: {$tempPath}");

        // رفع الصورة إلى Media
        $media = $userInvitation->addMedia($tempPath)
            ->toMediaCollection('userInvitation');
        Log::info("☁️ تم رفع الصورة إلى ميديا: {$media->getUrl()}");

        // حذف الملف المؤقت
        @unlink($tempPath);
        Log::info("🗑️ تم حذف الصورة المؤقتة من المسار: {$tempPath}");

        Log::info("========= انتهاء معالجة دعوة {$name} =========");
        return $media->getUrl();
    }

    // دالة مساعدة لحساب أبعاد النص بدقة
    private static function calculateTextBox($fontSize, $fontPath, $text): ?array
    {
        $box = imagettfbbox($fontSize, 0, $fontPath, $text);

        if (!$box) return null;

        return [
            'width'   => abs($box[2] - $box[0]),
            'height'  => abs($box[7] - $box[1]),
            'ascent'  => abs($box[7]), // المسافة من القاعدة إلى أعلى الحرف
            'descent' => abs($box[1]), // المسافة من القاعدة إلى أسفل الحرف
        ];
    }
}
