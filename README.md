# :camping: Adventurer's Inventory :school_satchel:
`Daffa Mohamad Fathoni 2206824161
PBP E`

# Tugas 8
<details>
<summary>Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!</summary>

`Navigator.push()` dan `Navigator.pushReplacement()` adalah dua metode yang digunakan dalam Flutter untuk mengelola navigasi antar halaman (routing).

| `Navigator.push()`| `Navigator.pushReplacement()`|
| --- | --- |
| Digunakan untuk menambahkan halaman baru ke dalam tumpukan navigasi.| Digunakan untuk mengganti halaman saat ini dengan halaman baru.|
| Mempush halaman baru ke atas halaman saat ini.| Halaman saat ini dihapus dari tumpukan dan diganti dengan halaman baru.|
| Menambahkan halaman baru ke tumpukan, sehingga pengguna dapat kembali ke halaman sebelumnya.| Berguna ketika Anda ingin mencegah pengguna untuk kembali ke halaman sebelumnya.|

Contoh untuk `Navigator.push()`
```dart
// Contoh menggunakan Navigator.push()
FlatButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HalamanBaru()),
    );
  },
  child: Text('Buka Halaman Baru'),
)
```


Contoh untuk `Navigator.pushReplacement()`
```dart
// Contoh menggunakan Navigator.pushReplacement()
FlatButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HalamanBaru()),
    );
  },
  child: Text('Ganti ke Halaman Baru'),
)

```

</details>

<details>
<summary>Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!</summary>

### 1. Single-child Layout Widgets

Berlaku untuk widget yang memiliki satu child widget di dalamnya

* Container: Digunakan untuk mengelompokkan dan mengatur widget lainnya.

```dart
Container(
  padding: EdgeInsets.all(16.0),
  margin: EdgeInsets.symmetric(vertical: 8.0),
  color: Colors.blue,
  child: Text('Isi Container'),
)

```

* Center: Menempatkan satu child widget di tengah parent widget.

```dart
Center(
  child: Text('Tengah'),
)

```

* Align: Menempatkan satu child widget dengan spesifikasi alignment.

```dart
Align(
  alignment: Alignment.bottomRight,
  child: Text('Di Bawah Kanan'),
)

```

### 2. Multi-child Layout Widgets

Widget yang dapat memiliki lebih dari satu child widget.

* Row and Column: Menempatkan child widget secara horizontal (Row) atau vertikal (Column).

```dart
Row(
  children: <Widget>[
    Icon(Icons.star),
    Text('Bintang'),
  ],
)

Column(
  children: <Widget>[
    Text('Baris 1'),
    Text('Baris 2'),
  ],
)

```

* Stack: Menumpuk child widget di atas satu sama lain.

```dart
Stack(
  children: <Widget>[
    Positioned(
      top: 10.0,
      left: 10.0,
      child: Text('Atas Kiri'),
    ),
    Positioned(
      bottom: 10.0,
      right: 10.0,
      child: Text('Bawah Kanan'),
    ),
  ],
)
```

* ListView and GridView: Menampilkan daftar atau grid dari child widget.

```dart
ListView(
  children: <Widget>[
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
    // ...
  ],
)

GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
  itemBuilder: (context, index) => MyGridItem(index),
)

```

### 3. Silver Widgets

* SilverAppBar: Membuat AppBar yang dapat di-scroll.

```dart
CustomScrollView(
  slivers: <Widget>[
    SliverAppBar(
      title: Text('AppBar yang Bisa Di-Scroll'),
      floating: true,
      pinned: true,
    ),
    // ... SliverList atau SliverGrid
  ],
)
```

*SilverList and SilverGrid: Menampilkan daftar atau grid dalam konteks ScrollView.

```dart
CustomScrollView(
  slivers: <Widget>[
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('Item $index')),
        childCount: 10,
      ),
    ),
    // ... SliverAppBar atau SliverGrid
  ],
)
```

</details>

<details>
<summary>Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!</summary>

