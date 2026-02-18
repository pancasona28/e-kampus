<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MyCourseResource\Pages;
use App\Filament\Resources\MyCourseResource\RelationManagers;
use App\Models\course_students;
use App\Models\Course;
use App\Models\MyCourse;

use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rules\Unique;

class MyCourseResource extends Resource {
    protected static ?string $model = course_students::class;
    protected static ?string $navigationLabel = 'Mata Kuliah Saya';
    protected static ?string $modelLabel = 'Daftar Mata Kuliah';

    protected static ?string $navigationIcon = 'heroicon-o-book-open';
    protected static ?string $navigationGroup = 'Menu';


    public static function form(Form $form): Form {
        return $form
            ->schema([

                // Input course_id yang sudah divalidasi di atas
                self::getCourseSelectComponent(),

                // Hidden field untuk menyimpan ID user yang sedang login
                \Filament\Forms\Components\Hidden::make('student_id')
                    ->default(Auth::id())
                    ->required(),

            ]);
    }

    public static function getCourseSelectComponent(): Select {
        return Select::make('course_id')
            ->label('Pilih Mata Kuliah')
            ->options(function () {
                // Ambil semua ID mata kuliah yang sudah diambil oleh user ini
                $alreadyTakenIds = DB::table('course_students')
                    ->where('student_id', Auth::id())
                    ->pluck('course_id');

                // ampilkan mata kuliah yang ID-nya TIDAK ada dalam daftar di atas
                return Course::whereNotIn('id', $alreadyTakenIds)
                    ->pluck('name', 'id');
            })
            ->searchable()
            ->required()
            // Tetap gunakan unique sebagai pengaman tambahan
            ->unique('course_students', 'course_id', modifyRuleUsing: function (Unique $rule) {
                return $rule->where('student_id', Auth::id());
            }, ignoreRecord: true);
    }


    public static function table(Table $table): Table {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('course.name')->label('Nama Mata Kuliah')->searchable(),
                Tables\Columns\TextColumn::make('course.lecturer.name')->label('Dosen Pengampu')->searchable(),
                Tables\Columns\TextColumn::make('course.kode_matkul')->label('Kode Mata Kuliah')->searchable(),
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
            //
        ];
    }

    public static function getPages(): array {
        return [
            'index' => Pages\ListMyCourses::route('/'),
            'create' => Pages\CreateMyCourse::route('/create'),
            'edit' => Pages\EditMyCourse::route('/{record}/edit'),
        ];
    }
}
