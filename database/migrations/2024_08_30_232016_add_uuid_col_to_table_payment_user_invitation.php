<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (!Schema::hasColumn('payment_user_invitations', 'payment_uuid')) {
            Schema::table('payment_user_invitations', function (Blueprint $table) {
                $table->uuid('payment_uuid')->nullable()->default(null);
            }); 
        }
        
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('payment_user_invitations', function (Blueprint $table) {
            //
        });
    }
};
