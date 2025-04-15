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
        Schema::create('user_invitations', function (Blueprint $table) {
            $table->id();
            $table->integer('number_invitees')->default(0);
            $table->boolean('is_active')->default(0);
            $table->boolean('state')->default(1);
            $table->unsignedBigInteger('user_id')->nullable(); // Make user_id nullable
            $table->unsignedBigInteger('invitation_id')->nullable(); // Make invitation_id nullable

            // Define foreign keys
            $table->foreign('invitation_id')
                  ->references('id')->on('invitations')
                  ->nullOnDelete(); // Correct method to set foreign key
            
            $table->foreign('user_id')
                  ->references('id')->on('users')
                  ->nullOnDelete(); // Correct method to set foreign key
            
            $table->timestamps();
        
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_invitaions');
    }
};
