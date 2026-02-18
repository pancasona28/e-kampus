<?php

namespace App\Models;

use App\Models\Course;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Permission\Traits\HasRoles;

class course_students extends Model {
    use SoftDeletes, HasRoles;

    protected $table = 'course_students';
    protected $fillable = ['course_id', 'student_id'];

    public function course() {
        return $this->belongsTo(Course::class, 'course_id');
    }
}
