import 'package:get_storage/get_storage.dart';

class AppLink{

  static const String phyServer = "10.0.2.2:3000";
  static const String server = "localhost:3000";
  /// Doctor Routes
  static const String doctorLogin = "/api/v1/doctors/login";
  static const String doctorSignUp = "/api/v1/doctors/signup";
  static const String doctorResetPassword = "/api/v1/doctors/resetPassword";
  static const String doctorForgotPassword = "/api/v1/doctors/forgotPassword";
  static const String doctorUpdateMyPassword = "/api/v1/doctors/updateMyPassword";
  static const String doctorUpdateMe = "/api/v1/doctors/updateMe";
  static const String doctorDeleteMe = "/api/v1/doctors/deleteMe";
  ///Get Data
  static const String doctorGetAllData = "/api/v1/doctors/";

  /// Patient Routes
  static const String userLogin = "/api/v1/users/login";
  static const String userSignUp = "/api/v1/users/signup";
  static const String userForgotPassword = "/api/v1/users/forgotPassword";
  static const String userResetPassword = "/api/v1/users/resetPassword";
  static const String userUpdateMyPassword = "/api/v1/users/updateMyPassword";
  static const String userUpdateMe = "/api/v1/users/udpateMe";
  static const String userDeleteMe = "/api/v1/users/deleteMe";
  static const String userGetAllData = "/api/v1/users/";
  static const String userGetFavorites = "/api/v1/favorites/";
  static const String userGetReviews = "/api/v1/reviewsdoctors/";


}