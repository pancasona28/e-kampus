# E-Learning Kampus - Laravel & Filament Stack

Sistem Informasi Manajemen Pembelajaran (E-Learning) Kampus yang dibangun menggunakan Laravel 11, Filament PHP (Admin Panel), dan Laravel Sanctum untuk autentikasi API. Proyek ini dirancang untuk memfasilitasi interaksi antara Dosen dan Mahasiswa dalam manajemen perkuliahan, tugas, dan forum diskusi real-time.

## 🚀 Fitur Utama

1.  **Multi-Role Authentication**: Autentikasi berbasis token (Sanctum) untuk Mahasiswa dan Dosen.
2.  **Manajemen Akademik**: Pengelolaan Mata Kuliah, Kelas Online, dan Pendaftaran (Enrollment).
3.  **Repository Materi**: Sistem upload dan download materi perkuliahan (PDF, Docx, dsb).
4.  **Sistem Tugas & Penilaian**: Dosen dapat memberikan tugas, mahasiswa mengunggah jawaban, dan dosen memberikan nilai secara langsung.
5.  **Forum Diskusi Real-Time**: Fitur chat interaktif antar pengguna menggunakan Laravel WebSockets/Reverb.
6.  **Dashboard Statistik**: Laporan akademik otomatis melalui Filament Dashboard.

## 🛠️ Tech Stack

- **Backend**: PHP 8.2+, [Laravel 11](https://laravel.com)
- **Admin Panel**: [Filament PHP v3](https://filamentphp.com)
- **Authentication**: Laravel Sanctum (Mobile/API) & Web Session
- **Real-time**: Laravel Reverb / WebSockets
- **Database**: MySQL / PostgreSQL (Supports Soft Deletes)

## 🗄️ Arsitektur Database

Struktur tabel utama yang telah diimplementasikan:

- `users`: Menyimpan data Dosen & Mahasiswa (NIP, NIM, NIK, Role).
- `courses`: Data Mata Kuliah.
- `course_student`: Tabel pivot untuk pendaftaran mahasiswa ke mata kuliah.
- `materials`: Dokumentasi materi perkuliahan.
- `assignments`: Data soal tugas dari dosen.
- `submissions`: Data pengumpulan tugas dan nilai mahasiswa.
- `discussions`: Topik diskusi forum.
- `replies`: Pesan balasan dalam forum diskusi.

# 🎓 E-Kampus - Sistem Autentikasi Ganda

Proyek ini menggunakan Laravel 11 dengan sistem keamanan berlapis untuk memisahkan akses Dashboard Admin dan akses API untuk aplikasi Mobile/Frontend.

## 🛠️ Teknologi Keamanan

- **Filament Shield**: Manajemen Role & Permission berbasis Spatie.
- **Laravel Sanctum**: Autentikasi berbasis Token (Bearer) untuk API.
- **Database**: PostgreSQL (Laragon).

---

## 🔐 1. Autentikasi Dashboard (Filament Shield)

Digunakan oleh **Admin, Dosen, dan Staff** untuk mengelola data melalui browser.

### Konfigurasi Utama

- **Guard**: `web`.
- **Provider**: `app/Providers/Filament/AdminPanelProvider.php`.
- **Role Manager**: Akses penuh dikendalikan oleh Role `super_admin`.

### Fitur Unggulan

- **Policy Automated**: Akses menu otomatis dikunci oleh Policy yang dihasilkan Shield.
- **Role Assignment**: User dapat diberikan role langsung melalui dashboard pada menu Pengguna.
- **Panel Access**: Dibatasi melalui fungsi `canAccessPanel()` di `app/Models/User.php`.

---

## 📱 2. Autentikasi API (Laravel Sanctum)

Digunakan oleh **Mahasiswa atau Aplikasi Mobile** untuk mengambil data secara aman tanpa sesi browser.

### Endpoint Login API

- **URL**: `/api/login`
- **Method**: `POST`
- **Body**:
    ```json
    {
        "email": "user@mail.com",
        "password": "password"
    }
    ```

## 📥 Instalasi (Segera Hadir)

_Proyek ini masih dalam tahap pengembangan struktur database. Langkah instalasi akan diperbarui setelah integrasi Filament dan Sanctum selesai._

1. Clone repository:
    ```bash
    <!-- git clone [https://github.com/pancasona28/e-kampus.git](https://github.com/pancasona28/e-kampus.git) -->
    ```
