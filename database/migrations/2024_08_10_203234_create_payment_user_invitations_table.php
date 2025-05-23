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
        Schema::create('payment_user_invitations', function (Blueprint $table) {
            $table->id();
            $table->string('id_payment')->nullable();
            $table->boolean('status')->default(0);
            $table->integer('value')->unsigned()->default(0);
            // $table->unsignedBigInteger('user_invitation_id');
            // $table->foreign('user_invitation_id')->references('id')->on('user_invitations')->cascadeOnUpdate()->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment_user_invitations');
    }
};
