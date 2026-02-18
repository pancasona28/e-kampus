# E-Learning Kampus - Laravel & Filament Stack

Sistem Informasi Manajemen Pembelajaran (E-Learning) Kampus yang dibangun menggunakan Laravel 11, Filament PHP (Admin Panel), dan Laravel Sanctum untuk autentikasi API. Proyek ini dirancang untuk memfasilitasi interaksi antara Dosen dan Mahasiswa dalam manajemen perkuliahan, tugas, dan forum diskusi real-time.

## 🐱 user list
    username                pass            level
1. admin@mail.com           password         admin
2. affan@mail.com           password         dosen
3. nuariananda28@gmail.com  password        mahasiswa

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

## 🎓 E-Kampus Management System - Forum Module

Modul ini adalah bagian dari sistem manajemen pembelajaran (LMS) yang memungkinkan interaksi real-time antara Dosen dan Mahasiswa melalui fitur Forum Diskusi yang terintegrasi langsung dengan Materi Kuliah.

## 🚀 Fitur Utama
* **Auto-Generated Forum**: Ruang diskusi otomatis tercipta tepat saat Dosen mengunggah materi baru melalui fungsi `booted` pada Model.
* **Contextual Discussion**: Setiap materi memiliki ruang obrolan unik, sehingga diskusi tidak bercampur antar materi atau mata kuliah.
* **Filament Integration**: Menggunakan custom `ViewRecord` pada Filament PHP untuk pengalaman administrasi yang mulus.
* **Clean Storage**: Sistem otomatis menghapus file fisik di storage saat data materi dihapus permanen.

## 📍 Panduan Lokasi Forum
Untuk mengakses forum diskusi, silakan ikuti langkah berikut:
1. Masuk ke Panel Admin E-Kampus.
2. Buka menu **Material** (Materi).
3. Pilih salah satu materi, lalu klik tombol **View** (ikon mata).
4. Gulir ke bagian paling bawah halaman (**Footer Section**). 
5. Forum diskusi terletak tepat di bawah detail informasi materi.

## ⚙️ Spesifikasi Teknis & Arsitektur
* **Framework**: Laravel 10/11
* **Admin Panel**: Filament PHP v3
* **Frontend Engine**: Livewire v3
* **Database**: PostgreSQL
* **Logic Handler**: Eloquent Model Hooks (`created`, `deleting`)



## ⚠️ Keterbatasan Sistem & Catatan Teknis
Penting untuk diperhatikan bahwa modul forum ini memiliki beberapa karakteristik teknis:

1.  **Tanpa WebSockets**: 
    Karena alasan kompatibilitas infrastruktur (PHP 8.2), sistem ini **tidak menggunakan** protokol WebSockets (`pusher` atau `laravel-websockets`). 
2.  **Mekanisme Sinkronisasi**: 
    Pesan baru akan muncul saat pengguna mengirim pesan atau melakukan pemuatan ulang (refresh) halaman. Tidak ada koneksi *long-polling* aktif untuk menjaga beban server tetap ringan.
3.  **Dependency**: 
    Fungsi pembuatan diskusi sangat bergantung pada `course_id` dan `material_id`. Pastikan relasi database selalu terjaga.



## 🛠️ Instalasi & Pengembangan
Jika Anda melakukan migrasi atau instalasi di lingkungan baru, pastikan menjalankan perintah optimasi:
```bash
php artisan optimize
php artisan migrate

jalankan npm run juga

_Proyek ini masih dalam tahap pengembangan struktur database. Langkah instalasi akan diperbarui setelah integrasi Filament dan Sanctum selesai._

1. Clone repository:
    ```bash
    <!-- git clone [https://github.com/pancasona28/e-kampus.git](https://github.com/pancasona28/e-kampus.git) -->
    ```
