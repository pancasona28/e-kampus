<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CourseResource\Pages;
use App\Filament\Resources\CourseResource\RelationManagers;
use App\Models\Course;
use Filament\Forms;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CourseResource extends Resource {
    protected static ?string $model = Course::class;
    protected static ?string $navigationLabel = 'Kelola Mata Kuliah';
    protected static ?string $navigationGroup = 'Menu';
    protected static ?string $modelLabel = 'Mata Kuliah';
    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';

    public static function form(Form $form): Form {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->label('Nama Mata Kuliah'),
                TextInput::make('kode_matkul')
                    ->required(),
                Forms\Components\Textarea::make('description')
                    ->label('Deskripsi'),
                Forms\Components\Select::make('lecturer_id')
                    ->relationship(
                        'lecturer',
                        'name',
                        fn($query) => $query->where('role', 'dosen')
                    )
                    ->searchable()
                    ->preload()
                    ->required()
                    ->label('Dosen Pengampu'),
            ]);
    }

    public static function table(Table $table): Table {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')->searchable(),
                Tables\Columns\TextColumn::make('lecturer.name')->label('Dosen'),
                TextColumn::make('kode_matkul')->label('Kode Mata Kuliah'),
                Tables\Columns\TextColumn::make('created_at')->date(),
            ])
            ->filters([
                TrashedFilter::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                
                Tables\Actions\DeleteAction::make(),
                Tables\Actions\RestoreAction::make(),
                Tables\Actions\ForceDeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array {
        return [
        ];
    }

    public static function getPages(): array {
        return [
            'index' => Pages\ListCourses::route('/'),
            'create' => Pages\CreateCourse::route('/create'),
            'edit' => Pages\EditCourse::route('/{record}/edit'),
        ];
    }
}
