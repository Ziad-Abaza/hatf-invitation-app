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
        Schema::create('invited_users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('phone');
            $table->string('code');
            $table->string('qr');
            $table->boolean('status')->default(0);
            $table->enum('send_status', ['pending', 'sent', 'failed', 'rejected', 'accepted'])->default('pending');
            $table->text('error_message')->nullable();
            $table->unsignedBigInteger('user_invitations_id');
            $table->foreign('user_invitations_id')->references('id')->on('user_invitations')->cascadeOnUpdate()->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invited_users');
    }
};
