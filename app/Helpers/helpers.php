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
    function sendWhatsappImage($phone, $fileUrl, $inviterPhone, $invitationName, $userName, $date, $time, $includeData = true): bool
    {
        try {
            $token = "EABIy7zT1dfYBOxGm8szUdvkFVeKCXEGx1CblxZBiR6gLgWatJntsBhZA650xXEYqiFDgCeiGsLbKfBfOHzv0zVlESk35WrpySMQZAwZAXlVOAZBSAcw98msi83y0VDpE6w5FiTtncoFG0eRPxHDGeZC4jeNz0MQMGH10nISmjUpqJ6kiCHYOOzXdRSTWestlzXeYgRztaWa2BZB11prnW3JalVt6menqxuHe3ihARj4ZCdA6jhqnMPOpSZB0WMk0G";
            $sender_id = "595577366971724";
            $url = "https://api.karzoun.app/CloudApi.php";

            // Check if the file is a PDF
            $isPdf = strpos($fileUrl, '.pdf') !== false;

            // Prepare parameters
            $params = [
                'token' => $token,
                'sender_id' => $sender_id,
                'phone' => $phone,
                'template' => $isPdf ? 'buy_the_invitation_pdf' : 'single_entry_card_new',
                $isPdf ? 'pdf' : 'image' => $fileUrl,
            ];

            // Add invitation data only if $includeData is true
            if ($includeData) {
                $params = array_merge($params, [
                    'param_1' => $invitationName,
                    'param_2' => $userName,
                    'param_3' => $inviterPhone,
                    'param_4' => $date,
                    'param_5' => $time,
                ]);
            }

            Log::info('Preparing WhatsApp Message', [
                'template' => $isPdf ? 'buy_the_invitation_pdf' : 'single_entry_card_new',
                'phone' => $phone,
                'fileUrl' => $fileUrl,
                'params' => $params,
            ]);

            // Send the request
            $response = Http::get($url, $params);

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
