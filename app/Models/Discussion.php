<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Discussion extends Model {
    //

    protected $table = 'discussions';
    protected $fillable = [
        'course_id',
        'user_id',
        'material_id',
        'title',
        'content',
    ];

    public function user() {
        return $this->belongsTo(User::class);
    }
    public function replies() {
        return $this->hasMany(Reply::class);
    }
    public function course() {
        return $this->belongsTo(Course::class);
    }
}
