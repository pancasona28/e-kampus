<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AssignmentResource\Pages;
use App\Filament\Resources\AssignmentResource\RelationManagers;
use App\Models\Assignment;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class AssignmentResource extends Resource {
    protected static ?string $model = Assignment::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Menu';
    protected static ?string $navigationLabel = 'Tugas Kuliah';
    protected static ?string $modelLabel = 'Tugas';


    public static function form(Form $form): Form {
        return $form
            ->schema([
                Forms\Components\Select::make('course_id')
                    ->relationship('course', 'name')
                    ->searchable()
                    ->preload()
                    ->required()
                    ->label('Mata Kuliah'),
                Forms\Components\TextInput::make('title')
                    ->required()
                    ->unique(ignoreRecord: true)
                    ->label('Judul Tugas'),
                Forms\Components\Textarea::make('description')
                    ->label('Deskripsi Tugas'),
                Forms\Components\DateTimePicker::make('deadline')
                    ->required()
                    ->label('Deadline'),
            ]);
    }

    public static function table(Table $table): Table {
        return $table

            ->columns([
                Tables\Columns\TextColumn::make('course.name')->label('Mata Kuliah'),
                Tables\Columns\TextColumn::make('title')->searchable(),
                Tables\Columns\TextColumn::make('description')->limit(50)->label('Deskripsi'),
                Tables\Columns\TextColumn::make('deadline')->dateTime()->label('Deadline'),
                Tables\Columns\TextColumn::make('created_at')->date()->label('Dibuat Pada'),
            ])
            ->filters([
                TrashedFilter::make(),
            ])
            ->actions([
                Tables\Actions\ViewAction::make()
                    ->label('Periksa Tugas'),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
                Tables\Actions\RestoreAction::make(),
                Tables\Actions\ForceDeleteAction::make(),
                Tables\Actions\Action::make('kumpul_tugas')
                    ->label('Kumpulkan Tugas')
                    ->visible(function ($record) {
                        $user = auth()->user();

                        // 1. Hanya muncul untuk mahasiswa
                        if (!$user->hasRole('mahasiswa')) {
                            return false;
                        }

                        // 2. Sembunyikan jika mahasiswa ini SUDAH mengumpulkan tugas (ada di tabel submissions)
                        // $record di sini adalah model Assignment
                        $sudahKumpul = $record->submissions()
                            ->where('student_id', $user->id)
                            ->exists();

                        $isExpired = \Carbon\Carbon::parse($record->deadline)->isPast();
                        return !$sudahKumpul && !$isExpired;
                    })
                    ->form([
                        Forms\Components\FileUpload::make('file_path')
                            ->directory('submissions')
                            ->required(),
                    ])
                    ->icon('heroicon-o-cloud-arrow-up')
                    ->action(function ($record, array $data) {
                        // $record di sini adalah Assignment (Tugas)
                        // $data adalah hasil input dari form di atas

                        $record->submissions()->create([
                            'student_id' => auth()->id(),
                            'file_path' => $data['file_path'], // Pastikan mengambil dari $data
                        ]);

                        \Filament\Notifications\Notification::make()
                            ->title('Tugas Berhasil Dikirim')
                            ->success()
                            ->send();
                    })
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array {
        return [
            RelationManagers\SubmissionsRelationManager::class,
        ];
    }

    public static function getPages(): array {
        return [
            'index' => Pages\ListAssignments::route('/'),
            'create' => Pages\CreateAssignment::route('/create'),
            'view' => Pages\ViewAssignment::route('/{record}'),
            'edit' => Pages\EditAssignment::route('/{record}/edit'),
        ];
    }
}
