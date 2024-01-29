import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class SignUpSuccessController extends GetxController{
  goToLoginPage();
  goToDocLoginPage();
}

class SignUpSuccessControllerImp extends SignUpSuccessController{
  @override
  goToLoginPage(){
    Get.offNamed(AppRoutes.login);
  }

  @override
  goToDocLoginPage(){
    Get.offNamed(AppRoutes.doctorsLogin);
  }

}