1. TextFormField untuk Nama Produk:

**Alasan Penggunaan**: Digunakan untuk memasukkan teks, dalam hal ini, nama produk. TextFormField memberikan kemudahan untuk mengelola input teks dengan menyediakan berbagai fitur seperti validasi dan interaksi yang nyaman.

```dart
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
        return "Nama tidak boleh kosong!";
      }
      return null;
    },
  ),
),
```

2. TextFormField untuk Harga:

**Alasan Penggunaan**: Digunakan lagi untuk memasukkan harga produk. TextFormField memungkinkan input numerik dan menyediakan validasi untuk memastikan bahwa yang dimasukkan adalah angka.

```dart
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Harga",
      labelText: "Harga",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _amount = int.parse(value!);
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Harga tidak boleh kosong!";
      }
      if (int.tryParse(value) == null) {
        return "Harga harus berupa angka!";
      }
      return null;
    },
  ),
),
```

3. TextFormField untuk Deskripsi:

**Alasan Penggunaan**: Digunakan ketiga kalinya untuk memasukkan deskripsi produk. TextFormField memudahkan pengguna memasukkan teks dan menyediakan validasi sederhana untuk memastikan deskripsi tidak kosong.

```dart
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Deskripsi",
      labelText: "Deskripsi",
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
),
```
4. Elemen lain:
* Decorations: TextFormField memberikan opsi dekorasi yang kaya, seperti hintText, labelText, dan border. Ini membantu meningkatkan pengalaman pengguna dengan memberikan petunjuk visual.

* OnChanged dan State Management: Dengan menggunakan onChanged, aplikasi dapat merespons perubahan nilai di dalam TextFormField. Selain itu, kita menggunakan state management untuk menyimpan nilai dari setiap TextFormField sehingga dapat diakses saat tombol "Save" ditekan.

* Validator: TextFormField memungkinkan penerapan validator untuk memastikan bahwa data yang dimasukkan sesuai dengan aturan yang diinginkan. Validator ini membantu untuk memberikan umpan balik kepada pengguna jika input tidak sesuai dengan yang diharapkan.

</details>

<details>
<summary>Bagaimana penerapan clean architecture pada aplikasi Flutter?</summary>

Penerapan Clean Architecture pada aplikasi Flutter melibatkan strukturisasi proyek untuk memisahkan lapisan bisnis, presentasi, dan infrastruktur. Berikut adalah langkah-langkah singkatnya:

1. **Entities:**
- Definisikan entitas atau model bisnis.
- Pastikan entitas tidak bergantung pada lapisan lainnya.

2. **Use Cases (Interactors):**
- Implementasikan operasi bisnis dalam use cases.
- Pastikan use cases bersifat independen dan dapat digunakan di berbagai konteks.

3. **Interface Adapters:**
- Terapkan interface adapters untuk mengonversi data antara lapisan bisnis dan presentasi.
- Pisahkan presentasi dari logika bisnis dengan menggunakan presenter atau view model.

4. **Frameworks & Drivers:**
- Tempatkan kode infrastruktur dan kerangka kerja eksternal di lapisan ini.
- Ketergantungan dari lapisan bisnis ke lapisan ini melalui interface.

5. **Modularisasi Kode:**
- Pisahkan proyek menjadi modul-modul sesuai dengan lapisan bisnis, data, dan presentasi.

6. **Dependency Injection:**
- Gunakan Dependency Injection untuk memberikan ketergantungan antara lapisan.
- Ini memudahkan pengujian dan meningkatkan fleksibilitas dalam perubahan implementasi.

7. **Testing:**
- Gunakan unit testing untuk menguji logika bisnis dan use cases secara terpisah.
- Gunakan widget testing untuk menguji UI dan integrasi komponen.

