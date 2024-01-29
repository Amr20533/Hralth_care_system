import 'dart:convert';

import 'package:co_rhema/core/class/crud.dart';
import 'package:co_rhema/link_api.dart';
import 'package:co_rhema/models/signup_model.dart';

class SignUpData{
  Crud crud;
  SignUpData(this.crud);

  // docSignUp() async{
  //   var response = await crud.postData(AppLink.doctorSignUp, {
  //     // "name":,
  //     // "email":,
  //     // "password":,
  //     // "passwordConfirm":,
  //     // "medicalRecord":,
  //   });
  //
  //   // response.fold((left) => left, (right) => right);
  //   return response.fold((left) => left, (right) => right);
  // }

  // userSignUp(SignupModel signupModel) async{
  //   var response = await crud.postData("http://10.0.2.2:3000/api/doctors/register", jsonEncode(signupModel.toJson()));
  //     // "username": "Aya M Dussoky",
  //     // "email": "ayoub112@example.com",
  //     // "location": "Cairo - Egypt",
  //     // "password": "ayo333777"
  //     // "name":,
  //     // "email":,
  //     // "password":,
  //     // "passwordConfirm":,
  //     // "medicalRecord":,
  //   // });
  //
  //   // response.fold((left) => left, (right) => right);
  //   return response.fold((left) => left, (right) => right);
  // }


}