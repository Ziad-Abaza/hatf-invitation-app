<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\InvitedUsers;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Response;

class InvitationWebhookController extends Controller
{

    public function verify(Request $request)
    {

        $mode = $request->get('hub_mode');
        $token = $request->get('hub_verify_token');
        $challenge = $request->get('hub_challenge');

        if ($mode && $token && $mode ) {
            Log::info('Webhook verified successfully');
            return response($challenge, 200);
        } else {
            Log::warning('Webhook verification failed', [
                'mode' => $mode,
                'token' => $token,
            ]);
            return response('Verification token mismatch', 403);
        }
    }

    public function handle(Request $request)
    {
        Log::info("======================\ Start Invitation webhook payload /======================");
        Log::info('Invitation Webhook Payload', $request->all());

        $messages = $request->input('messages');
        if (!is_array($messages) || empty($messages)) {
            Log::warning('No messages found in payload', $request->all());
            return response()->json(['error' => 'No messages in payload'], Response::HTTP_BAD_REQUEST);
        }

        $message = $messages[0];
        $rawPhone = $message['sender']['phone_number'] ?? null;
        $textBody = trim($message['processed_message_content'] ?? $message['content'] ?? '');

        if (! $rawPhone || ! $textBody) {
            Log::warning('Missing phone number or message content', compact('rawPhone', 'textBody'));
            return response()->json(['error' => 'Invalid payload'], Response::HTTP_BAD_REQUEST);
        }

        // Normalize phone number by removing + and leading zeros
        $normalizedPhone = ltrim(preg_replace('/[^0-9]/', '', $rawPhone), '0');

        // convert the phone number to the format used in the database
        $searchPhones = [
            $normalizedPhone,                        // like: 201234573890
            '+' . $normalizedPhone,                  // lie: +201134529890
            preg_replace('/^20|^966/', '0', $normalizedPhone), // مثال: 01234937990
            ltrim(preg_replace('/^20|^966/', '', $normalizedPhone), '0'), // 1234567890
        ];

        // to convert the message to lower case
        // and check if it contains the keywords
        $lower = mb_strtolower($textBody, 'UTF-8');
        if (Str::contains($lower, 'أقبل الدعوة') || Str::contains($lower, 'accept')) {
            $newStatus = 'accepted';
        } elseif (Str::contains($lower, 'أعتذر عن الحضور') || Str::contains($lower, 'decline')) {
            $newStatus = 'rejected';
        } else {
            Log::info("Unknown invitation action: {$textBody}");
            return response()->json(['message' => 'unknown action'], Response::HTTP_OK);
        }

        // search for the invited user
        $invited = InvitedUsers::whereIn('phone', $searchPhones)
            ->where('send_status', 'sent')
            ->latest()
            ->first();

        if (! $invited) {
            Log::error("Invited user not found for phone {$rawPhone}");
            return response()->json(['error' => 'Invited user not found'], Response::HTTP_NOT_FOUND);
        }

        // update the invited user status
        $invited->update([
            'send_status' => $newStatus
        ]);

        if ($newStatus === 'accepted') {
            Log::info("Invited user ===={$invited->phone}==== accepted the invitation");
            // send QR code to the invited user
            $invited = InvitedUsers::whereIn('phone', $searchPhones)
                ->where('send_status', 'sent')
                ->latest()
                ->first();

            Log::info('found invited user', $invited->toArray());

            if ($invited && $invited->qr) {
                $userInvitation = $invited->userInvitation;
                sendWhatsappQR(
                    $invited->phone,
                    $invited->getFirstMediaUrl('qr'),
                    $userInvitation->name,
                    $userInvitation->user->name,
                    $userInvitation->user->phone,
                    $userInvitation->invitation_date,
                    $userInvitation->invitation_time
                );

                Log::info("QR code sent to invited user {$invited->phone}");
                Log::info("============> QR path: {$invited->getFirstMediaUrl('qr')}<=============");
            }
        }

        Log::info("Updated InvitedUsers#{$invited->id} to {$newStatus}");
        Log::info("======================\ End Invitation webhook payload /======================");
        return response()->json(['success' => true], Response::HTTP_OK);
    }
}
