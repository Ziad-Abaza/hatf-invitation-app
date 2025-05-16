<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\InvitedUsers;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpFoundation\Response;

class InvitationWebhookController extends Controller
{
    public function handle(Request $request)
    {
        Log::info("======================\ Start Invitation webhook payload /======================");
        Log::info('Invitation Webhook Payload', $request->all());

        // تأكد من وجود الرسائل
        $messages = $request->input('messages');
        if (!is_array($messages) || empty($messages)) {
            Log::warning('No messages found in payload', $request->all());
            return response()->json(['error' => 'No messages in payload'], Response::HTTP_BAD_REQUEST);
        }

        // استخرج الرسالة الأولى
        $message = $messages[0];
        $fromPhone = $message['sender']['phone_number'] ?? null;
        $textBody = trim($message['processed_message_content'] ?? $message['content'] ?? '');

        if (! $fromPhone || ! $textBody) {
            Log::warning('Missing phone number or message content', compact('fromPhone', 'textBody'));
            return response()->json(['error' => 'Invalid payload'], Response::HTTP_BAD_REQUEST);
        }

        // تحويل النص إلى حروف صغيرة ومعالجة القرار
        $lower = mb_strtolower($textBody, 'UTF-8');
        if (Str::contains($lower, 'أقبل الدعوة') || Str::contains($lower, 'accept')) {
            $newStatus = 'accepted';
        } elseif (Str::contains($lower, 'أعتذر عن الحضور') || Str::contains($lower, 'decline')) {
            $newStatus = 'rejected';
        } else {
            Log::info("Unknown invitation action: {$textBody}");
            return response()->json(['message' => 'unknown action'], Response::HTTP_OK);
        }

        // البحث عن المستخدم المدعو باستخدام رقم الهاتف
        $invited = InvitedUsers::where('phone', $fromPhone)
            ->where('send_status', 'sent')
            ->latest()
            ->first();

        if (! $invited) {
            Log::error("Invited user not found for phone {$fromPhone}");
            return response()->json(['error' => 'Invited user not found'], Response::HTTP_NOT_FOUND);
        }

        // تحديث حالة الدعوة
        $invited->update([
            'send_status' => $newStatus
        ]);

        Log::info("Updated InvitedUsers#{$invited->id} to {$newStatus}");
        Log::info("======================\ End Invitation webhook payload /======================");
        return response()->json(['success' => true], Response::HTTP_OK);
    }
}
