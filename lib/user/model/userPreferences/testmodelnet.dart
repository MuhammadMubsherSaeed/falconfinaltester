class Userinfo {
  String? cnic;
  String? phone;
  String? email;
  String? password;
  Userinfo(
    this.cnic,
    this.email,
    this.phone,
    this.password,
  );
  Map<String, dynamic> tojson() => {
        'CNIC': cnic,
        'Email': email,
        'ContactNo': phone,
        'Password': password,
      };
}
