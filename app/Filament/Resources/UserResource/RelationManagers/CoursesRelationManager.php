<?php

namespace App\Filament\Resources\UserResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CoursesRelationManager extends RelationManager {
    protected static string $relationship = 'courses';

    public function form(Form $form): Form {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public function table(Table $table): Table {
        return $table
            ->recordTitleAttribute('name')
            ->columns([
                Tables\Columns\TextColumn::make('name')->label('Nama Mata Kuliah'),
                Tables\Columns\TextColumn::make('lecturer.name')->label('Dosen Pengampu'),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\AttachAction::make()
                    ->preloadRecordSelect()
                    ->label('Ambil Mata Kuliah')
                    // Tombol ini hanya muncul jika user yang sedang diedit adalah mahasiswa
                    ->visible(fn($livewire) => $livewire->ownerRecord->role === 'mahasiswa'),
            ])
            ->actions([
                Tables\Actions\DetachAction::make()
                    ->label('Batalkan')
                    ->visible(fn($livewire) => $livewire->ownerRecord->role === 'mahasiswa'),
            ])
            ->bulkActions([
                Tables\Actions\DetachBulkAction::make(),
            ]);
    }
}
