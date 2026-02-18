<?php

namespace App\Filament\Widgets;

use App\Models\Course;
use Filament\Widgets\ChartWidget;

class CourseStudentChart extends ChartWidget {

    protected static ?string $heading = 'Jumlah Mahasiswa per Mata Kuliah';


    protected function getData(): array {
        $data = Course::where('lecturer_id', auth()->id())
            ->withCount('students')
            ->get();

        return [
            'datasets' => [
                [
                    'label' => 'Jumlah Mahasiswa',
                    'data' => $data->pluck('students_count')->toArray(),
                    'backgroundColor' => '#36A2EB',
                ],
            ],
            'labels' => $data->pluck('name')->toArray(),
        ];
    }


    protected function getType(): string {
        return 'bar';
    }
    public static function canView(): bool {
        return auth()->user()->hasRole(['dosen', 'admin']);
    }
}
