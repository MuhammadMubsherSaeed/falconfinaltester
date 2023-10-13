class User {
  int? userid;
  String? username;
  String? useremail;
  String? userpassword;
  User(
    this.userid,
    this.username,
    this.useremail,
    this.userpassword,
  );
  factory User.fromjson(Map<String, dynamic> json) => User(
        int.parse(json["user_id"]),
        json["user_name"],
        json["user_email"],
        json["user_password"],
      );
  Map<String, dynamic> tojson() => {
        'user_id': userid.toString(),
        'user_name': username,
        'user_email': useremail,
        'user_password': userpassword,
      };
}
