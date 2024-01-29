import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class ResetPasswordSuccessController extends GetxController{
  goToLoginPage();
}

class ResetPasswordSuccessControllerImp extends ResetPasswordSuccessController{
  @override
  goToLoginPage(){
    Get.offNamed(AppRoutes.login);
}

}
