# MyPortofolio Mobile

Aplikasi mobile berbasis Flutter untuk portofolio pribadi. Aplikasi ini adalah bentuk mobile dari website portofolio yang dikerjakan pada paruh pertama semester (repositori terpisah).

| | |
|---|---|
| Nama | Rona Mahira |
| NPM | 2506657314 |
| Kelas | PBP E |

## Deskripsi

Aplikasi MyPortofolio Mobile memiliki halaman utama yang menampilkan identitas pengguna dalam tiga kartu informasi, serta menu aksi untuk mengakses fitur portofolio. Aplikasi juga menyediakan formulir untuk menambahkan data proyek dan pendidikan, lengkap dengan input, validasi, serta navigasi antarhalaman melalui Drawer.

Saat ini aplikasi masih bersifat lokal dan belum terhubung dengan backend Django maupun database. Data yang dimasukkan ke formulir belum disimpan secara permanen, melainkan ditampilkan melalui dialog konfirmasi setelah validasi berhasil.

## Fitur

1. Tiga kartu informasi (`InfoCard`) di bagian atas halaman: NPM, Name, dan Class
2. Menu aksi (`ItemCard`) dalam kisi 3 kolom: Lihat Proyek, Tambah Proyek, dan Logout
3. Warna latar yang berbeda untuk setiap tombol, ditentukan lewat atribut `color` pada model `ItemHomepage`
4. SnackBar dengan pesan `Kamu telah menekan tombol [Nama Tombol]!` ketika tombol ditekan
5. Form tambah proyek (ProjectFormPage) untuk memasukkan nama proyek, deskripsi, kategori proyek, teknologi yang digunakan, dan tautan proyek (opsional).
6. Form tambah pendidikan (EducationFormPage) untuk memasukkan nama institusi, jenjang pendidikan, deskripsi, tanggal mulai, dan tanggal selesai (opsional).
7. Validasi formulir memastikan input wajib telah diisi dan memenuhi ketentuan sebelum menampilkan dialog konfirmasi.
8. Date picker memungkinkan pengguna memilih tanggal mulai dan tanggal selesai pendidikan melalui kalender.
9. Drawer navigasi (LeftDrawer) menyediakan navigasi menuju halaman Home, Add Project, dan Add Education.
10. Dialog konfirmasi menampilkan ringkasan data yang telah diisi setelah formulir berhasil divalidasi.

## Teknologi

- Flutter dan bahasa Dart
- Material 3

## Struktur Aplikasi

- main.dart -> Entry point aplikasi dan konfigurasi MaterialApp serta tema.
- screens/menu.dart -> Halaman utama, kartu informasi (InfoCard), dan model menu ItemHomepage.
- screens/project_form.dart -> Formulir penambahan proyek.
- screens/education_form.dart -> Formulir penambahan pendidikan.
- widgets/left_drawer.dart -> Komponen Drawer untuk navigasi halaman.
- widgets/project_card.dart -> Widget kartu aksi beserta interaksi dan navigasinya.

## Progres

| Tahap | Yang dikerjakan |
|---|---|
| Tutorial 08 | Setup Flutter dan Android Studio, proyek `myportofolio_mobile`, `menu.dart` dipisah dari `main.dart`, `MyHomePage` menjadi `StatelessWidget`, `InfoCard`, `ItemCard` dengan SnackBar, dan tema warna |
| Tugas 7 | Identitas pribadi pada `InfoCard`, atribut `color` pada `ItemHomepage` sehingga setiap kartu memiliki warna latar unik, serta dokumentasi proyek |
| Tutorial 09 | Implementasi navigasi menggunakan Navigator, Drawer melalui LeftDrawer, formulir tambah proyek, validasi input menggunakan Form dan GlobalKey<FormState>, serta dialog konfirmasi setelah data berhasil divalidasi |
| Tugas 8 | Implementasi navigasi menggunakan Navigator, Drawer melalui LeftDrawer, formulir tambah pendidikan, validasi input menggunakan Form dan GlobalKey<FormState>, date picker untuk tanggal pendidikan, serta dialog konfirmasi setelah data berhasil divalidasi |

## Pertanyaan Reflektif

### Tugas 7

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

