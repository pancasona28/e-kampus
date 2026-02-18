<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MaterialResource\Pages;
use App\Filament\Resources\MaterialResource\RelationManagers;
use App\Models\Material;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;
use Livewire\Features\SupportFileUploads\TemporaryUploadedFile;

class MaterialResource extends Resource {
    protected static ?string $model = Material::class;

    protected static ?string $navigationLabel = 'Materi Kuliah';
    protected static ?string $navigationGroup = 'Menu';
    protected static ?string $modelLabel = 'Materi';
    protected static ?string $navigationIcon = 'heroicon-o-book-open';

    public static function form(Form $form): Form {
        return $form
            ->schema([
                Forms\Components\Select::make('course_id')
                    ->relationship('course', 'name', function (Builder $query) {
                        if (auth()->user()->hasRole('dosen')) {
                            return $query->where('lecturer_id', auth()->id());
                        }
                    })
                    ->required(),
                Forms\Components\TextInput::make('title')
                    ->required()
                    ->unique(ignoreRecord: true)
                    ->label('Judul Materi'),

                Forms\Components\FileUpload::make('file_path')
                    ->label('File Materi (PDF/Doc/PPT)')
                    ->directory('materi-kuliah')
                    ->visibility('public')
                    ->acceptedFileTypes([
                        'application/pdf',
                        'application/msword',
                        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                        'application/vnd.ms-powerpoint',
                        'application/vnd.openxmlformats-officedocument.presentationml.presentation'
                    ])
                    ->live()
                    ->afterStateUpdated(function (TemporaryUploadedFile $state, Set $set) {

                        $set('file_type', $state->getClientOriginalExtension());

                        $set('file_size', $state->getSize());
                    })
                    ->maxSize(10240)
                    ->required()
                    ->preserveFilenames()
                    ->downloadable()
                    ->openable(),

                Forms\Components\Hidden::make('file_type')
                    ->label('Tipe File')
                    ->dehydrated(),

                Forms\Components\Hidden::make('file_size')
                    ->label('Ukuran File (Bytes)')
                    ->dehydrated(),
            ]);
    }

    public static function table(Table $table): Table {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('course.name')
                    ->label('Mata Kuliah')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('title')
                    ->label('Judul Materi')
                    ->searchable()
                    ->url(fn($record) => asset('storage/' . $record->file_path))
                    ->openUrlInNewTab(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Tanggal Unggah')
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([
                TrashedFilter::make(),


            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\Action::make('download')
                    ->label('Download')
                    ->icon('heroicon-o-arrow-down-tray')
                    ->color('success')
                    ->action(function ($record) {

                        $pathToFile = storage_path('app/public/' . $record->file_path);

                        if (!file_exists($pathToFile)) {
                            \Filament\Notifications\Notification::make()
                                ->title('File tidak ditemukan di server')
                                ->danger()
                                ->send();
                            return;
                        }


                        return response()->download(
                            $pathToFile,
                            $record->title . '.' . $record->file_type
                        );
                    }),
                Tables\Actions\DeleteAction::make(),
                Tables\Actions\RestoreAction::make(),
                Tables\Actions\ForceDeleteAction::make(),
                Tables\Actions\ViewAction::make()->label('Forum Diskusi'),
            ])

            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getEloquentQuery(): Builder {
        $user = auth()->user();

        if ($user->hasRole('super_admin')) {
            return parent::getEloquentQuery();
        }

        if ($user->hasRole('dosen')) {
            return parent::getEloquentQuery()
                ->whereHas('course', function ($query) use ($user) {
                    $query->where('lecturer_id', $user->id);
                });
        }

        return parent::getEloquentQuery()
            ->whereHas('course.students', function ($query) use ($user) {
                $query->where('course_students.student_id', $user->id);
            });
    }

    public static function getRelations(): array {
        return [
            //
        ];
    }

    public static function getPages(): array {
        return [
            'index' => Pages\ListMaterials::route('/'),
            'create' => Pages\CreateMaterial::route('/create'),
            'edit' => Pages\EditMaterial::route('/{record}/edit'),
            'view' => Pages\ViewMaterial::route('/{record}'),
        ];
    }
}
