<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

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
        return $this->belongsTo(Course::class);
    }
}
