import 'dart:convert';

DocSignupModel docSignUpModelFromJson(String str) => DocSignupModel.fromJson(json.decode(str));

String docSignupModelToJson(DocSignupModel data) => json.encode(data.toJson());

class DocSignupModel {
  DocSignupModel({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.medicalId,
  });

  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final String medicalId;

  factory DocSignupModel.fromJson(Map<String, dynamic> json) => DocSignupModel(
    username: json["name"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["passwordConfirm"],
    medicalId: json["medicalId"],
  );

  Map<String, dynamic> toJson() => {
    "name": username,
    "email": email,
    "password": password,
    "passwordConfirm": confirmPassword,
    "medicalId": medicalId,
  };
}
