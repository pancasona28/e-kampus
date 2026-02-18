<div class="space-y-6 p-4 bg-white rounded-xl shadow">
    <div class="pb-4 border-b">
        <h2 class="text-xl font-bold text-gray-800">{{ $discussion->course->name }}</h2>
        <p class="mt-2 text-gray-600">{{ $discussion->content }}</p>
        <span class="text-xs text-blue-500">Oleh: {{ $discussion->user->name }}</span>
    </div>

    <div class="space-y-4 max-h-96 overflow-y-auto">
        @foreach ($discussion->replies as $reply)
            <div
                class="{{ $reply->user_id === auth()->id() ? 'ml-12 bg-blue-50' : 'mr-12 bg-gray-50' }} p-3 rounded-lg border">
                <div class="flex justify-between items-center mb-1">
                    <span class="font-semibold text-sm">{{ $reply->user->name }}</span>
                    <span class="text-[10px] text-gray-400">{{ $reply->created_at->diffForHumans() }}</span>
                </div>
                <p class="text-gray-700 text-sm">{{ $reply->content }}</p>
            </div>
        @endforeach
    </div>

    <div class="pt-4 border-t">
        <form wire:submit.prevent="sendReply" class="flex gap-2">
            <input type="text" wire:model="newReply" placeholder="Tulis balasan..."
                class="flex-1 border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500">
            <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                Kirim
            </button>
        </form>
    </div>
</div>
