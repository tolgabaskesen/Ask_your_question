import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:esoru/constants.dart';
import 'package:esoru/model/already_have_an_account_acheck.dart';
import 'package:esoru/model/background.dart';
import 'package:esoru/model/rounded_button.dart';
import 'package:esoru/model/rounded_input_field.dart';
import 'package:esoru/model/rounded_password_field.dart';
import 'package:esoru/sayfalar/anasayfa2.dart';
import 'package:esoru/sayfalar/uyeol.dart';
import 'girissayfasi.dart';

class UyeGiris extends StatefulWidget {
  @override
  _UyeGirisState createState() => _UyeGirisState();
}

class _UyeGirisState extends State<UyeGiris> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "ÜYE GİRİŞ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "Giriş",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Anasayfa2();
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UyeOl();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.01),
              IconButton(
                color: kPrimaryColor,
                icon: Icon(Icons.home),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GirisSayfasi();
                    },
                  ),
                ),
              ),  
            ],
          ),
        ),
      ),
    );
  }
}
