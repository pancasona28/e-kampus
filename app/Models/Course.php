<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Course extends Model {
    use SoftDeletes;
    protected $table = 'courses';
    protected $fillable = [
        'name',
        'description',
        'lecturer_id',
        'kode_matkul'
    ];
    //

    public function lecturer() {
        return $this->belongsTo(User::class, 'lecturer_id');
    }

    public function materials() {
        return $this->hasMany(Material::class);
    }

    public function assignments() {
        return $this->hasMany(Assignment::class);
    }
}
