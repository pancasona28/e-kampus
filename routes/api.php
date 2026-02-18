<?php

use App\Http\Controllers\Api\ForumController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/discussions', [ForumController::class, 'storeDiscussion']);
    Route::post('/discussions/{id}/replies', [ForumController::class, 'storeReply']);
});