Contoh struktur proyek yang menerapkan Clean Architecture di Flutter mungkin memiliki folder seperti *"core"* untuk lapisan bisnis, *"data"* untuk infrastruktur dan akses data, dan *"presentation"* untuk tampilan dan antarmuka pengguna. Selain itu, konsisten dalam menerapkan prinsip SOLID dan memisahkan tanggung jawab setiap lapisan adalah kunci untuk mendapatkan manfaat maksimal dari Clean Architecture.

</details>

<details>
<summary>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)</summary>

- [x] Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:

Membuat sebuah page baru dengan class ShopFormPage yang mengextend StatefulWidget

```dart
import 'package:flutter/material.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya
import 'package:adventurers_inventory/widgets/left_drawer.dart';
import 'package:adventurers_inventory/widgets/model_item.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // Tambahkan drawer yang sudah dibuat di sini
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children:[])),
      ),
    );
  }
}
```

- [x] Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.

Pada bagian ini dibuat 3 child input dengan dicontain oleh Padding, 3 input memakai TextFormField untuk Nama, Amount, dan Description

```dart
[
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
          return "Nama tidak boleh kosong!";
        }
        return null;
      },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Harga",
        labelText: "Harga",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _amount = int.parse(value!);
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Harga tidak boleh kosong!";
        }
        if (int.tryParse(value) == null) {
          return "Harga harus berupa angka!";
        }
        return null;
      },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Deskripsi",
        labelText: "Deskripsi",
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
  ),
]
```

- [x] Memiliki sebuah tombol Save.

Pada tombol Save, dibuat widget ElevatedButton yang dibungkus oleh widget Padding dan Align. Dan ketika dipencet akan memunculkan sebuah Popup bernama AlertDialog

```dart
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
          listItem.add(Item(_name, _amount, _description));
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Produk berhasil tersimpan'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama: $_name'),
                      Text('Amount: $_amount'),
                      Text('Description: $_description')
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
          _formKey.currentState!.reset();
        }
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
```

- [x] Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:

- [x] Setiap elemen input tidak boleh kosong.

Validasi input diimplementasikan dengan validator seperti dibawah

```dart
validator: (String? value) {
  if (value == null || value.isEmpty) {
    return "Deskripsi tidak boleh kosong!";
  }
  return null;
},
```

- [x] Setiap elemen input harus berisi data dengan tipe data atribut modelnya.

Sama juga untuk validasi data dengan kode `if (int.tryParse(value) == null)`

```dart
validator: (String? value) {
  if (value == null || value.isEmpty) {
    return "Harga tidak boleh kosong!";
  }
  if (int.tryParse(value) == null) {
    return "Harga harus berupa angka!";
  }
  return null;
},
```

- [x] Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

Untuk perpindahan halaman digunakan Navigator untuk berpindah-pindah, pada halaman utama digunakan push untuk menyimpan pada stack agar nantinya bisa kembali ke halaman utama

```dart
onTap: () {
  // Memunculkan SnackBar ketika diklik
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content: Text("Kamu telah menekan tombol ${item.name}!"),
        backgroundColor: item.color,
      )
    );
  // Navigate ke route yang sesuai (tergantung jenis tombol)
  if (item.name == "Tambah Item") {
    // Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopFormPage(),
          ));
  }
},
```

- [x] Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

Pada AlertDialog ini bekerja sebagai popup yang akan menunjukkan bahwa Produk sukses diinput beserta informasi2 yang ada. 

```dart
return AlertDialog(
  title: const Text('Produk berhasil tersimpan'),
  content: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nama: $_name'),
        Text('Amount: $_amount'),
        Text('Description: $_description')
      ],
    ),
  ),
  actions: [
    TextButton(
      child: const Text('OK'),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ],
);
```

- [x] Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:

```dart
import 'package:adventurers_inventory/items_list.dart';
import 'package:flutter/material.dart';
import 'package:adventurers_inventory/menu.dart';
// Impor halaman ShopFormPage jika sudah dibuat
import 'package:adventurers_inventory/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Shopping List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat seluruh keperluan belanjamu di sini!",
                    //Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    ),
              ],
            ),
          ),
          // Bagian routing
        ],
      ),
    );
  }
}
```

