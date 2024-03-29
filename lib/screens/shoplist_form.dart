import 'dart:convert';

import 'package:adventurers_inventory/screens/menu.dart';
import 'package:flutter/material.dart';
//Impor drawer yang sudah dibuat sebelumnya
import 'package:adventurers_inventory/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  int _price = 0;
  String _description = "";
  String _link_image = "";
  int _item_level = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

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
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Nama Item",
                labelText: "Nama Item",
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
                hintText: "Amount",
                labelText: "Amount",
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
                  return "Amount tidak boleh kosong!";
                }
                if (int.tryParse(value) == null) {
                  return "Amount harus berupa angka!";
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
                  _price = int.parse(value!);
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Image Link",
                labelText: "Image Link",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _link_image = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Image Link tidak boleh kosong!";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Item Level",
                labelText: "Item Level",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _item_level = int.parse(value!);
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Item Level tidak boleh kosong!";
                }
                if (int.tryParse(value) == null) {
                  return "Item Level harus berupa angka!";
                }
                return null;
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Kirim ke Django dan tunggu respons
                    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                    final response = await request.postJson(
                        "https://daffa-mohamad-tugas.pbp.cs.ui.ac.id/create-flutter/",
                        jsonEncode(<String, String>{
                          'name': _name,
                          'amount': _amount.toString(),
                          'price': _price.toString(),
                          'description': _description,
                          'link_image': _link_image,
                          'item_level': _item_level.toString(),
                          // TODO: Sesuaikan field data sesuai dengan aplikasimu
                        }));
                    if (response['status'] == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Produk baru berhasil disimpan!"),
                      ));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Terdapat kesalahan, silakan coba lagi."),
                      ));
                    }
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
