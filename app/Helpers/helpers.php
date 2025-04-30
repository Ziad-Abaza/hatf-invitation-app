<?php

use Google\Client;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;
use GreenApi\RestApi\GreenApiClient;
use Illuminate\Support\Facades\Http;
use Barryvdh\DomPDF\Facade\Pdf as PDF;
use Mpdf\Mpdf;

if (!function_exists('successResponse')) {
    function successResponse(string $message = 'Success Response', int $status = 200): JsonResponse
    {
        return response()->json([
            'message'    => $message,
        ], $status);
    }
}

if (!function_exists('successResponseKeyWithMessage')) {
    function successResponseDataWithMessage(array|object|string $data = 'Success Response', string $message = 'message', int $status = 200): JsonResponse
    {
        return response()->json([
            'message' => $message,
            'data'    => $data,
        ], $status);
    }
}

if (!function_exists('errorResponse')) {
    function errorResponse(array|object|string $error, int $status = 400): JsonResponse
    {
        return response()->json([
            'message' => $error,
        ], $status);
    }
}

if (!function_exists('getIamgesMediaUrl')) {
    function getIamgesMediaUrl($images, $conversions = ''): array
    {
        $gallery = [];
        foreach ($images as $image) {
            $gallery[] = [
                'id'  => $image->id,
                'url' => $image->getUrl($conversions),
            ];
        }

        return $gallery;
    }
}

if (! function_exists('sendWhatsappQR')) {
    function sendWhatsappQR($phone, $qrImageUrl): bool
    {
        try {
            $token = "EABIy7zT1dfYBOxGm8szUdvkFVeKCXEGx1CblxZBiR6gLgWatJntsBhZA650xXEYqiFDgCeiGsLbKfBfOHzv0zVlESk35WrpySMQZAwZAXlVOAZBSAcw98msi83y0VDpE6w5FiTtncoFG0eRPxHDGeZC4jeNz0MQMGH10nISmjUpqJ6kiCHYOOzXdRSTWestlzXeYgRztaWa2BZB11prnW3JalVt6menqxuHe3ihARj4ZCdA6jhqnMPOpSZB0WMk0G";
            $sender_id = "595577366971724";
            $url = "https://api.karzoun.app/CloudApi.php";

            Log::info('QR Image URL before sending:', ['qrImageUrl' => $qrImageUrl]);

            $response = Http::get($url, [
                'token' => $token,
                'sender_id' => $sender_id,
                'phone' => $phone,
                'template' => 'buy_the_invitation_image',
                'image'   => $qrImageUrl,
                'param_1' => '✨ يرجى الاحتفاظ بهذه الصورة 😊 ونأمل لك وقتًا ممتعًا! 🌟',
            ]);

            Log::info('QR WhatsApp API Response', [
                'status_code' => $response->status(),
                'response_body' => $response->body(),
                'response_json' => $response->json(),
                'template' => 'buy_the_invitation_image',
                'phone' => $phone,
                'qrImageUrl' => $qrImageUrl,
            ]);

            if ($response->successful()) {
                $responseData = $response->json();
                if (
                    isset($responseData['messages'][0]['message_status']) &&
                    $responseData['messages'][0]['message_status'] === 'accepted') {
                    return true;
                } else {
                    Log::error('استجابة API غير متوقعة:', ['response' => $responseData]);
                    return false;
                }
            }

            return false;
        } catch (\Exception $e) {
            Log::error('Exception in sendWhatsappQR', [
                'error' => $e->getMessage(),
            ]);
            return false;
        }
    }
}


