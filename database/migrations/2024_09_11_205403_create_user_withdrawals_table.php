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
        Schema::create('user_withdrawals', function (Blueprint $table) {
            $table->id();
            $table->string('value');
            $table->boolean('type');
            $table->unsignedBigInteger('user_id')->nullable(); // Ensure this is nullable if using nullOnDelete
            $table->foreign('user_id')->references('id')->on('users')->nullOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_withdrawals');
    }
};
