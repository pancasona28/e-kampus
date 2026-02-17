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

## 📥 Instalasi (Segera Hadir)

_Proyek ini masih dalam tahap pengembangan struktur database. Langkah instalasi akan diperbarui setelah integrasi Filament dan Sanctum selesai._

1. Clone repository:
    ```bash
    <!-- git clone [https://github.com/pancasona28/e-kampus.git](https://github.com/pancasona28/e-kampus.git) -->
    ```
