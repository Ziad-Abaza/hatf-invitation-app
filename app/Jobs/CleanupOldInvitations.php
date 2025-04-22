<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\InvitedUsers;
use Illuminate\Support\Facades\Log;

class CleanupOldInvitations implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    public function handle()
    {
        try {
            $deletedCount = InvitedUsers::where('send_status', '!=', 'sent')
                ->where('created_at', '<=', now()->subWeek())
                ->delete();

            Log::info('تم حذف الدعوات القديمة:', [
                'count' => $deletedCount,
                'older_than' => now()->subWeek()->toDateTimeString()
            ]);
        } catch (\Exception $e) {
            Log::error('خطأ في حذف الدعوات القديمة:', [
                'error' => $e->getMessage()
            ]);
        }
    }
}
