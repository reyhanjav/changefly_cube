import 'package:flutter/material.dart';

class Kotak extends AnimatedWidget {
  Kotak({Key key, scale})
    : super(key: key, listenable: scale);

  @override
  Widget build(BuildContext context) {
    //listenable digunakan untuk menangkap data yang secara realtime dikirimkan dari widget lain
    Animation scale = listenable;
    return Container(
        alignment: Alignment.center, 
        //memanggil asset image
        child: Image.asset(
          'assets/changefly-cube/changefly-cube.png',
          //mengkalikan nilai ukuran dengan nilai increment yang didapat dari fungsi scale
          height: 100.0 * scale.value,
          width: 100.0 * scale.value
        ),
      );
  }
}