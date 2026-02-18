<?php

namespace App\Filament\Widgets;

use App\Models\Submission;
use App\Models\User;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;

class StudentGradeAnalysis extends BaseWidget {
    protected static ?string $heading = 'Analitik Nilai Per Mahasiswa';

    // Agar muncul bersebelahan dengan widget lain, atur span-nya
    protected int | string | array $columnSpan = 'full';

    public function table(Table $table): Table {
        return $table
            ->query(
                // Mengambil user dengan role mahasiswa yang mengumpul di mata kuliah dosen ini
                User::role('mahasiswa')
                    ->withAvg('submissions', 'score') // Menghitung rata-rata secara otomatis di level database
                    ->withCount('submissions')
            )
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label('Nama Mahasiswa')
                    ->searchable(),

                Tables\Columns\TextColumn::make('submissions_count')
                    ->label('Tugas Selesai')
                    ->counts('submissions'),

                Tables\Columns\TextColumn::make('average_score')
                    ->label('Rata-rata Nilai')
                    ->state(function (User $record) {
                        return round($record->submissions()->avg('score'), 2) . ' %';
                    })
                    ->badge()
                    ->color(fn($state) => (float)$state >= 75 ? 'success' : 'danger'),
            ])
            ->actions([
                //
            ]);
    }

    public static function canView(): bool {
        return auth()->user()->hasRole(['dosen', 'admin']);
    }
}
