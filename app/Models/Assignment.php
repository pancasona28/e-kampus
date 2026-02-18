<?php

namespace App\Models;

use App\Notifications\NewAssignmentNotification;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Notification;

class Assignment extends Model {
    use SoftDeletes;
    protected $table = 'assignments';
    protected $fillable = [
        'course_id',
        'title',
        'description',
        'deadline'
    ];
    public function course() {
        return $this->belongsTo(Course::class, 'course_id');
    }

    public function submissions() {
        return $this->hasMany(Submission::class);
    }

    protected static function booted() {
        static::created(function ($assignment) {
            // 1. Ambil daftar mahasiswa yang mengambil mata kuliah ini
            // Relasi ini harus sudah Anda buat di model Course
            $students = $assignment->course->students;

            // 2. Kirim notifikasi ke semua mahasiswa tersebut
            if ($students->count() > 0) {
                Notification::send($students, new NewAssignmentNotification($assignment));
            }
        });
    }

    
}
