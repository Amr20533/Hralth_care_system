import 'dart:convert';

DocLoginModel docLoginModelFromJson(String str) => DocLoginModel.fromJson(json.decode(str));

String docLoginModelToJson(DocLoginModel data) => json.encode(data.toJson());

class DocLoginModel {
  DocLoginModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory DocLoginModel.fromJson(Map<String, dynamic> json) => DocLoginModel(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
