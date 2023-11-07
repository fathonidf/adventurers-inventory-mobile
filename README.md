# :camping: Adventurer's Inventory :school_satchel:
`Daffa Mohamad Fathoni 2206824161
PBP E`

# Tugas 7

<details>
<summary>**Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**</summary>

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
<summary>**Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.**</summary>

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