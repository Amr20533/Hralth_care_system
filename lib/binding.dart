import 'package:co_rhema/controllers/Doctor/home/doc_management_home_controller.dart';
import 'package:co_rhema/controllers/OnBoardingController.dart';
import 'package:co_rhema/controllers/home/booking_controller.dart';
import 'package:co_rhema/controllers/home/filter_controller.dart';
import 'package:co_rhema/controllers/home/main_screen_controller.dart';
import 'package:co_rhema/controllers/home/review_controller.dart';
import 'package:co_rhema/controllers/profileController.dart';
import 'package:co_rhema/controllers/help_center_controller.dart';
import 'package:co_rhema/core/class/crud.dart';
import 'package:co_rhema/core/localization/change_local.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  @override
  void dependencies(){

    Get.put(Crud());
    // Get.lazyPut(() => SignUpControllerImp(),fenix: true);
    Get.lazyPut(() => MainScreenController());
    // Get.lazyPut(() => LocalController());
    Get.lazyPut(() => OnBoardingControllerImp());
    Get.lazyPut(() => ReviewControllerImp());
    Get.lazyPut(() => FilterControllerImp());
    Get.lazyPut(() => BookingsControllerImp());
    Get.lazyPut(() => ProfileControllerImp());
    Get.lazyPut(() => DocManagementHomeController());
    Get.lazyPut(() => HelpCenterControllerImp());
  }
}