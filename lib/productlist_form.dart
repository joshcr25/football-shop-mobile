import 'package:flutter/material.dart';
// Impor drawer yang sudah dibuat sebelumnya
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:flutter/services.dart'; // Import library-nya agar bisa memfilter input menjadi angka saja

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 200000;
  String _description = ""; // default
  String _category = "jersey"; // default
  String _thumbnail = "";
  int _quantity = 1;
  String _brand = "";
  int _yearOfManufacture = 2025;
  int _yearOfProduct = 2025;
  bool _isFeatured = false; // default

  final List<String> _categories = ['jersey', 'bola'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Product Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        child: SingleChildScrollView(
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga Produk",
                    labelText: "Harga Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String value) {
                    int? parsedValue = int.tryParse(value);
                    if (parsedValue != null) {
                      _price = parsedValue;
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter
                        .digitsOnly, // Hanya mengizinkan angka saja
                  ],
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga produk tidak boleh kosong!";
                    } else if (int.parse(value) <= 0) {
                      return "Harga produk tidak boleh negatif!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }

                    return null;
                  },
                ),
              ), // === Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map(
                        (cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat[0].toUpperCase() + cat.substring(1)),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ), // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail (opsional)",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                  validator: (String? value) {
                    String pattern =
                        r'^(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?$';
                    RegExp regExp = RegExp(pattern);
                    if (!regExp.hasMatch(value!)) {
                      return "URL yang dimasukkan tidak valid";
                    }
                  },
                ),
              ), // === Kuantitas Produk ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Kuantitas Produk",
                    labelText: "Kuantitas Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String value) {
                    int? parsedValue = int.tryParse(value);
                    if (parsedValue != null) {
                      _quantity = parsedValue;
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter
                        .digitsOnly, // Hanya mengizinkan angka saja
                  ],
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Kuantitas Produk tidak boleh kosong!";
                    } else if (int.parse(value) <= 0) {
                      return "Kuantitas produk harus positif!";
                    }
                    return null;
                  },
                ),
              ), // === Brand ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Merek Produk",
                    labelText: "Merek Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _brand = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Merek Produk tidak boleh kosong!";
                    } else if (value.length > 60) {
                      return "Merek Produk terlalu panjang";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Tahun Pembuatan Produk",
                    labelText: "Tahun Pembuatan Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter
                        .digitsOnly, // Hanya mengizinkan angka saja
                  ],
                  onChanged: (String value) {
                    int? parsedValue = int.tryParse(value);
                    if (parsedValue != null) {
                      _yearOfManufacture = parsedValue;
                    }
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Tahun Pembuatan Produk tidak boleh kosong!";
                    } else if (int.parse(value) <= 0) {
                      return "Tahun Pembuatan Produk harus positif!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Tahun Produk Muncul Di Toko Bola",
                    labelText: "Tahun Produk Muncul Di Toko Bola",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter
                        .digitsOnly, // Hanya mengizinkan angka saja
                  ],
                  onChanged: (String value) {
                    int? parsedValue = int.tryParse(value);
                    if (parsedValue != null) {
                      _yearOfProduct = parsedValue;
                    }
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Tahun Kemunculan Produk tidak boleh kosong!";
                    } else if (int.parse(value) <= 0) {
                      return "Tahun Kemunculan produk harus positif!";
                    }
                    return null;
                  },
                ),
              ), // === Is Featured ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text(
                    "Tandai sebagai Produk Unggulan (Featured)",
                  ),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ), // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil disimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Judul: $_name'),
                                    Text('Harga: $_price'),
                                    Text('Harga: $_description'),
                                    Text('Kategori: $_category'),
                                    Text('Thumbnail: $_thumbnail'),
                                    Text('Jumlah: $_quantity'),
                                    Text('Merek: $_brand'),
                                    Text(
                                      'Tahun Pembuatan: $_yearOfManufacture',
                                    ),
                                    Text(
                                      'Tahun Kemunculan Produk di Toko: $_yearOfProduct',
                                    ),
                                    Text(
                                      'Unggulan: ${_isFeatured ? "Ya" : "Tidak"}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
