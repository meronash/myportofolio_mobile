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
1. Widget tree adalah struktur hierarki atau bertingkat yang menggambarkan bagaimana widget-widget disusun di dalam aplikasi Flutter. Setiap widget dapat memiliki widget lain sebagai anak (child), sehingga membentuk suatu hubungan induk-anak (parent-child). Hubungan ini memungkinkan parent untuk menaungi child dan child juga dapat memiliki widget lain sebagai turunannya. 
Parent adalah widget yang membungkus atau menaungi widget lain, child adalah widget yang berada di dalam widget parent, dan sibling adalah widget-widget yang memiliki parent yang sama.
2. Proyek MyPortfolio Mobile menggunakan berbagai widget bawaan Flutter dan custom widgets untuk membangun tampilan serta interaksi aplikasi. Widget bawaan seperti MaterialApp, Scaffold, AppBar, Column, Row, dan GridView digunakan untuk mengatur struktur dan tata letak halaman. Sementara itu, widget seperti Text, Icon, Card, dan Container digunakan untuk menampilkan konten visual. Untuk interaksi, digunakan InkWell dan SnackBar agar pengguna dapat menekan menu dan memperoleh pesan respons. Selain widget bawaan, proyek ini juga memiliki custom widgets, yaitu MyApp, MyHomePage, InfoCard, dan ItemCard, yang berfungsi membagi tampilan aplikasi menjadi komponen-komponen yang lebih terstruktur dan mudah dikelola.
3. MaterialApp berfungsi sebagai wadah utama yang mengatur bagaimana aplikasi berjalan dan ditampilkan. Ia mengatur warna, font, dan tampilan aplikasi melalui ThemeData; menentukan halaman pertama yang ditampilkan menggunakan properti home; menyediakan sistem navigasi antarhalaman; mengatur judul aplikasi, locale, dan konfigurasi lainnya; menyediakan lingkungan Material Design agar widget lain dapat bekerja sesuai Material Design. 
MaterialApp menjadi root widget karena berfungsi sebagai titik awal yang menyediakan konfigurasi dan lingkungan dasar bagi widget-widget lain di dalam aplikasi sehingga tetap konsisten.
4. Perbedaan keduanya terletak pada apakah widget perlu menyimpan dan mengelola state (keadaan/data) yang dapat berubah selama aplikasi berjalan atau tidak.
StatelessWidget adalah widget yang tidak memiliki state internal yang dapat berubah. Tampilannya bergantung pada nilai atau data yang diberikan ketika widget dibuat. Widget ini baik digunakan ketika tampilan yang diinginkan relatif tetap atau tidak perlu memperbarui dirinya sendiri akibat interaksi pengguna. Misalnya ketika menampilkan teks atau judul.
StatefulWidget adalah widget yang memiliki state yang dapat berubah selama aplikasi berjalan. Jadi, widget dapat membangun ulang tampilannya agar sesuai kondisi terbaru ketika state berubah yang biasanya menggunakan setState(). Widget ini baik digunakan ketika tampilan yang diinginkan perlu diperbarui berdasarkan interaksi pengguna atau perubahan data. Misalnya ketika tombol untuk menambah atau mengurangi angka ditekan.
5. BuildContext adalah objek yang menyimpan informasi mengenai posisi sebuah widget di dalam widget tree Flutter. Dengan ini, sebuah widget dapat mengakses informasi dan fitur yang disediakan oleh widget-widget di atasnya (ancestor widgets). BuildContext ini penting karena membantu widget berinteraksi dengan lingkungan disekitarnya. Ia mengakses Theme, Navigator, MediaQuery, dan ScaffoldMessenger.
BuildContext digunakan sebagai parameter dalam metode build() pada sebuah widget. Melalui parameter tersebut, widget dapat mengakses informasi dari widget lain yang berada di atasnya dalam widget tree. Dengan demikian, widget dapat menyesuaikan tampilan dan perilakunya berdasarkan lingkungan aplikasi.
6. Hot reload adalah fitur Flutter yang memungkinkan developer menerapkan perubahan kode ke aplikasi yang sedang berjalan tanpa menghapus state yang sudah ada. Artinya, aplikasi tidak perlu dimulai ulang dan posisi atau data sementara yang sedang digunakan tetap dipertahankan. Perbedannya dengan hot restart terletak pada bagaimana Flutter menerapkan perubahan kode dan mempertahankan state aplikasi. Hot restart adalah fitur yang memulai ulang aplikasi Flutter dari awal dengan menerapkan perubahan kode terbaru dan akan menghapus state aplikasi yang sedang berjalan.
Hot reload tidak selalu dapat menerapkan semua perubahan kode sehingga perlu menggunakan hot restart atau full restart. Hot restart digunakan ketika perubahan melibatkan inisialisasi aplikasi, perubahan variabel global atau static, dan perubahan yang melibatkan state aplikai dimulai kembali. Sedangkan full restart digunakan ketika perubahan membutuhkan proses pembangunan dan peluncuran ulang aplikasi secara penuh, misalnya mengubah konfigurasi native Android/iOS.

### Tugas 7

**Alat:** Claude

**Bagian yang dibantu AI:**
1. Merangkum PDF Tutorial 08: alur instalasi, struktur proyek, dan komponen yang dibuat.
2. Menguraikan spesifikasi Tugas 7 menjadi daftar perubahan dan urutan pengerjaan.
3. Meninjau `menu.dart` dan `main.dart` untuk menunjukkan bagian yang belum memenuhi checklist.

**Strategi prompting:**
- Mengunggah PDF tutorial dan tugas sebagai konteks, lalu meminta ringkasan atau daftar langkah.
- Memberikan kode utuh dan menanyakan bagian mana yang belum memenuhi checklist.
- Menjalankan sendiri semua perubahan, karena AI tidak dapat menjalankan proyek ini.