import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatelessWidget {
  //final primaryColor = const Color(0xff7abb3b);
  final primaryColor = const Color(0xFF6F35A5);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * 0.10),
                Text(
                  "Hoş Geldiniz",
                  style: TextStyle(fontSize: 44, color: primaryColor),
                ),
                SizedBox(height: _height * 0.05),
                Image.asset(
                  "assets/images/logedulogo.png",
                ),
                SizedBox(height: _height * 0.05),
                AutoSizeText(
                  "LogEDU",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: _height * 0.05),
                RaisedButton(
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                    child: Text(
                      "Üye Girişi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        //fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed('/UyeGiris')
                      .then((value) => Navigator.pop(context)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
