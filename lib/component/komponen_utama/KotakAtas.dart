import 'package:flutter/material.dart';

class KotakAtas extends AnimatedWidget {
  KotakAtas({Key key, translasi})
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
        padding: EdgeInsets.only(top: 100 + translasi.value), //pada baris ini komponen akan turun ke bawah sering bertambahnya nilai padding saat increment
        //memanggil asset image
        child: Image.asset(
          'assets/changefly-cube/changefly-cube-top.png',
          height: 112.0,
        ),
      ),
    );
  }
}