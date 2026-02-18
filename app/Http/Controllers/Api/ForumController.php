<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Reply;
use App\Models\Discussion;
use App\Events\ReplyCreated; // Pastikan Event ini sudah Anda buat
use Illuminate\Http\Request;

class ForumController extends Controller {
    /**
     * Menyimpan balasan diskusi dan memancarkannya secara real-time.
     */
    public function storeReply(Request $request, $id) {
        // Validasi input
        $request->validate([
            'content' => 'required|string',
        ]);

        // Simpan data ke tabel replies
        $reply = Reply::create([
            'discussion_id' => $id,
            'user_id' => auth()->id(),
            'content' => $request->content
        ]);

        // Ambil data user agar nama pengirim muncul di frontend
        $reply->load('user');

        // Broadcast ini yang membuat forum jadi real-time melalui WebSocket
        broadcast(new ReplyCreated($reply))->toOthers();

        return response()->json([
            'message' => 'Balasan berhasil dikirim',
            'data' => $reply
        ], 201);
    }
}
