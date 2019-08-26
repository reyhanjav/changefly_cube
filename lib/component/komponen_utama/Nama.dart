import 'package:flutter/material.dart';

class Nama extends AnimatedWidget {
  Nama({Key key, translasi})
    : super(key: key, listenable: translasi);

  @override
  Widget build(BuildContext context) {
    //listenable digunakan untuk menangkap data yang secara realtime dikirimkan dari widget lain
    Animation translasi = listenable;
    return Center(
      child: Opacity(
        //.value berperan sebagai increment dari 0 hingga 100 yang didapat dari fungsi translasi
        opacity: translasi.value/100,
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 440.0 - translasi.value), //pada baris ini komponen akan naik ke atas dengan berkurangnya nilai padding
          //memanggil asset image
          child: Image.asset(
            'assets/changefly-cube/changefly-name.png',
            width: 224.0,
          ),
        ),
      )
    );
  }
}