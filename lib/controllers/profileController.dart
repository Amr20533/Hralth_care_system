import 'package:co_rhema/core/class/crud.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/func_utils/handling_data.dart';
import 'package:co_rhema/core/services/app_services.dart';
import 'package:co_rhema/link_api.dart';
import 'package:co_rhema/models/forgot_password_model.dart';
import 'package:co_rhema/shares/remote/auth/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/class/status_request.dart';

abstract class ProfileController extends GetxController {

  genderSelector();
  confPasswordToggleIcon();
  toggleIcon();
  resetPasswordToggleIcon();
  goToSignIn();
  userLogout();
  goToPasswordManager();
  goToForgetPassword();
  updatePassword(String token,UpdatePasswordModel updatePasswordModel);
  docUpdatePassword(String token,UpdatePasswordModel updatePasswordModel);
}

class ProfileControllerImp extends ProfileController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  List<String> genderList = ["52".tr,"53".tr];
  String selectedGender = "Select";

  late TextEditingController password;
  late TextEditingController resPassword;
  late TextEditingController confPassword;
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isResetPassword = true;

  bool? _loggedIn = false;
  bool get loggedIn => _loggedIn ?? false;

  set loggedIn(bool newState){
    _loggedIn = newState;
    update();
  }

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
  resetPasswordToggleIcon() {
    isResetPassword = !isResetPassword;
    update();
  }

  /// ***************************** User ************************

  @override
  Future<bool> updatePassword(String token,UpdatePasswordModel updatePasswordModel) async{
    var formData = formState.currentState;
    bool res = false;
    if(formData!.validate()){
      res = await AuthHelper().userUpdatePassword(token,updatePasswordModel);
      print(">>>>>>>>>>>>>>>>>>>>> reset Password: $res");
    }else{
      print("Not Valid");
    }
    return res;
  }

  @override
  userLogout()async {
    await services.sharedPreferences.remove('user-token');
    await services.sharedPreferences.remove('userId');
    update();
    await services.sharedPreferences.setBool('userLoggedIn',false);
    loggedIn = services.sharedPreferences.getBool('userLoggedIn') ?? false;
    update();
  }

  @override
  Future<bool> docUpdatePassword(String token,UpdatePasswordModel updatePasswordModel) async{
    var formData = formState.currentState;
    bool res = false;
    if(formData!.validate()){
      res = await AuthHelper().docUpdatePassword(token,updatePasswordModel);
      print(">>>>>>>>>>>>>>>>>>>>> reset Password: $res");
    }else{
      print("Not Valid");
    }
    return res;
  }



  @override
  genderSelector({String? value}) {
    selectedGender = value!;
    update();
  }
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController date;
  List data = [];
  late StatusRequest statusRequest;
  Crud crud = Crud();
  static var client = http.Client();
  AppServices services = Get.find();

  String? getUserId(){
    String? userId = services.sharedPreferences.getString("userId");
    debugPrint(userId);
    return userId;
  }

  String? getUserToken(){
    String? userToken = services.sharedPreferences.getString("user-token");
    debugPrint(userToken);
    return userToken;
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  goToPasswordManager() {
    Get.offNamed(AppRoutes.passwordManager);
  }
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
  getData() async{
    // statusRequest = StatusRequest.LOADING;

    final token = services.sharedPreferences.getString("user-token");
    debugPrint(">>>>>>>>>>>>> TOKEN <<<<<<<<<< $token");

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.http(AppLink.phyServer, AppLink.userGetAllData);
    var response = await crud.getData(url,requestHeaders);
    // update();
    return response.fold((left) => left, (right) => right);
  }
  getAllData() async {
    statusRequest = StatusRequest.LOADING;
    var response = await getData();
    print("==================== Controller $response");
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response.containsKey('data')) {
        data.addAll(response['data']['data']);
        // debugPrint('${data.length}');
        // return true;
      } else {
        debugPrint("Response does not contain the expected 'data' field.");
        statusRequest = StatusRequest.FAILURE;
        // update();

      }
      update();
    }else{
      statusRequest = StatusRequest.SERVERFAILURE;
      update();
    }
  }
  @override
  void onInit() {
    username = TextEditingController() ;
    phone = TextEditingController() ;
    email = TextEditingController() ;
    date = TextEditingController() ;
    password = TextEditingController() ;
    confPassword = TextEditingController() ;
    resPassword = TextEditingController() ;
    getUserId();
    getAllData();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    date.dispose();
    password.dispose();
    confPassword.dispose();
    resPassword.dispose();
    super.dispose();
  }
}