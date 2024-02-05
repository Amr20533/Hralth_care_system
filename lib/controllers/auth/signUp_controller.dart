import 'package:co_rhema/User/views/doc/models/auth/doc_signup_model.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/func_utils/handling_data.dart';
import 'package:co_rhema/models/signup_model.dart';
import 'package:co_rhema/shares/remote/auth/auth_helper.dart';
import 'package:co_rhema/shares/remote/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';

abstract class SignUpController extends GetxController {
  userSignUp(SignupModel signupModel);
  toggleIcon();
  goToSignIn();
  goToSuccessSignUp();
  doctorSignUp(DocSignupModel docSignupModel);
  goToDocSignIn();
  goToDocSuccessSignUp();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isPassword = true;


  @override
  toggleIcon() {
    isPassword = !isPassword;
    update();
  }
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController docIdController;
  late StatusRequest statusRequest;
  bool _processing = false;
  bool get processing => _processing;

  SignUpData signUpData = SignUpData(Get.find());
  // SignupModel signupModel = SignupModel(username: nameController.text, email: emailController.text, password: passwordController.text);
  set processing(bool newState){
    _processing = newState;
    update();
  }




  @override
 doctorSignUp(DocSignupModel docSignupModel) async{


    var formData = formState.currentState;
    if(formData!.validate()){
      processing = true;
      bool regResponse = await AuthHelper().docSignUp(docSignupModel);
      processing = false;
      return regResponse;
  }

  }
  @override
  Future<bool> userSignUp(SignupModel signupModel, {int maxRetries = 3}) async{
    var formData = formState.currentState;
    bool regResponse = false;
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        if (formData?.validate() ?? false) {
          processing = true;
          regResponse = await AuthHelper().userSignUp(signupModel);
          return regResponse;
        }
      } catch (e) {
        debugPrint('Couldn\'t sign up! Error: $e');
        retryCount++;
        // Add a delay before retrying (adjust the duration as needed)
        await Future.delayed(Duration(seconds: 2));
      } finally {
        processing = false;
      }
    }

    return regResponse;
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
  }
  @override
  goToDocSignIn() {
    Get.offNamed(AppRoutes.doctorsLogin);
  }

  @override
  goToDocSuccessSignUp() {
    Get.offNamed(AppRoutes.doctorsSuccessSignUp);
  }

  @override
  void onInit() {
    username = TextEditingController() ;
    phone = TextEditingController() ;
    email = TextEditingController();
    password = TextEditingController();
    docIdController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    docIdController.dispose();
    super.dispose();
  }
}