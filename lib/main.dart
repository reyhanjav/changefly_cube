import 'package:flutter/material.dart';

import 'package:changefly_cube/ui/utama/utama.dart';
import 'package:changefly_cube/ui/tambahan/tambahan.dart';

void main() => runApp(new Changefly());

class Changefly extends StatefulWidget {
  @override
  _ChangeflyState createState() => _ChangeflyState();
}

class _ChangeflyState extends State<Changefly> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    //inisiasi jumlah tab yang akan digunakan
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    //hilangkan komponen dari halaman setelah tidak digunakan lagi
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Changefly Cube",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Animasi Changefly'),
          backgroundColor: Colors.red[800],
          //inisiasi tampilan tab bar
          bottom: TabBar(
            controller: controller,
            tabs: <Tab>[
              Tab(text: 'Utama'),
              Tab(text: 'Tambahan'),
            ]
          ),
        ),
        //halaman yang akan ditampilkan saat menekan salah satu tombol tabbar
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            Utama(),
            Tambahan()
          ]
        ),
        ),
      debugShowCheckedModeBanner: false,

    );
  }
}