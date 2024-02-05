import 'dart:convert';

import 'package:co_rhema/User/views/doc/models/auth/doc_forgot_password_model.dart';
import 'package:co_rhema/User/views/doc/models/auth/doc_login_model.dart';
import 'package:co_rhema/User/views/doc/models/auth/doc_login_response.dart';
import 'package:co_rhema/User/views/doc/models/auth/doc_signup_model.dart';
import 'package:co_rhema/link_api.dart';
import 'package:co_rhema/models/auth_response/login_response.dart';
import 'package:co_rhema/models/login_model.dart';
import 'package:co_rhema/models/signup_model.dart';
import 'package:co_rhema/models/forgot_password_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthHelper {
  static var client = http.Client();

  /// ********************* User **********************
  Future<bool> userLogin(LoginModel loginModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };
    var url = Uri.http(AppLink.phyServer, AppLink.userLogin);
    var response = await client.post(
        url, headers: requestHeaders, body: jsonEncode(loginModel.toJson()));

    if (response.statusCode == 200) {
      final SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();

      String userToken = loginResponseModelFromJson(response.body).token;
      String userId = loginResponseModelFromJson(response.body).data.user!.id!;

      await sharedPreferences.setString('user-token', userToken);
      await sharedPreferences.setString('userId', userId);
      await sharedPreferences.setBool('userLoggedIn', true);

      return true;
    } else {
      return false;
    }
  }
  Future<bool> userSignUp(SignupModel signupModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };
    var url = Uri.http(AppLink.phyServer, AppLink.userSignUp);
    var response = await client.post(
        url, headers: requestHeaders, body: jsonEncode(signupModel.toJson()));

    if (response.statusCode == 201) {

      return true;
    } else {
      return false;
    }
  }

  Future<bool> userForgotPassword(String otp, String newPassword) async {
    var url = Uri.http(AppLink.server, AppLink.userResetPassword);
    bool res = false;
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'password': newPassword,
      'passwordConfirm': newPassword,
      'otp': otp,
    };

    try {
      final response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Password updated successfully
        debugPrint('Password Reset Successfully! ${response.statusCode}');
        res = true;

      } else {
        // Handle other status codes or errors
        debugPrint('Failed to Reset Password. Status Code: ${response.statusCode}');
        res = false;

      }
    } catch (e) {
      // Handle exceptions
      debugPrint('Error: $e');
      res = false;
    }
    return res;

  }

  /// Update Password by passing your password and the new password

  Future<bool> userUpdatePassword(String token, UpdatePasswordModel updatePasswordModel) async {
      bool res = false;
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.http(AppLink.phyServer,AppLink.userUpdateMyPassword);

      try {
        final response = await http.patch(
          url,
          headers: headers,
          body: jsonEncode(updatePasswordModel.toJson()),
        );
        if (response.statusCode == 200) {
          debugPrint('Password updated successfully! ${response.statusCode}');
          res = true;
        } else {
          // Handle other status codes or errors
          debugPrint('Failed to update password. Status Code: ${response.statusCode}');
          res = false;
        }
        // return true;
      } catch (e) {
        // Handle exceptions
        debugPrint('Error: $e');
        res = false;
      }
      return res;
  }


  /// Reset Password by sending email
  Future<bool> userResetPassword(String email) async {
    bool res = false;

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'email': email,
    };
    var url = Uri.http(AppLink.phyServer, AppLink.userForgotPassword);


    try {
      final response = await client.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Request successful
        debugPrint('We\'ve just sent Email, you should check it! ${response.statusCode}');
        res = true;
      } else {
        // Handle other status codes or errors
        debugPrint('Failed to send Email!. Status Code: ${response.statusCode}');
        res = false;
      }
      // return true;
    } catch (e) {
      // Handle exceptions
      debugPrint('Error: $e');
      res = false;
    }
    return res;
  }


