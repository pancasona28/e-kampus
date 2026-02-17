<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable implements FilamentUser {
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, SoftDeletes, HasRoles, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $table = 'users';
    protected $fillable = [
        'name',
        'email',
        'password',
        'nik',
        'nip',
        'nim',
        'jenis_kelamin',
        'tempat_lahir',
        'tanggal_lahir',
        'alamat',
        'no_hp',
        'role',
        'is_active',
    ];

    public function canAccessPanel(Panel $panel): bool {
        // Izinkan login jika kolom role di database adalah 'admin'
        // return $this->role === 'admin';
        return true;
    }
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function courses(): HasMany {
        return $this->hasMany(Course::class, 'lecturer_id');
    }
    protected static function booted(): void {
        static::saved(function ($user) {

            if ($user->role === 'admin') {
                $user->syncRoles(['super_admin']);
            } elseif ($user->role === 'dosen') {
                $user->syncRoles(['dosen']);
            } elseif ($user->role === 'mahasiswa') {
                $user->syncRoles(['mahasiswa']);
            }
        });
    }
}
