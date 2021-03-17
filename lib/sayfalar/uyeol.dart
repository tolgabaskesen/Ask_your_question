import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:esoru/model/already_have_an_account_acheck.dart';
import 'package:esoru/model/background2.dart';
import 'package:esoru/model/rounded_button.dart';
import 'package:esoru/model/rounded_input_field.dart';
import 'package:esoru/model/rounded_password_field.dart';
import 'package:esoru/sayfalar/anasayfa2.dart';
import 'package:esoru/sayfalar/girissayfasi.dart';
import 'package:esoru/sayfalar/uyegiris.dart';
import '../constants.dart';

class UyeOl extends StatefulWidget {
  
  @override
  _UyeOlState createState() => _UyeOlState();
}

class _UyeOlState extends State<UyeOl> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background2(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "ÜYE OL",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
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
                text: "ÜYE OL",
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
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UyeGiris();
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
