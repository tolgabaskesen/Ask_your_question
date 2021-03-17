import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:esoru/model/vtKullanici.dart';

class Services {
  static const ROOT = 'http://bektasozcan.com/tolga/adduser.php';
  static const String _GET_ACTION = 'GET_ALL';
  static const String _CREATE_TABLE = 'CREATE_TABLE';
  static const String _ADD_EMP_ACTION = 'ADD_EMP';
  static const String _UPDATE_EMP_ACTION = 'UPDATE_EMP';
  static const String _DELETE_EMP_ACTION = 'DELETE_EMP';

  static Future<String> addEmployee(
      String username, String password, String mail, String role) async {
    try {
      var map = new Map<String, dynamic>();
      map['username2'] = username;
      map['password2'] = password;
      map['mail'] = mail;
      map['role'] = role;
      final response = await http.post(ROOT, body: {
        "username2": username,
        "password2": password,
        "mail": mail,
        "role": role,
      });
      print("addEmployee >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }
}
