class Kullanici {
  
  String username;
  String password;
  String mail;
  int role;

  Kullanici({this.username, this.password, this.mail, this.role});

  factory Kullanici.fromJson(Map<String, dynamic> json) {
    return Kullanici(
      username: json['Username'] as String,
      password: json['password'] as String,
      mail: json['Mail'] as String,
      role: json['Role'] as int,
    );
  }
}