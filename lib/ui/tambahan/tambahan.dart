import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:changefly_cube/component/komponen_Tambahan/Kotak.dart';

class Tambahan extends StatefulWidget {
  Tambahan({Key key}) : super(key: key);

  _TambahanState createState() => _TambahanState();
}

class _TambahanState extends State<Tambahan> with TickerProviderStateMixin {

  //define variable
  AnimationController animationController;
  Animation scale;

  @override
  void initState() {
    super.initState();
    //menjalankan controller dan fungsi animasi saat memasuki halaman ini, durasi 
    animationController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this
    );

    //fungsi animasi scale + transisi inelasticout
    scale = Tween<double>(begin: 0.0 , end: 12.0,).animate(CurvedAnimation(parent: animationController,curve: Curves.elasticInOut));

    //cek status fungsi. Jika animasi selesai dikerjakan, lakukan pengulangan
    scale.addStatusListener((status) {
      if (status != AnimationStatus.completed) {
        animationController.forward();
      } 
      else {
        //delay fungsi selama 0.5 detik
        Future.delayed(const Duration(milliseconds: 500), () {
          animationController.reverse();
        });
      }
    });

    //inisiasi awal untuk menjalankan animasi
    animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Kotak(scale: scale)
      );
  }

  //dispose digunakan untuk membersihkan halaman setelah fungsi selesai dijalankan
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}
