<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Discussion;
use App\Models\Reply;
use App\Events\ReplyCreated;
use Livewire\Attributes\On;

class ForumDiskusi extends Component {
    public $discussionId;
    public $newReply = '';

    // Menentukan diskusi mana yang sedang dibuka
    public function mount($discussionId) {
        $this->discussionId = $discussionId;
    }

    // Fungsi untuk mengirim balasan
    public function sendReply() {
        $this->validate(['newReply' => 'required|min:2']);

        $reply = Reply::create([
            'discussion_id' => $this->discussionId,
            'user_id' => auth()->id(),
            'content' => $this->newReply,
        ]);

        // Memancarkan event real-time ke orang lain
        broadcast(new ReplyCreated($reply))->toOthers();

        // Reset input setelah kirim
        $this->newReply = '';
    }

    // Listener: Ketika ada balasan baru masuk via WebSocket
    #[On('echo:discussion.{discussionId},ReplyCreated')]
    public function handleNewReply($event) {
        // Livewire akan otomatis me-render ulang tampilan
    }

    public function createDiscussionForMaterial() {
        // Mengambil data material berdasarkan record yang sedang aktif
        $material = \App\Models\Material::find($this->recordId); // Pastikan Anda menyimpan recordId di mount()

        if ($material) {
            $discussion = \App\Models\Discussion::create([
                'course_id' => $material->course_id,
                'user_id' => auth()->id(),
                'content' => "Forum diskusi untuk materi: " . $material->title,
            ]);

            // Refresh halaman agar @if($record->discussion) di Blade menjadi true
            return redirect(request()->header('Referer'));
        }
    }
    public function render() {
        return view('livewire.forum-diskusi', [
            'discussion' => Discussion::with('replies.user')->find($this->discussionId),
        ]);
    }
}
