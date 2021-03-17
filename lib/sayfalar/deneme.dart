import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:esoru/model/rounded_password_field.dart';
import 'package:esoru/model/rounded_role_field.dart';
import 'dart:convert';
import 'package:esoru/services/vtServices.dart';
import 'package:esoru/model/rounded_input_field.dart';
import 'package:esoru/model/rounded_mail_field.dart';

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  var data;
  String username, password, mail, role;
  

  @override
  void initState() {
    veriGetir();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.center,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedInputField(
                    onChanged: (value) => username = value,
                    hintText: "Kullanıcı Adı"),
                SizedBox(
                  height: 20,
                ),
                RoundedPasswordField(onChanged: (value) => password = value),
                SizedBox(
                  height: 20,
                ),
                RoundedMailField(
                    onChanged: (value) => mail = value, hintText: "E-Mail"),
                SizedBox(
                  height: 20,
                ),
                RoundedRoleField(
                    onChanged: (value) => role = value,
                    hintText: "Rolünüz(1=Admin, 0=Kullanıcı)"),
                SizedBox(
                  height: 20,
                ),
                Text(data.toString()),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: Colors.blue,
                      onPressed: () {
                        Services.addEmployee(username, password, mail, role);
                      },
                      child: Text(
                        "ÜYE EKLE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ])),
    );
  }

  Future veriGetir() async {
    var url = 'http://bektasozcan.com/tolga/index.php';
    http.Response response = await http.get(url);
    data = jsonDecode(response.body);
  }
}
