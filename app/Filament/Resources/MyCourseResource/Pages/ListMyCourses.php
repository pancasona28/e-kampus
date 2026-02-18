<?php

namespace App\Filament\Resources\MyCourseResource\Pages;

use App\Filament\Resources\MyCourseResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListMyCourses extends ListRecords
{
    protected static string $resource = MyCourseResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
