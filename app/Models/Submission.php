<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Submission extends Model {
    use SoftDeletes;
    protected $fillable = [
        'assignment_id',
        'student_id',
        'file_path',
        'score',
        'feedback',
        'submitted_at',
    ];

    public function student(): \Illuminate\Database\Eloquent\Relations\BelongsTo {
        return $this->belongsTo(User::class, 'student_id');
    }
}
