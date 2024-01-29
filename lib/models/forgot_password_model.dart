import 'dart:convert';

UpdatePasswordModel updatePasswordModelFromJson(String str) => UpdatePasswordModel.fromJson(json.decode(str));

String updatePasswordModelToJson(UpdatePasswordModel data) => json.encode(data.toJson());

class UpdatePasswordModel {
  UpdatePasswordModel({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
  
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) => UpdatePasswordModel(
    currentPassword: json["passwordCurrent"],
    newPassword: json["password"],
    confirmPassword: json["passwordConfirm"],
  );

  Map<String, dynamic> toJson() => {
    'passwordCurrent': currentPassword,
    'password': newPassword,
    'passwordConfirm': confirmPassword,
  };
}


