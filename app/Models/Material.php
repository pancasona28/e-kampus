<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Material extends Model {
    //

    protected $fillable = [
        'course_id',
        'title',
        'file_path',
        'file_type',
        'file_size',
    ];
}
