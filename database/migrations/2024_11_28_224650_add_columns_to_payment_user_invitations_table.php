<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('payment_user_invitations', function (Blueprint $table) {
            $table->foreignId('user_id')
                ->constrained('users') // Links to the `users` table
                ->cascadeOnDelete();   // Ensures records are deleted if the related user is deleted
        
            $table->enum('transfered', [0, 1])
                ->default(0) // Default to '0' (not transferred)
                ->comment('0 is for not transferred, 1 is for transferred');
        });
        
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
