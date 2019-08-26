import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:changefly_cube/component/komponen_Utama/KotakAtas.dart';
import 'package:changefly_cube/component/komponen_Utama/KotakKanan.dart';
import 'package:changefly_cube/component/komponen_Utama/KotakKiri.dart';
import 'package:changefly_cube/component/komponen_Utama/Nama.dart';

class Tambahan extends StatefulWidget {
  Tambahan({Key key}) : super(key: key);

  _TambahanState createState() => _TambahanState();
}



class _TambahanState extends State<Tambahan> with TickerProviderStateMixin {

  //define variable
  AnimationController animationController;
  Animation translasi;

  @override
  void initState() {
    super.initState();
    //menjalankan controller dan fungsi animasi saat memasuki halaman ini, durasi 
    animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this
    );

    //define fungsi untuk menjalankan animasi translasi
    translasi = Tween(begin: 0.0 , end: 100.0).animate(animationController);

    //cek status fungsi. Jika animasi selesai dikerjakan, lakukan pengulangan
    translasi.addStatusListener((status) {
      if (status != AnimationStatus.completed) {
        animationController.forward();
      } 
      else {
        //delay fungsi selama 1.5 detik
        Future.delayed(const Duration(milliseconds: 1500), () {
          animationController.repeat();
        });
      }
    });

    //inisiasi awal untuk menjalankan animasi
    animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          children: <Widget>[
            KotakAtas(translasi: translasi),
            KotakKanan(translasi: translasi),
            KotakKiri(translasi: translasi),
            Nama(translasi: translasi),
          ],
        ),
      );
  }

  //dispose digunakan untuk membersihkan halaman setelah fungsi selesai dijalankan
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}
