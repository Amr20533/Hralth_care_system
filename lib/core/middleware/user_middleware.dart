import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/services/app_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserMiddleWare extends GetMiddleware{
  @override
  int? get priority => 1;
  AppServices appServices = Get.find();

  @override
  RouteSettings? redirect(String? route){
    if(appServices.sharedPreferences.getString("on-Boarding") == "1"){
      return const RouteSettings(name: AppRoutes.login);
    }
    else{
      return const RouteSettings(name: AppRoutes.onBoarding);
    }
    // return null;
  }

}
class UserAuthDocWare extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    AppServices appServices = Get.find(); // Use AppServices? for potential null

    if (appServices.sharedPreferences.getBool("userLoggedIn") == true) {
      return const RouteSettings(name: AppRoutes.home);
    }
  }
}
class AuthDocWare extends GetMiddleware {

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    AppServices appServices = Get.find(); // Use AppServices? for potential null

    if (appServices.sharedPreferences.getBool("isLoggedIn") == true) {
      return const RouteSettings(name: AppRoutes.doctorsHome);
    } else {
      return const RouteSettings(name: AppRoutes.doctorsLogin);
    }

    return null;
  }
}