- [x] Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.

Untuk pilihan opsi pada drawer ini bekerja sebagai navigator pada drawer maka digunakan Navigator dan pushReplacement untuk langsung mengganti halaman tersebut

```dart
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Halaman Utama'),
  // Bagian redirection ke MyHomePage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Tambah Item'),
  // Bagian redirection ke ShopFormPage
  onTap: () {
    /*
    Buatlah routing ke ShopFormPage di sini,
    setelah halaman ShopFormPage sudah dibuat.
    */
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ShopFormPage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.checklist),
  title: const Text('Lihat Item'),
  // Bagian redirection ke ItemsListPage
  onTap: () {
    /*
    Buatlah routing ke ItemsListPage di sini,
    setelah halaman ItemsListPage sudah dibuat.
    */
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ItemsListPage(),
        ));
  },
),
```

- [x] Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.

Diimplementasikann `Navigator.pushReplacement` untuk menggantikan halaman ke HomePage

```dart
onTap: () {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ));
},
```

- [x] Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

Diimplementasikan yang sama untuk perpindahan halaman ke input form dengan pushReplacement

```dart
onTap: () {
  /*
  Buatlah routing ke ShopFormPage di sini,
  setelah halaman ShopFormPage sudah dibuat.
  */
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ShopFormPage(),
      ));
},
```


</details>

<hr>

# Tugas 7

<details>
<summary>Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?</summary>

<br>

`state` pada flutter adalah data atau variabel yang digunakan untuk membangun UI (User Interface) di flutter yang dapat berubah selama waktu aplikasi berjalan. `state` merujuk kepada data yang memengaruhi tampilan atau perilaku dari suatu widget. State adalah salah satu konsep utama dalam pembuatan aplikasi Flutter.

Terdapat dua jenis state:

|Stateless Widget|Stateful Widget|
| --- | --- |
|tidak memiliki data yang berubah selama masa hidupnya |data yang dapat berubah selama masa hidupnya |
|dapat memanggil method build sekali ketika widget pertama kali dimuat | dapat memanggil method build ulang ketika ada perubahan state dengan menggunakan method setState |
|tidak memerlukan class tambahan untuk mengatur state | memerlukan class tambahan yang meng-extend State untuk mengatur state|
|menampilkan data yang sifatnya statis atau tidak perlu adanya perubahan nilai | menampilkan data yang sifatnya dinamis atau membutuhkan perubahan nilai|

#### Contoh kode Stateless Widget
```dart
class MyApp extends statelessWidget{
    @override
    Widget build(BuildContext context){
        return MaterialApp(
            ...
        )
    }
}
```

#### Contoh kode Stateful Widget
```dart
class MyHomePage extends statefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();
}
```
</details>

<details>
<summary>Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.</summary>

- `MaterialApp`: Ini adalah widget yang digunakan untuk menginisialisasi aplikasi Flutter, dan di dalamnya, Anda dapat mengatur konfigurasi global seperti tema.

- `Scaffold`: Ini adalah widget yang memberikan kerangka dasar untuk aplikasi Anda, termasuk AppBar, FloatingActionButton, dan lain-lain.

- `AppBar`: Widget ini digunakan untuk menampilkan bilah atas (app bar) yang berisi judul aplikasi.

- `SingleChildScrollView`: Widget ini digunakan untuk membuat area yang dapat di-scroll ketika kontennya lebih besar dari layar.

- `Padding`: Widget ini digunakan untuk memberikan jarak (padding) di sekitar kontennya.

- `Column`: Widget ini digunakan untuk menampilkan child widgets secara vertikal dalam kolom.

- `GridView.count`: Widget ini digunakan untuk menampilkan item dalam grid dengan jumlah kolom yang telah ditentukan.

- `InkWell`: Widget ini digunakan untuk membuat area responsif terhadap sentuhan (tap) dengan efek splash.

