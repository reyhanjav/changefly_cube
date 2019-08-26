import 'package:flutter/material.dart';

class KotakKanan extends AnimatedWidget {
  KotakKanan({Key key, translasi})
    : super(key: key, listenable: translasi);

  @override
  Widget build(BuildContext context) {
    //listenable digunakan untuk menangkap data yang secara realtime dikirimkan dari widget lain
    Animation translasi = listenable;
    return Opacity(
      //.value berperan sebagai increment dari 0 hingga 100 yang didapat dari fungsi translasi
      opacity: translasi.value/100,
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 200.0, left: 100 - translasi.value), //pada baris ini komponen akan bergerak ke tengah dengan mengurangi padding left
        //memanggil asset image
        child: Image.asset(
          'assets/changefly-cube/changefly-cube-right.png',
          height: 112.0,
        ),
      ),
    );
  }
}