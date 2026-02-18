<?php

namespace App\Filament\Resources\AssignmentResource\RelationManagers;

use App\Notifications\GradePublishedNotification;
use App\Notifications\NilaiTugasNotification;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Storage;

class SubmissionsRelationManager extends RelationManager {
    protected static string $relationship = 'submissions';

    public function form(Form $form): Form {
        return $form
            ->schema([
                Forms\Components\TextInput::make('student_id')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public function table(Table $table): Table {
        return $table
            ->recordTitleAttribute('student_id')
            ->columns([
                Tables\Columns\TextColumn::make('student.name')
                    ->label('Mahasiswa')
                    ->visible(fn() => auth()->user()->hasRole('dosen')), // Dosen perlu lihat nama, mahasiswa tidak (karena itu data mereka sendiri)
                Tables\Columns\TextColumn::make('file_path')
                    ->label('File Tugas')
                    ->formatStateUsing(fn($state) => 'Lihat Dokumen')
                    ->color('primary')
                    ->icon('heroicon-m-eye')
                    // Fungsi untuk mengarahkan ke URL file di storage
                    ->url(function ($record) {
                        if (!$record->file_path) return null;
                        return Storage::disk('public')->url($record->file_path);
                    })
                    // Agar terbuka di tab baru (pindah tab overview)
                    ->openUrlInNewTab(),
                Tables\Columns\TextColumn::make('score')
                    ->label('Nilai')
                    ->badge()
                    ->color(fn($state) => $state >= 70 ? 'success' : 'danger')
                    ->placeholder('Belum Dinilai'),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\Action::make('download_jawaban')
                    ->label('Download')
                    ->icon('heroicon-o-arrow-down-tray')
                    ->action(fn($record) => Storage::disk('public')->download($record->file_path)),

                // 2. Tombol Beri Nilai
                Tables\Actions\EditAction::make()
                    ->label('Beri Nilai')
                    // Memaksa tombol muncul jika dia dosen, tanpa peduli ada Policy atau tidak
                    ->authorize(fn() => auth()->user()?->hasRole('dosen'))
                    ->form([
                        Forms\Components\TextInput::make('score')
                            ->numeric()
                            ->label('Input Nilai (0-100)')
                            ->required(),
                        Forms\Components\Textarea::make('feedback')
                            ->label('Catatan Dosen'),
                    ])->after(function ($record, array $data) {

                        $student = $record->student;

                        if ($student && $student->email) {
                            // Mengirim email ke mahasiswa
                            $student->notify(new NilaiTugasNotification(
                                $record->assignment->feedback ?? 'Tidak ada catatan tambahan',
                                $data['score']
                            ));
                        }
                    }),
                // Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),

            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
    public static function canViewForRecord(Model $ownerRecord, string $pageClass): bool {
        $user = auth()->user();

        // 1. Admin selalu bisa lihat
        if ($user->hasRole('admin')) {
            return true;
        }

        // 2. Mahasiswa HARUS bisa lihat (agar tabel pengumpulannya muncul)
        if ($user->hasRole('mahasiswa')) {
            return true;
        }

        // 3. Dosen hanya bisa lihat jika itu mata kuliah miliknya
        return $ownerRecord->course->lecturer_id === $user->id;
    }

    protected function getEloquentQuery(): Builder {
        $query = parent::getEloquentQuery();
        $user = auth()->user();

        // Filter isi tabel: Mahasiswa hanya melihat datanya sendiri
        if ($user->hasRole('mahasiswa')) {
            return $query->where('student_id', $user->id);
        }

        // Dosen/Admin melihat semua data yang masuk
        return $query;
    }
}