- `SnackBar`: Widget ini digunakan untuk menampilkan pesan singkat (biasanya sebagai respons atas tindakan pengguna) di bagian bawah layar.

- `Material`: Ini adalah widget yang mengelilingi konten card untuk memberikan efek Material Design.

- `Container`: Widget ini digunakan untuk mengelilingi ikon dan teks dalam card.

- `Icon`: Widget ini digunakan untuk menampilkan ikon.

- `Text`: Widget ini digunakan untuk menampilkan teks.

</details>

<details>
<summary>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)</summary>

<br>

- [x] Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

1. Membuat project Flutter baru dengan command `flutter create adventurers_inventory` dan dilanjutkan `cd adventurers_inventory`

2. Inisiasi git dengan `git init` dan menyambungkan dengan repository remote di GitHub dengan `git remote add origin https://github.com/fathonidf/adventurers-inventory-mobile.git`

3. Menjalankan project Flutter dengan `flutter run`

- [x] Membuat tiga tombol sederhana dengan ikon dan teks untuk:

1. Pertama-tama, membuat `main.dart` sebagai inisiasi MyApp di awal dengan kode berikut

```dart
import 'package:flutter/material.dart';
import 'package:adventurers_inventory/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

Pada kode di atas, menjadikan home dengan memanggil fungsi dari class `MyHomePage` yang berada pada `menu.dart`. Agar dapat diakses, maka file diimport dengan `import 'package:adventurers_inventory/menu.dart';`

2. Membuat dan mendefinisikan suatu class untuk barang-barang yang akan dijual sebagai berikut

```dart
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```

attribute tambahan yaitu color untuk pengerjaan bonus pada Tugas 7 ini.

3. Kemudian menambahkan class `MyHomePage` yang merupakan `StatelessWidget` kode pada `menu.dart` sebagai berikut

```dart
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.red),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.yellow.shade600),
    ShopItem("Logout", Icons.logout, Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adventurer\'s Inventory ',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Inventory Store', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

Kode tersebut membuat suatu home page container dengan menampilkan Widget button-button dengan judul `"Inventory Store"`.
Pada `final List<ShopItem> items` menginstansiasi object baru dengan menambahkannya pada list `items` meliputi `"Lihat Item"`, `"Tambah Produk"`, dan `"Logout"`.

Penambahan instansiasi attribute color untuk bonus tugas 7

4. Selanjutnya membuat widget stateless baru untuk menampilkan `ShopCard` tersebut

```dart
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!"),
                backgroundColor: item.color,
              )
            );
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          color: item.color,
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

Card tersebut akan ditampilkan dengan iterasi oleh MyHomePage.

- [x] Melihat daftar item `Lihat Item`

```dart
    final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.red),
];
```

- [x] Menambah item `Tambah Item`

```dart
    final List<ShopItem> items = [
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.yellow.shade600),
];
```

- [x] Logout `Logout`

```dart
    final List<ShopItem> items = [
    ShopItem("Logout", Icons.logout, Colors.green),
];
```

- [x] Memunculkan Snackbar dengan tulisan:
    - [x] "Kamu telah menekan tombol Lihat Item" ketika tombol `Lihat Item` ditekan.
    - [x] "Kamu telah menekan tombol Tambah Item" ketika tombol `Tambah Item` ditekan.
    - [x] "Kamu telah menekan tombol Logout" ketika tombol `Logout` ditekan.

    Hal tersebut dilakukan dengan menjadikannya responsive melalui `onTap: ()` dan menambahkan `ScaffoldMessenger.of(context)`
    ```dart
    onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!"),
                backgroundColor: item.color,
              )
            );
        },
    ```

    Karena setiap Card dimunculkan secara iterasi dari `MyHomePage`, maka tiap Card dapat mengakses item yang diinisiasi oleh constructor sehingga mengkonkatenasinya dengan `${item.name}`

- [x] Melakukan add-commit-push ke GitHub.

```
git add .

git commit -m "Selesai Tugas 7"

git push -u origin main
```

</details>