/// *********************** Doctor **************************
  Future<bool> docLogin(DocLoginModel docLoginModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };
    var url = Uri.http(AppLink.server, AppLink.doctorLogin);
    var response = await client.post(
        url, headers: requestHeaders, body: jsonEncode(docLoginModel.toJson()));

    if (response.statusCode == 200) {
      final SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();

      String docToken = docLoginResponseModelFromJson(response.body).token;
      String docId = docLoginResponseModelFromJson(response.body).data.user!.id!;

      await sharedPreferences.setString('doc-token', docToken);
      await sharedPreferences.setString('docId', docId);
      await sharedPreferences.setBool('isLoggedIn', true);

      return true;
    } else {
      return false;
    }
  }

  // Future<bool> signUp(SignupModel signupModel) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json'
  //   };
  //   var url = Uri.http(AppLink.server, AppLink.userSignUp);
  //   var response = await client.post(
  //       url, headers: requestHeaders, body: jsonEncode(signupModel.toJson()));
  //
  //   if (response.statusCode == 201) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  Future<bool> docSignUp(DocSignupModel docSignupModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };
    var url = Uri.http(AppLink.server, AppLink.doctorSignUp);
    var response = await client.post(
        url, headers: requestHeaders, body: jsonEncode(docSignupModel.toJson()));

    if (response.statusCode == 201) {

      return true;
    } else {
      return false;
    }
  }

  Future<bool> doctorForgotPassword(String otp, String newPassword) async {
    var url = Uri.http(AppLink.server, AppLink.doctorResetPassword);
    bool res = false;
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'password': newPassword,
      'passwordConfirm': newPassword,
      'otp': otp,
    };

    try {
      final response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Password updated successfully
        debugPrint('Password Reset Successfully! ${response.statusCode}');
        res = true;

      } else {
        // Handle other status codes or errors
        debugPrint('Failed to Reset Password. Status Code: ${response.statusCode}');
        res = false;

      }
    } catch (e) {
      // Handle exceptions
      debugPrint('Error: $e');
      res = false;
    }
    return res;
  }

  /// Update Password by passing your password and the new password

  Future<bool> docUpdatePassword(String token, UpdatePasswordModel updatePasswordModel) async {
    bool res = false;
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    // final Map<String, String> body = {
    //   'passwordCurrent': currentPassword,
    //   'password': newPassword,
    //   'passwordConfirm': newPassword,
    // };
    var url = Uri.http(AppLink.server,AppLink.doctorUpdateMyPassword);

    try {
      final response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode(updatePasswordModel.toJson()),
      );
      if (response.statusCode == 200) {
        debugPrint('Password updated successfully! ${response.statusCode}');
        res = true;
      } else {
        // Handle other status codes or errors
        debugPrint('Failed to update password. Status Code: ${response.statusCode}');
        res = false;
      }
      // return true;
    } catch (e) {
      // Handle exceptions
      debugPrint('Error: $e');
      res = false;
    }
    return res;
  }

  /// Reset Password by sending email
  Future<bool> docResetPassword(String email) async {
    // String url = AppLink.doctorForgotPassword;
    bool res = false;

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'email': email,
    };
    var url = Uri.http(AppLink.server, AppLink.doctorForgotPassword);


    try {
      final response = await client.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Request successful
        debugPrint('We\'ve just sent Email, you should check it! ${response.statusCode}');
        res = true;
      } else {
        // Handle other status codes or errors
        debugPrint('Failed to send Email!. Status Code: ${response.statusCode}');
        res = false;
      }
      // return true;
    } catch (e) {
      // Handle exceptions
      debugPrint('Error: $e');
      res = false;
    }
    return res;
  }


// Future<bool> docForgotPassword(DocSignupModel docSignupModel) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json'
  //   };
  //   var url = Uri.http(AppLink.server, AppLink.doctorForgotPassword);
  //   var response = await client.post(
  //       url, headers: requestHeaders, body: jsonEncode(DocForgotPasswordModel.toJson()));
  //
  //   if (response.statusCode == 200) {
  //     final SharedPreferences sharedPreferences = await SharedPreferences
  //         .getInstance();
  //
  //     String resetToken = docLoginResponseModelFromJson(response.body).token;
  //
  //     await sharedPreferences.setString('res-token', resetToken);
  //     // await sharedPreferences.setBool('sentCode', true);
  //
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }



  // Future<ProfileRes> getProfile() async {
  //   final SharedPreferences sharedPreferences = await SharedPreferences
  //       .getInstance();
  //   String? userToken = sharedPreferences.getString('token');
  //   // debugPrint('$userToken');
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //     'Authorization' : 'Bearer $userToken'
  //   };
  //   var url = Uri.http(Config.appUrl, Config.updateUserUrl);
  //   var response = await client.post(url, headers: requestHeaders);
  //
  //   if (response.statusCode == 200) {
  //     var profile = profileResFromJson(response.body);
  //     return profile;
  //   } else {
  //     throw Exception("Failed to get the profile");
  //   }
  // }

}
