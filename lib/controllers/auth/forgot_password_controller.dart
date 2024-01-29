import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/show_cherry_toast.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/shares/remote/auth/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordController extends GetxController {
  checkEmail(String email);
  goToResetPassword();
  goToDocResetPassword();
  userCheckEmail(String email);
}

class ForgotPasswordControllerImp extends ForgotPasswordController{
  late TextEditingController email;

  bool _processing = false;
  bool get processing => _processing;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  set processing(bool newState){
    _processing = newState;
    update();
  }



  void showWarningToast(BuildContext context,{required String title, required String description}) {
    if (formState.currentState!.validate()) {
      showCherryWarningToast(
        context,
        title: Text(title, style: TextStyle(color: Colors.redAccent, fontSize: 16.w, fontWeight: FontWeight.bold)),
        description: Text(description, style: const TextStyle(color: Colors.black45)),
      );
    }
  }

  void showErrorToast(BuildContext context,{required String title, required String description}) {
    if (formState.currentState!.validate()) {
      showCherryErrorToast(
        context,
        title: Text(title, style: TextStyle(color: Colors.redAccent, fontSize: 16.w, fontWeight: FontWeight.bold)),
        description: Text(description, style: const TextStyle(color: Colors.black45)),
      );
    }
  }

  @override
  Future<bool> userCheckEmail(String email) async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      try {
        processing = true;
        bool ckMainResponse = await AuthHelper().userResetPassword(email);
        debugPrint('EmailResponse>>>>>>>>>>>>>>>>>>>>>> $ckMainResponse');
        return ckMainResponse;
      } finally {
        processing = false;
      }
    }
    return false;
  }

  @override
  Future<bool> checkEmail(String email) async{
    var formData = formState.currentState;
    bool ckMainResponse = false;
    if(formData!.validate()){
      processing = true;
      ckMainResponse = await AuthHelper().docResetPassword(email);
      debugPrint('EmailResponse>>>>>>>>>>>>>>>>>>>>>> $ckMainResponse');
      processing = false;
    }
    return ckMainResponse;

  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.doctorsResetPassword);
  }
  @override
  goToDocResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}