if (! function_exists('sendWhatsappImage')) {
    function sendWhatsappImage($phone, $fileUrl, $inviterPhone, $invitationName, $userName, $date, $time, $qr = null): bool
    {
        try {
            $token = "EABIy7zT1dfYBOxGm8szUdvkFVeKCXEGx1CblxZBiR6gLgWatJntsBhZA650xXEYqiFDgCeiGsLbKfBfOHzv0zVlESk35WrpySMQZAwZAXlVOAZBSAcw98msi83y0VDpE6w5FiTtncoFG0eRPxHDGeZC4jeNz0MQMGH10nISmjUpqJ6kiCHYOOzXdRSTWestlzXeYgRztaWa2BZB11prnW3JalVt6menqxuHe3ihARj4ZCdA6jhqnMPOpSZB0WMk0G";
            $sender_id = "595577366971724";
            $url = "https://api.karzoun.app/CloudApi.php";

            // Log the parameters for debugging
            Log::info('sendWhatsappImage called', [
                'phone' => $phone,
                'fileUrl' => $fileUrl,
                'qr' => $qr
            ]);

            // Check if the QR code is provided and send it
            if (!empty($qr)) {
                $qrSent = sendWhatsappQR($phone, $qr);
                Log::info('QR sent result:', ['success' => $qrSent]);
            }

                    // Send the image or PDF
                    $isPdf = strpos($fileUrl, '.pdf') !== false;

                    $response = Http::get($url, [
                        'token' => $token,
                        'sender_id' => $sender_id,
                        'phone' => $phone,
                        'template' => $isPdf ? 'buy_the_invitation_pdf' : 'single_entry_card_new',
                        'param_1' => $invitationName,
                        'param_2' => $userName,
                        'param_3' => $inviterPhone,
                        'param_4' => $date,
                        'param_5' => $time,
                        $isPdf ? 'pdf' : 'image' => $fileUrl,
                    ]);

            // Log the response for debugging
            Log::info('WhatsApp API Response', [
                'status_code' => $response->status(),
                'response_body' => $response->body(),
                'response_json' => $response->json(),
                'template' => $isPdf ? 'buy_the_invitation_pdf' : 'single_entry_card_new',
                'phone' => $phone,
                'fileUrl' => $fileUrl,
                'params' => [
                    $invitationName,
                    $userName,
                    $inviterPhone,
                    $date,
                    $time,
                ],
            ]);

            // Check if the response is JSON
            if ($response->successful()) {
                $responseData = $response->json();
                if (
                    isset($responseData['messages'][0]['message_status']) &&
                    $responseData['messages'][0]['message_status'] === 'accepted') {
                    return true;
                } else {
                    Log::error('استجابة API غير متوقعة:', ['response' => $responseData]);
                    return false;
                }
            }

            // If the response is not successful, log the error
            return false;
        } catch (\Exception $e) {
            Log::error('Exception in sendWhatsappImage', [
                'error' => $e->getMessage(),
            ]);
            return false;
        }
    }
}

if (! function_exists('sendWhatsappOTP')) {
    function sendWhatsappOTP($phone, $code): bool
    {
        try {
            $token = "EABIy7zT1dfYBOxGm8szUdvkFVeKCXEGx1CblxZBiR6gLgWatJntsBhZA650xXEYqiFDgCeiGsLbKfBfOHzv0zVlESk35WrpySMQZAwZAXlVOAZBSAcw98msi83y0VDpE6w5FiTtncoFG0eRPxHDGeZC4jeNz0MQMGH10nISmjUpqJ6kiCHYOOzXdRSTWestlzXeYgRztaWa2BZB11prnW3JalVt6menqxuHe3ihARj4ZCdA6jhqnMPOpSZB0WMk0G";
            $sender_id = "595577366971724";
            $template = "otp";
            $param_1 = $code; // Message as parameter
            $url_button = $code; // Message as button text

            $url = "https://api.karzoun.app/CloudApi.php";

            $response = Http::get($url, [
                'token' => $token,
                'sender_id' => $sender_id,
                'phone' => $phone,
                'template' => $template,
                'param_1' => $param_1,
                'url_button' => $url_button,
            ]);

            // Check if the response is JSON
            if ($response->successful()) {
                return true;
            } else {
                return false;
            }
        } catch (\Exception $e) {
            return false;
        }
    }
}

if (!function_exists('getAccessTokenFireBase')) {
    function getAccessTokenFireBase(): string
    {
        $client = new Client();
        $client->setAuthConfig(public_path('tywdsd-a3c4d2b53c69.json'));
        $client->addScope('https://www.googleapis.com/auth/firebase.messaging');
        $client->refreshTokenWithAssertion();
        $token = $client->getAccessToken();

        return $token['access_token'];
    }
}

