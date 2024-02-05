import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/models/forgot_password_model.dart';
import 'package:co_rhema/shares/remote/auth/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  verifyCode();
  userVerifyCode();
  verifyEmail(String email);
  goToDocVerifyScreen();
  goToVerifyScreen();
  goToDocResPassScreen();
  userVerifyEmail(String email);
}

class VerifyCodeControllerImp extends VerifyCodeController {

  late TextEditingController email;

  late bool _processing;
  bool get processing => _processing;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  set processing(bool newState){
    _processing = newState;
    update();
  }

  // late String verifyCode;

  @override
  Future<bool> userVerifyEmail(String email) async{
    bool ckMainResponse = false;
      processing = true;
      ckMainResponse = await AuthHelper().userResetPassword(email);
      debugPrint('EmailResponse>>>>>>>>>>>>>>>>>>>>>> $ckMainResponse');
      processing = false;
    return ckMainResponse;

  }

  @override
  Future<bool> verifyEmail(String email) async{
    bool ckMainResponse = false;
      processing = true;
      ckMainResponse = await AuthHelper().docResetPassword(email);
      debugPrint('EmailResponse>>>>>>>>>>>>>>>>>>>>>> $ckMainResponse');
      processing = false;
    return ckMainResponse;


  }


  @override
  Future<void> verifyCode() async{

  }
  @override
  Future<void> userVerifyCode() async{

  }

  @override
  goToVerifyScreen() {
    Get.offNamed(AppRoutes.verifyCode);
  }
  @override
  goToDocVerifyScreen() {
    Get.offNamed(AppRoutes.doctorsVerifyCode);
  }
  @override
  goToDocResPassScreen() {
    Get.offNamed(AppRoutes.doctorsResetPassword);
  }

  @override
  void onInit() {
    processing = false;
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}