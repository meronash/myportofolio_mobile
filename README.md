# MyPortofolio Mobile

Aplikasi mobile berbasis Flutter untuk portofolio pribadi. Aplikasi ini adalah bentuk mobile dari website portofolio yang dikerjakan pada paruh pertama semester (repositori terpisah).

| | |
|---|---|
| Nama | Rona Mahira |
| NPM | 2506657314 |
| Kelas | PBP E |

## Deskripsi

Halaman menu utama menampilkan identitas dalam tiga kartu informasi, diikuti kisi tombol aksi berwarna. Menekan sebuah tombol memunculkan SnackBar yang menyebutkan nama tombol tersebut.

Saat ini aplikasi masih statis: belum terhubung ke backend Django, dan tombol-tombolnya baru menampilkan SnackBar tanpa membuka halaman lain.

## Fitur

1. Tiga kartu informasi (`InfoCard`) di bagian atas halaman: NPM, Name, dan Class
2. Menu aksi (`ItemCard`) dalam kisi 3 kolom: Lihat Proyek, Tambah Proyek, dan Logout
3. Warna latar yang berbeda untuk setiap tombol, ditentukan lewat atribut `color` pada model `ItemHomepage`
4. SnackBar dengan pesan `Kamu telah menekan tombol [Nama Tombol]!` ketika tombol ditekan

## Teknologi

- Flutter dan bahasa Dart
- Material 3

## Progres

| Tahap | Yang dikerjakan |
|---|---|
| Tutorial 08 | Setup Flutter dan Android Studio, proyek `myportofolio_mobile`, `menu.dart` dipisah dari `main.dart`, `MyHomePage` menjadi `StatelessWidget`, `InfoCard`, `ItemCard` dengan SnackBar, dan tema warna |
| Tugas 7 | Identitas pribadi pada `InfoCard`, atribut `color` pada `ItemHomepage` sehingga setiap kartu memiliki warna latar unik, serta dokumentasi proyek |

## Pertanyaan Reflektif

### Tugas 7

## Deklarasi Penggunaan AI

### Tugas 7

**Alat:** Claude

**Bagian yang dibantu AI:**
1. Merangkum PDF Tutorial 08: alur instalasi, struktur proyek, dan komponen yang dibuat.
2. Menguraikan spesifikasi Tugas 7 menjadi daftar perubahan dan urutan pengerjaan.
3. Meninjau `menu.dart` dan `main.dart` untuk menunjukkan bagian yang belum memenuhi checklist.

**Strategi prompting:**
- Mengunggah PDF tutorial dan tugas sebagai konteks, lalu meminta ringkasan atau daftar langkah.
- Menempelkan kode utuh dan menanyakan bagian mana yang belum memenuhi checklist.
- Menjalankan sendiri semua perubahan, karena AI tidak dapat menjalankan proyek ini.