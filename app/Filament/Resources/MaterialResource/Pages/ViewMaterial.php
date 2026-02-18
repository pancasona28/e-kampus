<?php

namespace App\Filament\Resources\MaterialResource\Pages;

use App\Filament\Resources\MaterialResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;
use Illuminate\Contracts\View\View;

class ViewMaterial extends ViewRecord {
    protected static string $resource = MaterialResource::class;

    public function getFooter(): View {
        return view('filament.settings.forum-section', [
            'record' => $this->getRecord(),
        ]);
    }

    public function createDiscussionForMaterial() {
        $record = $this->getRecord();

        // Logika pembuatan diskusi
        Discussion::create([
            'course_id' => $record->course_id,
            'user_id' => auth()->id(),
            'content' => "Forum diskusi untuk materi: " . $record->title,
        ]);

        // Berikan notifikasi sukses (ciri khas Filament)
        \Filament\Notifications\Notification::make()
            ->title('Forum Diskusi Berhasil Dibuat')
            ->success()
            ->send();

        // Refresh halaman agar tampilan berubah dari tombol menjadi forum
        return redirect(request()->header('Referer'));
    }
}
