import 'package:esoru/sayfalar/deneme.dart';
import 'package:flutter/material.dart';
import 'package:esoru/sayfalar/anasayfa2.dart';
import 'package:esoru/sayfalar/sorular.dart';
import 'package:esoru/sayfalar/uyegiris.dart';
import 'package:esoru/sayfalar/uyeol.dart';
import 'package:esoru/sayfalar/internetconnect.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "HoşGeldiniz",
      initialRoute: '/',
      routes: {
        '/': (context) => Anasayfa2(),
        '/Anasayfa': (BuildContext context) => Anasayfa2(),
        '/UyeOl': (BuildContext context) => Deneme(),
        '/Deneme': (BuildContext context) => Deneme(),
        '/UyeGiris': (BuildContext context) => Deneme(),
        '/Sorular': (BuildContext context) => Sorular(),
        '/Internet': (BuildContext context) => InternetConnect(),

      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
