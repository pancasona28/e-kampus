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
    public function discussion() {
        // Sesuaikan foreign key-nya, misalnya 'material_id' atau 'course_id'
        return $this->hasOne(Discussion::class, 'material_id');
    }

    protected static function booted() {
        static::deleting(function ($material) {
            if ($material->isForceDeleting()) {
                if ($material->file_path) {
                    Storage::disk('public')->delete($material->file_path);
                }
            }
        });

        static::created(function ($material) {
            // Gunakan create() atau firstOrCreate() dengan menyertakan course_id secara eksplisit
            \App\Models\Discussion::create([
                'course_id' => $material->course_id, // Pastikan nilai ini tidak null
                'user_id'   => auth()->id() ?? 1,
                'material_id' => $material->id,
                'title'     => "Diskusi: " . $material->title,
                'content'   => "Forum diskusi utama untuk mata kuliah ini. Mari berdiskusi tentang materi: " . $material->title,
            ]);
        });
    }
}
