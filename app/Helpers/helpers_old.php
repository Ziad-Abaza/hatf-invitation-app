<?php

use Google\Client;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;
use GreenApi\RestApi\GreenApiClient;
use Illuminate\Support\Facades\Http;

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

if (! function_exists('sendWhatsappImage')) {
    function sendWhatsappImage($phone, $filePath, $mobile, $occasion, $inviter, $date, $Time): bool
    {
        try {
            $token = "EABIy7zT1dfYBOxGm8szUdvkFVeKCXEGx1CblxZBiR6gLgWatJntsBhZA650xXEYqiFDgCeiGsLbKfBfOHzv0zVlESk35WrpySMQZAwZAXlVOAZBSAcw98msi83y0VDpE6w5FiTtncoFG0eRPxHDGeZC4jeNz0MQMGH10nISmjUpqJ6kiCHYOOzXdRSTWestlzXeYgRztaWa2BZB11prnW3JalVt6menqxuHe3ihARj4ZCdA6jhqnMPOpSZB0WMk0G";
            $sender_id = "595577366971724";
            $url = "https://api.karzoun.app/CloudApi.php";

           $extension = pathinfo($filePath, PATHINFO_EXTENSION);

            if (strtolower($extension) === 'pdf') {
                // قالب PDF
                $template = "buy_the_invitation_pdf";
                $response = Http::get($url, [
                    'token'     => $token,
                    'sender_id' => $sender_id,
                    'phone'     => $phone,
                    'template'  => $template,
                    'pdf'       => $filePath,
                ]);
            } else {
                // قالب صورة
                $template = "single_entry_card_new";
                $response = Http::get($url, [
                    'token'     => $token,
                    'sender_id' => $sender_id,
                    'phone'     => $phone,
                    'template'  => $template,
                    'param_1'   => $occasion,
                    'param_2'   => $inviter,
                    'param_3'   => $mobile,
                    'param_4'   => $date,
                    'param_5'   => $Time,
                    'image'     => $filePath,
                ]);
            }

            Log::info('WhatsApp Response', [
                'status' => $response->status(),
                'body'   => $response->body(),
            ]);

            if ($response->successful()) {
                $responseData = $response->json();
                return isset($responseData['status']) && $responseData['status'] === 'success';
            }

            return false;
        } catch (\Exception $e) {
            Log::error('Exception in sendWhatsappImage', [
                'error' => $e->getMessage(),
            ]);
            return false;
        }
    }
}

// if (! function_exists('sendWhatsappImage')) {
//     function sendWhatsappImage($phone, $imagePath, $mobile, $occasion, $inviter, $date, $Time): bool
//     {
//         try {
//             $token = "EABIy7zT1dfYBOxGm8szUdvkFVeKCXEGx1CblxZBiR6gLgWatJntsBhZA650xXEYqiFDgCeiGsLbKfBfOHzv0zVlESk35WrpySMQZAwZAXlVOAZBSAcw98msi83y0VDpE6w5FiTtncoFG0eRPxHDGeZC4jeNz0MQMGH10nISmjUpqJ6kiCHYOOzXdRSTWestlzXeYgRztaWa2BZB11prnW3JalVt6menqxuHe3ihARj4ZCdA6jhqnMPOpSZB0WMk0G";
//             $sender_id = "595577366971724";
//             $template = "single_entry_card_new";
//             $url = "https://api.karzoun.app/CloudApi.php";

//             $response = Http::get($url, [
//                 'token'     => $token,
//                 'sender_id' => $sender_id,
//                 'phone'     => $phone,
//                 'template'  => $template,
//                 'param_1'   => $occasion,
//                 'param_2'   => $inviter,
//                 'param_3'   =>  $mobile,
//                 'param_4'   => $date,
//                 'param_5'   => $Time,
//                 'image'     => $imagePath,
//             ]);

//             Log::info('Sending WhatsApp Request', [
//                 'url' => $url,
//                 'params' => [
//                     'token'     => $token,
//                     'sender_id' => $sender_id,
//                     'phone'     => $phone,
//                     'template'  => $template,
//                     'param_1'   => $occasion,
//                     'param_2'   => $inviter,
//                     'param_3'   => $mobile,
//                     'param_4'   => $date,
//                     'param_5'   => $Time,
//                     'image'     => $imagePath,
//                 ]
//             ]);
            
//             Log::info('WhatsApp Response', [
//                 'status' => $response->status(),
//                 'body'   => $response->body()
//             ]);

//             if ($response->successful()) {
//                 $responseData = $response->json();

//                 if (isset($responseData['status']) && $responseData['status'] === 'success') {
//                     return true;
//                 }

//                 Log::error('WhatsApp API Response Error', [
//                     'response' => $responseData
//                 ]);
//                 return false;
//             }

