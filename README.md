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
   1. Contoh: Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
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

## Tugas Individu 8
### Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Method `Navigator.push()` adalah method yang menambahkan */suatu route*/ ke dalam */stack route*/ yang dikelola oleh `Navigator` tanpa menghapus */route*/ lama sedangkan `Navigator.pushReplacement()` sama dengan `Navigator.push()` tetapi dengan menghapus */route*/ lama.

### Bagaimana kamu memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
`Scaffold` sebagai penyedia struktur yang memastikan setiap layar memiliki "pondasi" yang sama. Ini menangani tugas-tugas tata letak (layout) dasar seperti menempatkan `AppBar` di bagian atas dan `BottomNavigationBar` di bagian bawah secara otomatis.

`AppBar` adalah bilah horizontal di bagian atas halaman yang biasanya menampilkan judul halaman, tombol navigasi utama (seperti tombol "kembali otomatis), dan terkadang tombol tindakan lainnya. Ini memberikan identitas visual yang konsisten di setiap layar di seluruh aplikasi agar pengguna selalu tahu di mana menemukan judul halaman atau navigasi kembali.

`Drawer` adalah panel navigasi yang slide masuk dari sisi layar (biasanya kiri). Ini sebagai navigasi global terpusat yang bisa dipelajari pengguna dan mengurangi kekacauan layar utama karena `Drawer` menempatkan tautan navigasi sekunder atau merupakan widget yang jarang digunakan.

### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Kelebihan `Padding`, `SingleChildScrollView`, dan `ListView` sebagai berikut:
`Padding` dapat meningkatkan keterbacaan dan estetika aplikasi karena teks atau elemen UI lainnya tidak akan terlihat menumpuk atau menempel pada tepi layar/kontainer, jika diberikan spasi dengan tepat.

`SingleChildScrollView` adalah kemampuan unuk membuat satu area konten dapat digulit jika ukurannya melebihi ruang layar yang tersedia yang mengatasi kesalahan "pixel overflow".

`ListView` meningkatkan efisiensi dalam menangani daftar yang panjang atau tidak terbatas. Karena ia hanya me-*/render*/ item-item yang sedang terlihat di layar, bukan seluruh daftar sekaligus.
Contoh `Padding`:
```
Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ]
            ),
          ]
        )
      )
```

Contoh `SingleChildScrollView`:
```
SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Nama Produk ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama Produk tidak boleh kosong!";
                    } else if (value.length > 255) {
                      return "Nama Produk terlalu panjang";
                    }
                    return null;
                  },
                ),
              )
            ]
          )
)
```


Contoh `ListView`:

```
ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Text(
                  'Football Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Seluruh produk bola dan baju di sini!",
                  // Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection pke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_business),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ProductFormPage
            onTap: () {
              Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ProductFormPage(),
        ));
            },
          ),
        ],
      )
```

### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Dengan menggunakan sistem */theming*/ internal Flutter, terutama kelas **`ThemeData`** dan **`ColorScheme`**.