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

        // extract the phone number and text body from the request
        $fromPhone = $request->input('messages.0.from');          // sender's phone number
        $textBody  = trim($request->input('messages.0.text.body')); // text message body

        if (! $fromPhone || ! $textBody) {
            Log::warning('Invalid webhook payload', $request->all());
            return response()->json(['error' => 'Invalid payload'], Response::HTTP_BAD_REQUEST);
        }

        // extract the invitation code from the text body
        $lower = mb_strtolower($textBody, 'UTF-8');
        if (Str::contains($lower, 'أقبل الدعوة') || Str::contains($lower, 'accept')) {
            $newStatus = 'accepted';
        } elseif (Str::contains($lower, 'أعتذر عن الحضور') || Str::contains($lower, 'decline')) {
            $newStatus = 'rejected';
        } else {
            // if the text body does not contain the invitation code, return an error
            Log::info("Unknown invitation action: {$textBody}");
            return response()->json(['message' => 'unknown action'], Response::HTTP_OK);
        }

        // find the invitation by the phone number
        $invited = InvitedUsers::where('phone', $fromPhone)
            ->where('send_status', 'sent')
            ->latest()
            ->first();

        if (! $invited) {
            Log::error("Invited user not found for phone {$fromPhone}");
            return response()->json(['error' => 'Invited user not found'], Response::HTTP_NOT_FOUND);
        }

        // update the invitation status
        $invited->update([
            'send_status' => $newStatus
        ]);

        Log::info("Updated InvitedUsers#{$invited->id} to {$newStatus}");

        // return a success response
        Log::info("======================\ End Invitation webhook payload /======================");
        return response()->json(['success' => true], Response::HTTP_OK);
    }
}