//             Log::error('WhatsApp API Request Failed', [
//                 'status' => $response->status(),
//                 'body'   => $response->body()
//             ]);
//             return false;
//         } catch (\Exception $e) {
//             Log::error('Exception in sendWhatsappImage', [
//                 'error' => $e->getMessage(),
//             ]);
//             return false;
//         }
//     }
// }

// if (! function_exists('sendWhatsappImage')) {
//     function sendWhatsappImage($phone, $imagePath,$mobile,$occasion, $inviter, $date, $Time): bool
//     {
//         try {
//             $token = "EABIy7zT1dfYBOxGm8szUdvkFVeKCXEGx1CblxZBiR6gLgWatJntsBhZA650xXEYqiFDgCeiGsLbKfBfOHzv0zVlESk35WrpySMQZAwZAXlVOAZBSAcw98msi83y0VDpE6w5FiTtncoFG0eRPxHDGeZC4jeNz0MQMGH10nISmjUpqJ6kiCHYOOzXdRSTWestlzXeYgRztaWa2BZB11prnW3JalVt6menqxuHe3ihARj4ZCdA6jhqnMPOpSZB0WMk0G";
//             $sender_id = "595577366971724";
//             $template = "single_entry_card_image";
//             $url = "https://api.karzoun.app/CloudApi.php";

//             $response = Http::get($url, [
//                 'token' => $token,
//                 'sender_id' => $sender_id,
//                 'phone' => $mobile,
//                 'template' => $template,
//                 'param_1' => $occasion, // occasion
//                 'param_2' => $inviter, // inviter
//                 'param_3' => $phone, // phone
//                 'param_4' => $date, // date
//                 'param_5' => $Time, // Time
//                 'image' => $imagePath,
//             ]);

//             // Check if the response is JSON
//             if ($response->successful()) {
//                 return true;
//             } else {
//                 return false;
//             }
//         } catch (\Exception $e) {
//             return false;
//         }
//         // try {
//         //     $greenApi = new GreenApiClient(env('ID_INSTANCE'), env('API_TOKEN_INSTANCE'));
//         //     $result = $greenApi->sending->sendFileByUpload($phone . '@c.us', $imagePath, null, $message);
//         //     if (!isset($result->code) || $result->code !== 200) {
//         //         Log::channel('custom_errors')->error('Whatsapp Image Error', [
//         //             'code'  => $result->code ?? 'N/A',
//         //             'error' => $result->error ?? 'Unknown error',
//         //         ]);
//         //         return false;
//         //     }

//         //     return true;
//         // } catch (\Exception $e) {
//         //     Log::channel('custom_errors')->error('Exception in sendWhatsappImage', [
//         //         'error' => $e->getMessage(),
//         //     ]);
//         //     return false;
//         // }
//     }
// }

// if (! function_exists('sendWhatsappInvoice')) {
//     function sendWhatsappInvoice($phone, $pathPdf): bool
//     {
//         try {
//             $token = "EABIy7zT1dfYBOxGm8szUdvkFVeKCXEGx1CblxZBiR6gLgWatJntsBhZA650xXEYqiFDgCeiGsLbKfBfOHzv0zVlESk35WrpySMQZAwZAXlVOAZBSAcw98msi83y0VDpE6w5FiTtncoFG0eRPxHDGeZC4jeNz0MQMGH10nISmjUpqJ6kiCHYOOzXdRSTWestlzXeYgRztaWa2BZB11prnW3JalVt6menqxuHe3ihARj4ZCdA6jhqnMPOpSZB0WMk0G";
//             $sender_id = "595577366971724";
//             $template = "buy_the_invitation_pdf";
//             $url = "https://api.karzoun.app/CloudApi.php";
//             $response = Http::get($url, [
//                 'token' => $token,
//                 'sender_id' => $sender_id,
//                 'phone' => $phone,
//                 'template' => $template,
//                 'pdf' => $pathPdf, // pdf path
//             ]);
//             // Check if the response is JSON
//             if ($response->successful()) {
//                 return true;
//             } else {
//                 return false;
//             }
//         } catch (\Exception $e) {
//             return false;
//         }
//     }
// }

if (! function_exists('sendWhatsappOTP')) {
    function sendWhatsappOTP($phone, $code): bool
    {
        //     $http = Http::post('https://7103.api.greenapi.com/waInstance7103103035/sendMessage/98b404461ea0409cb3692d1114c7269c50befd413c2c4f4898', [
        //         'chatId' => $phone . '@c.us',
        //         'message' => ' رمز التحقق الخاص بك هو ' . $code . '

        // لتطبيق دعوة QR من هتف'
        //     ]);

        //     if ($http->status() != 200 || $http->status() != 201) {
        //         return false;
        //     }

        //     return true;
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
