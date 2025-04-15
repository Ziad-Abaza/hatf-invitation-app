<?php

namespace App\Services;

use Illuminate\Http\Request;
use Intervention\Image\ImageManagerStatic as Image;


class ImageTemplate
{




    public static function process($image, $name,$userInvitation)
    {
        // Validate the file (if needed)
        if (!$image->isValid()) {
            throw new \Exception('Invalid image file.');
        }

        $imageName = time() . '.' . $image->extension();

        // Load original image
        $img = Image::make($image->path());

        // Get original dimensions
        $originalWidth = $img->width();
        $originalHeight = $img->height();

        // Create a new canvas with extra 20px height for the black bar at the top
        $newHeight = $originalHeight + 20;
        $background = Image::canvas($originalWidth, $newHeight, '#000000');

        // Insert the original image shifted **down** by 20px to make space for the black bar
        $background->insert($img, 'top-left', 0, 20);

        // Add text centered in the black bar with **extra padding from the top**
        $background->text($name, $originalWidth / 2, 20, function ($font) {
            $font->file(public_path('front/Arial_Bold.ttf')); // Path to your font file
            $font->size(30); // Adjust size if needed
            $font->color('#ffffff');
            $font->align('center');
            $font->valign('middle');
        });

        // Save processed image
        // $background->save(public_path('processed_images/' . $imageName));

        // Save to temporary path
        $tempPath = public_path('processed_images/' . $imageName);
        $background->save($tempPath);

        // Attach to media library
        $userInvitation->addMedia($tempPath)->toMediaCollection('qr');

        // Remove temp file
        @unlink($tempPath);


        return $imageName;
    }
}
