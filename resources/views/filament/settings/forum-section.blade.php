<div class="mt-6 border-t pt-6">
    <h3 class="text-lg font-bold mb-4">Forum Diskusi</h3>

    @if ($record->discussion)
        @livewire('forum-diskusi', ['discussionId' => $record->discussion->id])
    @else
        <div class="p-4 bg-gray-50 border border-dashed rounded-xl text-center text-gray-500">
            Diskusi akan tersedia setelah sistem melakukan sinkronisasi data.
        </div>
    @endif
</div>
