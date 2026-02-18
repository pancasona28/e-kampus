<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class Material extends Model {
    //
    use SoftDeletes;
    protected $fillable = [
        'course_id',
        'title',
        'file_path',
        'file_type',
        'file_size',
    ];
    public function course() {
        return $this->belongsTo(Course::class);
    }

    protected static function booted() {
        static::deleting(function ($material) {
            if ($material->isForceDeleting()) {
                if ($material->file_path) {
                    Storage::disk('public')->delete($material->file_path);
                }
            }
        });
    }
}
