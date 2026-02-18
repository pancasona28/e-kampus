<?php

namespace App\Http\Controllers;

use App\Events\DiscussionCreated;
use App\Events\ReplyCreated;
use App\Models\Discussion;
use App\Models\Reply;
use Illuminate\Http\Request;

abstract class Controller {
    public function storeDiscussion(Request $request) {
        $request->validate(['course_id' => 'required', 'content' => 'required']);

        $discussion = Discussion::create([
            'course_id' => $request->course_id,
            'user_id' => auth()->id(),
            'content' => $request->content
        ]);

        broadcast(new DiscussionCreated($discussion))->toOthers();

        return response()->json($discussion);
    }

    public function storeReply(Request $request, $id) {
        $request->validate(['content' => 'required']);

        $reply = Reply::create([
            'discussion_id' => $id,
            'user_id' => auth()->id(),
            'content' => $request->content
        ]);

        // Pancarkan event real-time
        broadcast(new ReplyCreated($reply))->toOthers();

        return response()->json($reply);
    }
}
