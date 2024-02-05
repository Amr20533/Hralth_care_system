import 'package:co_rhema/User/views/auth/widgets/auth/show_cherry_toast.dart';
import 'package:co_rhema/User/views/doc/models/auth/doc_login_model.dart';
import 'package:co_rhema/core/class/crud.dart';
import 'package:co_rhema/core/class/status_request.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/func_utils/handling_data.dart';
import 'package:co_rhema/core/services/app_services.dart';
import 'package:co_rhema/link_api.dart';
import 'package:co_rhema/models/login_model.dart';
import 'package:co_rhema/shares/remote/auth/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginController extends GetxController {
  userLogin(LoginModel loginModel);
  doctorLogin(DocLoginModel docLoginModel);
  toggleIcon();
  goToSignUp();
  userLogout();
  goToHomeScreen();
  goToForgetPassword();
  goToDocSignUp();
  goToDocHomeScreen();
  // doctorLogout();
  goToDocForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GlobalKey<FormState> profFormState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  final AppServices _services = Get.find();

  bool isPassword = true;
  final IconData  icon = Icons.visibility_sharp;
  late StatusRequest statusRequest;

  bool _isObscure = false;
  bool get isObscure => _isObscure;
  bool _processing = false;
  bool get processing => _processing;
  bool _loginResponse = false;
  bool get loginResponse => _loginResponse;
  bool? _loggedIn = false;
  bool get loggedIn => _loggedIn ?? false;

  bool _logoutResponse = false;
  bool get logoutResponse => _logoutResponse;


  set processing(bool newState){
    _processing = newState;
    update();
  }



  set loggedIn(bool newState){
    _loggedIn = newState;
    update();
  }

  @override
  userLogout()async {
    statusRequest = StatusRequest.LOADING;
    bool res = true;
    _services.sharedPreferences.remove('user-token');
    _services.sharedPreferences.remove('userId');
    _services.sharedPreferences.setBool('userLoggedIn',false);
    loggedIn = _services.sharedPreferences.getBool('userLoggedIn') ?? false;
    statusRequest = StatusRequest.success;
    res = true;
    return res;

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
  Future<bool> doctorLogin(DocLoginModel docLoginModel)async {
    _processing = true;
    bool response = await AuthHelper().docLogin(docLoginModel);
    _processing = false;
    _loginResponse = response;

    _loggedIn = _services.sharedPreferences.getBool('isLoggedIn') ?? false;
    // isLoggedIn
    return loginResponse;
  }
  @override
  Future<bool> userLogin(LoginModel loginModel)async {
    if(formState.currentState!.validate()) {
      _processing = true;
      bool response = await AuthHelper().userLogin(loginModel);
      _processing = false;
      _loginResponse = response;

      _loggedIn = _services.sharedPreferences.getBool('userLoggedIn') ?? false;
      // isLoggedIn
    }else{
      debugPrint('Fields are empty!');
  }
    return loginResponse;

  }

  // @override
  // login() {
  //   var formData = formState.currentState;
  //   if(formData!.validate()){
  //     Get.delete<LoginControllerImp>();
  //     print("Valid");
  //   }else{
  //     print("Not Valid");
  //   }
  // }
  @override
  toggleIcon() {
    isPassword = !isPassword;
    update();
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }@override
  goToDocSignUp() {
    Get.toNamed(AppRoutes.doctorsSignUp);
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    email = TextEditingController();
    password = TextEditingController();
      super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  goToHomeScreen() {
    Get.toNamed(AppRoutes.home);
  }
  @override
  goToDocForgetPassword() {
    Get.toNamed(AppRoutes.doctorsForgetPassword);
  }

  @override
  goToDocHomeScreen() {
    Get.toNamed(AppRoutes.doctorsHome);
  }
}