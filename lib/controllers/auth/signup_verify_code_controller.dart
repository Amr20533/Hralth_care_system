import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpVerifyCodeController extends GetxController {
  checkEmail();
  goToSuccessSignUp();
  goToDocSuccessSignUp();
}

class SignUpVerifyCodeControllerImp extends SignUpVerifyCodeController{
  late TextEditingController email;

  @override
  checkEmail() {}

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
  }
  @override
  goToDocSuccessSignUp() {
    Get.offNamed(AppRoutes.doctorsSuccessSignUp);
  }
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

}
