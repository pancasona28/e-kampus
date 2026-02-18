<?php

namespace App\Filament\Widgets;

use App\Models\Course;
use App\Models\Assignment;
use App\Models\Submission;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class LecturerStatsOverview extends BaseWidget {


    protected function getStats(): array {
        $lecturerId = auth()->id();

        // Jumlah Mahasiswa per Mata Kuliah (Total dari semua kelas dosen)
        $totalStudents = Course::where('lecturer_id', $lecturerId)
            ->withCount('students')
            ->get()
            ->sum('students_count');

        // Tugas yang Belum Dinilai
        $unscoredAssignments = Submission::whereHas('assignment.course', function ($query) use ($lecturerId) {
            $query->where('lecturer_id', $lecturerId);
        })
            ->whereNull('score')
            ->count();

        return [
            Stat::make('Total Mahasiswa Diampu', $totalStudents)
                ->description('Mahasiswa terdaftar di semua kelas Anda')
                ->descriptionIcon('heroicon-m-users')
                ->color('info'),
            Stat::make('Tugas Belum Dinilai', $unscoredAssignments)
                ->description('Segera periksa tugas mahasiswa')
                ->descriptionIcon('heroicon-m-clipboard-document-check')
                ->color($unscoredAssignments > 0 ? 'warning' : 'success'),
        ];
    }
    protected function getType(): string {
        return 'bar';
    }
    public static function canView(): bool {
        return auth()->user()->hasRole(['dosen', 'admin']);
    }
}