### Tugas 8
1. Navigator.push() digunakan untuk membuka halaman baru di atas halaman saat ini, di mana halaman sebelumnya tetap tersimpan di stack sehingga pengguna dapat kembali menggunakan tombol Back. Sedangkan Navigator.pushReplacement() digunakan untuk membuka halaman baru sekaligus menggantikan halaman yang sedang aktif, sehingga halaman sebelumnya tidak lagi menjadi halaman yang dapat kembali melalui Back. Terakhir, Navigator.pop digunakan untuk menutup halaman yang sedang aktif dan kembali ke halaman sebelumnya di dalam navigation stack.
Untuk membuka formulir dari kartu aksi, metode ynag digunakan adalah Navigator.push() karena formulir dibuka sebagai halaman baru tanpa menghilangkan halaman utama. Setelah formulir selesai digunakan, pengguna masih dapat kembali ke halaman sebelumnya.
Opsi Home pada Drawer dapat menggunakan Navigator.pushReplacement agar pengguna dapat kembali ke halaman utama dengan mengganti halaman yang sedang dibuka. Dengan demikian, pengguna tidak perlu melewati halaman sebelumnya satu per satu ketika ingin kembali ke Home.
2. - Scaffold mengatur struktur utama halaman, seperti bagian header, konten, dan navigasi
- AppBar berfungsi sebagai header halaman yang menampilkan judul serta menyediakan akses ke navigasi atau aksi tertentu
- Drawer menyediakan menu navigasi tambahan yang dapat dibuka dari sisi layar, sehingga pengguna dapat berpindah halaman dengan lebih mudah
Contoh penerapannya adalah pada penggunaan warna utama dari ThemeData melalui Theme.of(context).colorScheme.primary. Warna tersebut dapat digunakan pada AppBar di halaman utama maupun formulir, sehingga keduanya memiliki warna header yang seragam dan tetap mengikuti tema portofolio tanpa perlu menentukan warna secara berulang.
3. Tata letak formulir dipilih agar setiap input dapat ditampilkan secara terstruktur, mudah dibaca, dan mudah digunakan oleh pengguna. 
Widget pengatur jarak seperti Column berperan menyusun field formulir secara vertikal, sedangkan Padding dan SizedBox berperan mengatur jarak antarfield maupun jarak antara komponen dengan tepi layar agar tampilan tidak terlalu rapat. Sementara itu, Widget penggulir seperti SingleChildScrollView berperan agar seluruh isi formulir tetap dapat diakses dengan menggulir layar, sehingga mencegah field atau tombol yang berada di bagian bawah terpotong ketika konten melebihi layar.
4. - GlobalKey<FormState> mengidentifikasi dan mengakses state dari widget Form, sehingga form dapat dikontrol dan diperiksa dari bagian kode lain, salah satunya ketika tombol Simpan ditekan.
- validator memeriksa apakah input pengguna memenuhi ketentuan tertentu, jika tidak valid akan mengembalikan pesan kesalahan yang ditampilkan ke pengguna
- validate() menjalankan validator ke field-field yang berada dalam Form dan mengembalikan true atau false tergantung inputnya valid atau tidak
Contoh nilai yang ditolak adalah field nama proyek yang dibiarkan (field tersebut wajib untuk diisi). Pemilihan jenis input atau papan ketik belum cukup untuk menjamin validitas data karena pengaturan tersebut hanya membantu menentukan jenis karakter atau papan ketik yang ditampilkan kepada pengguna dan bukan memeriksa seluruh aturan input. Jadi, pengguna masih dapat memasukkan data yang tidak sesuai dengan ketentuan.

## Deklarasi Penggunaan AI

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

### Tugas 8

**Alat:** Claude

**Bagian yang dibantu AI:**
1. Merangkum PDF Tutorial 09: navigasi flutter, formulir, dan validasi input.
2. Menguraikan spesifikasi Tugas 8 menjadi daftar perubahan dan urutan pengerjaan.
3. Meninjau semua file dart untuk menunjukkan bagian yang belum memenuhi checklist.
4. Membantu memberikan langkah perbaikan untuk kode yang error.

**Strategi prompting:**
- Mengunggah PDF tutorial dan tugas sebagai konteks, lalu meminta ringkasan atau daftar langkah.
- Memberikan kode utuh dan menanyakan bagian mana yang belum memenuhi checklist.
- Memberikan potongan kode yang error untuk membantu mengidentifikasi kesalahan dan perbaikan.