import 'dart:convert';


DocForgotPasswordModel docForgotPasswordModelFromJson(String str) => DocForgotPasswordModel.fromJson(json.decode(str));


class DocForgotPasswordModel {
  DocForgotPasswordModel({
    // required this.token,
    required this.resetToken,
  });

  // final String token;
  final String resetToken;

  factory DocForgotPasswordModel.fromJson(Map<String, dynamic> json) => DocForgotPasswordModel(
    resetToken: json["token"],
  );


  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //     data['token'] = resetToken;
  //
  //   return data;
  // }
  Map<String, dynamic> toJson() => {
    "token": resetToken,
  };
}