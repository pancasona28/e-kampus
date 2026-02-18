<?php

namespace App\Filament\Resources\MyCourseResource\Pages;

use App\Filament\Resources\MyCourseResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditMyCourse extends EditRecord
{
    protected static string $resource = MyCourseResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
