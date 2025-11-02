# football\_shop

## Tugas Individu 7

### Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree pada Flutter adalah tree yang merepresentasikan semua komponen-komponen di proyeknya. Hubungan parent-child antar widget adalah fondasi utama dalam membangun antarmuka (UI).

### Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

1. Root berfungsi sebagai fondasi yang paling utama dalam proyek ini.

2. MyApp berfungsi sebagai fondasi yang paling utama untuk membangun aplikasi.

3. MaterialApp berfungsi sebagai fondasi yang paling utama untuk membangun antarmuka (UI).

4. MyHomePage berfungsi sebagai fondasi yang paling utama untuk halaman ini.

5. Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.

6. AppBar adalah bagian atas halaman yang menampilkan judul.

7. Text adalah komponen utama yang berfungsi menampilkan teks di aplikasi.

8. Padding adalah ruang kosong di widgetnya.

9. Column adalah menampilkan beberapa InfoCard secara horizontal.

10. Row adalah menampilkan beberapa InfoCard secara horizontal.

11. InfoCard adalah berisi informasi tentang kartu 

12. Card adalah komponen UI yang berfungsi sebagai wadah untuk menampilkan konten

13. Container adalah widget serbaguna untuk membungkus dan menata widget lainnya.

14. Column adalah widget tata letak yang mengatur widget anak-anaknya secara vertikal.

15. SizedBox adalah widget yang digunakan untuk membuat area dengan ukuran yang tetap.

16. GridView adalah tampilan berbentuk kotak.

17. ItemCard adalah widget yang berfungsi sebagai kontainer untuk menampilkan informasi terkait dalam satu unit.

18. Material adalah sekumpulan komponen visual yang menerapkan Desain Material Google untuk membuat antarmuka yang menarik.

19. Inkwell adalah widget desain material yang memungkinkan Anda membuat elemen UI menjadi interaktif.

20. Center adalah widget yang membuat widget yang berfungsi untuk memosisikan widget anaknya (child) ke tengah secara horizontal maupun vertikal.

21. Icon adalah widget yang menampilkan gambar atau icon

### Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

Fungsinya adalah menyediakan fondasi yang paling utama untuk mengembangkan antarmuka pengguna (UI) yang sering digunakan sebagai widget root karena widget tersebut sama pentingnya dengan widget root.

### Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget adalah widget yang tampilannya tidak berubah sama sekali yang cocok digunakan ketika elemen UI tersebut tidak berubah sedangkan StatefulWidget adalah widget yang tampilannya berubah yang cocok ketika elemen UI tersebut berubah-ubah.

### Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext di Flutter adalah objek yang merepresentasikan lokasi sebuah widget dalam pohon widget (widget tree). Dalam metode build, BuildContext adalah argumen yang secara otomatis disediakan oleh framework Flutter, memungkinkan widget untuk mengetahui posisinya dan berinteraksi dengan elemen lain di pohonnya. 

### Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
"hot reload" di Flutter merupakam proses yang hanyalah mengubah programnya tanpa mengubah status aplikasi seperti semula sedangkan "hot restart" di Flutter merupakan proses mengubah program dan juga mengubah status aplikasinya seperti semula.

### Jelaskan bagaimana kamu menambahkan navigasi untuk berpindah antar layar di aplikasi Flutter.
1. Buat widget untuk setiap layar. Masing-masing layar dalam aplikasi Anda harus berupa widget terpisah, seperti Screen1 dan Screen2.
2. Gunakan Navigator.push() untuk pindah ke layar baru. Panggil metode ini di dalam onPressed atau fungsi lain yang memicu navigasi. Anda perlu menyediakan BuildContext dan jenis rute yang ingin ditampilkan, misalnya MaterialPageRoute.
   1. Contoh: Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));.
3. Gunakan Navigator.pop() untuk kembali ke layar sebelumnya. Panggil metode ini di layar tujuan untuk menutupnya dan kembali ke layar sebelumnya, yang akan muncul kembali dari tumpukan.
Contoh: Navigator.pop(context);. 
Contoh penggunaan Navigator.push()
```
// Di dalam widget Screen1, misalnya pada sebuah tombol
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Screen2()),
  );
}
```
Contoh penggunaan Navigator.pop()
```
// Di dalam widget Screen2, misalnya pada sebuah tombol atau ikon kembali
onPressed: () {
  Navigator.pop(context);
}
```
