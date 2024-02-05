
import 'package:co_rhema/core/constant/app_theme_data.dart';
import 'package:co_rhema/core/services/app_services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppConstants {
  static const String arabicLanguageCode = "ar";
  static const String englishLanguageCode = "en";
}

enum AppLanguage { arabic, english }


class LocalController extends GetxController{
  late Locale language;
  late AppServices appServices;
  ThemeData appTheme = eTheme;
  bool _splitScreenMode = false;
  bool get splitScreenMode => _splitScreenMode;
  set splitScreenMode(bool mode){
    _splitScreenMode = mode;
    update();
  }

  changeLanguage(String newLang){
    Locale locale = Locale(newLang);
    appServices.sharedPreferences.setString("lang", newLang);
    Get.updateLocale(locale);
    appTheme = newLang == AppConstants.arabicLanguageCode ? aTheme : eTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }
  // // Usage
  // AppLanguage sharedLang = AppLanguage.values.firstWhere(
  //       (lang) => lang.toString() == appServices.sharedPreferences.getString("lang"),
  //   orElse: () => AppLanguage.english,
  // );


  @override
  void onInit() {
    // String sharedLang = appServices.sharedPreferences.getString("lang") ?? "en";
    // if(sharedLang == "ar"){
    //   language =  const Locale("ar");
    //   appTheme = aTheme;
    // }else if(sharedLang == "en"){
    //   language =  const Locale("en");
    //   appTheme = eTheme;
    // }else{
    //   language = Locale(Get.deviceLocale!.languageCode);
    //   appTheme = eTheme;
    // }


    super.onInit();

    // Access the appServices after the controller has been initialized
    appServices = Get.find();
    _splitScreenMode = true;
    String sharedLang = appServices.sharedPreferences.getString("lang") ?? AppConstants.englishLanguageCode;
    sharedLang = sharedLang.toLowerCase();

    // Use a switch statement for better readability
    switch (sharedLang) {
      case AppConstants.arabicLanguageCode:
        language = const Locale("ar");
        appTheme = aTheme;
        break;
      case AppConstants.englishLanguageCode:
        language = const Locale("en");
        appTheme = eTheme;
        break;
      default:
        language = Locale(Get.deviceLocale!.languageCode);
        appTheme = eTheme;
    }
  }

}