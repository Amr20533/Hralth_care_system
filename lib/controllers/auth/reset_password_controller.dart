import 'package:co_rhema/controllers/Doctor/home/doc_management_home_controller.dart';
import 'package:co_rhema/controllers/profileController.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/models/forgot_password_model.dart';
import 'package:co_rhema/shares/remote/auth/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword(String token,String newPassword);
  docResetPassword(String token,String newPassword);
  getResToken();
  getDocResToken();
  toggleIcon();
  confPasswordToggleIcon();
  goToSuccessResetPassword();
  goToDocSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {




  GlobalKey<FormState> formState = GlobalKey<FormState>();
  DocManagementHomeController docFindResetToken = Get.find();
  ProfileControllerImp findResetToken = Get.find();
  late TextEditingController password;
  late TextEditingController resPassword;
  bool isPassword = true;
  bool isConfirmPassword = true;
  @override
  toggleIcon() {
    isPassword = !isPassword;
    update();
  }
  @override
  confPasswordToggleIcon() {
    isConfirmPassword = !isConfirmPassword;
    update();
  }
  @override
  Future<bool> resetPassword(String token,String newPassword) async{
    var formData = formState.currentState;
    bool res = false;
    if(formData!.validate()){
      res = await AuthHelper().userForgotPassword(token,newPassword);
      print(">>>>>>>>>>>>>>>>>>>>> reset Password: $res");
    }else{
      print("Not Valid");
    }
    return res;
  }
  @override
  Future<bool> docResetPassword(String token,String newPassword) async{
    var formData = formState.currentState;
    bool res = false;
    if(formData!.validate()){
      res = await AuthHelper().doctorForgotPassword(token,newPassword);
      print(">>>>>>>>>>>>>>>>>>>>> reset Password: $res");
    }else{
      print("Not Valid");
    }
    return res;
  }
  /// ***************************** User ************************
  @override
  Future<String> getResToken() async{
    await findResetToken.getAllData();
    var userData = '';
    for(int i = 0; i < findResetToken.data.length; i++){
      if(findResetToken.data[i]['id'] == findResetToken.getUserId()) {
        userData = findResetToken.data[i]['passwordResetToken'];
      }
    }
    return userData;
  }
  /// ***************************** Doctor ************************
  @override
  Future<String> getDocResToken() async{
    await docFindResetToken.getAllData();
    var doctorData = '';
    for(int i = 0; i < findResetToken.data.length; i++){
      if(findResetToken.data[i]['id'] == findResetToken.getUserId()) {
        doctorData = findResetToken.data[i]['passwordResetToken'];
      }
    }
    return doctorData;
  }


  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoutes.successResetPassword);
  }

  @override
  goToDocSuccessResetPassword() {
    Get.offNamed(AppRoutes.doctorsSuccessResetPassword);
  }

  @override
  void onInit() {
    getResToken();
    // getDocResToken();
    password = TextEditingController();
    resPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    resPassword.dispose();
    super.dispose();
  }
}