import 'dart:convert';

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));


class LoginResponseModel {
  LoginResponseModel({
    required this.token,
    required this.status,
    required this.data,
  });

  final Data data;
  final String token;
  final String status;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    data: Data.fromJson(json['data']),
    token: json["token"],
    status: json["status"],
  );
}
class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  int? medicalId;
  int? ratingsAverage;
  int? ratingsQuantity;
  int? iV;
  String? id;

  User(
      {this.sId,
        this.name,
        this.email,
        this.medicalId,
        this.ratingsAverage,
        this.ratingsQuantity,
        this.iV,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    medicalId = json['medicalId'];
    ratingsAverage = json['ratingsAverage'];
    ratingsQuantity = json['ratingsQuantity'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['medicalId'] = medicalId;
    data['ratingsAverage'] = ratingsAverage;
    data['ratingsQuantity'] = ratingsQuantity;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}