if (!function_exists('sendNotificationFireBase')) {
    function sendNotificationFireBase($fcmToken, $title, $body)
    {
        $response = Http::withHeaders([
            'Authorization' => 'Bearer' . ' ' . getAccessTokenFireBase(),
            'Content-Type' => 'application/json'
        ])->post('https://fcm.googleapis.com/v1/projects/daewaqr/messages:send', [
            'message' => [
                'token' => $fcmToken,
                'notification' => [
                    'title' => $title,
                    'body' => $body,
                ],
            ]
        ]);

        if ($response->status() != 200 || $response->status() != 201)
            return errorResponse('Error: ' . $response->json());

        return successResponse('Notification has been sent');
    }
}

if (!function_exists('sendInvoiceViaWhatsapp')) {
    function sendInvoiceViaWhatsapp($phone, $invoiceFilePath)
    {
        try {
            $token = "EABIy7zT1dfYBOxGm8szUdvkFVeKCXEGx1CblxZBiR6gLgWatJntsBhZA650xXEYqiFDgCeiGsLbKfBfOHzv0zVlESk35WrpySMQZAwZAXlVOAZBSAcw98msi83y0VDpE6w5FiTtncoFG0eRPxHDGeZC4jeNz0MQMGH10nISmjUpqJ6kiCHYOOzXdRSTWestlzXeYgRztaWa2BZB11prnW3JalVt6menqxuHe3ihARj4ZCdA6jhqnMPOpSZB0WMk0G";
            $sender_id = "595577366971724";
            $url = "https://api.karzoun.app/CloudApi.php";

            $invoiceUrl = str_replace(
                storage_path('app/public'),
                env('APP_URL') . '/storage',
                $invoiceFilePath
            );
            // Log request details for troubleshooting
            Log::info('Sending PDF via WhatsApp', [
                'phone' => $phone,
                'invoiceFilePath' => $invoiceFilePath,
                'path' => $url,
                'url' => $invoiceUrl,
            ]);

            $response = Http::get($url, [
                'token' => $token,
                'sender_id' => $sender_id,
                'phone' => $phone,
                'template' => 'buy_the_invitation_pdf',
                'pdf' => $invoiceUrl,
                'param_1' => "تأكيد الحجز",
                'param_2' => "تأكيد الحجز",
                'param_3' => "تأكيد الحجز",
                'param_4' => "تأكيد الحجز",
                'param_5' => "تأكيد الحجز",
            ]);

            if ($response->successful()) {
                Log::info('PDF sent successfully via WhatsApp', ['response' => $response->json()]);
                return true;
            }

            Log::error('Error sending PDF via WhatsApp', [
                'response' => $response->json(),
                'phone' => $phone,
                'invoiceFilePath' => $invoiceFilePath
            ]);
            return false;
        } catch (\Exception $e) {
            Log::error('Exception in sendInvoiceViaWhatsapp', [
                'error' => $e->getMessage(),
                'phone' => $phone,
                'invoiceFilePath' => $invoiceFilePath
            ]);
            return false;
        }
    }
}

if (!function_exists('generateInvoicePDF')) {
    function generateInvoicePDF($payment, $user, $userPackage)
    {
        try {
            Log::info('Generating invoice PDF', [
                'payment' => $payment,
                'user' => $user,
                'userPackage' => $userPackage,
            ]);

            // تحميل HTML من الواجهة
            $data = [
                'payment' => $payment,
                'user' => $user,
                'user_package' => $userPackage,
            ];
            $html = view('pdf.invoice', $data)->render();

            // إنشاء كائن MPDF
            $mpdf = new Mpdf([
                'mode' => 'utf-8',
                'format' => 'A4',
                'directionality' => 'rtl',
                'margin_left' => 10,
                'margin_right' => 10,
                'default_font_size' => 14,
                'autoScriptToLang' => true,
                'autoLangToFont' => true,
            ]);

            $mpdf->SetDirectionality('rtl');

            // كتابة المحتوى وحفظ PDF
            $mpdf->WriteHTML($html);
            $filePath = storage_path('app/public/invoices/invoice.pdf');
            $mpdf->Output($filePath, 'F');

            return $filePath;
        } catch (\Exception $e) {
            Log::error('Error generating invoice PDF', ['message' => $e->getMessage()]);
            return null;
        }
    }
}
