import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

abstract class BookingsController extends GetxController {

  selectCancellation(int index);
  toggleIcon(bool value);

}

class BookingsControllerImp extends BookingsController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController cancellationController;
  bool active = true;
  final List<String> cancellationList = ["Schedule Change","Weather conditions", "Unexpected Work","Childcare Issue","Travel Delays","Other"];
  int canceled = 0;

  @override
  selectCancellation(int index) {
    canceled = index;
    update();
  }

@override
  void onInit() {
    cancellationController = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    cancellationController.dispose();
    super.dispose();
  }
  @override
  toggleIcon(bool value) {
    active = value;
    update();
  }
// @override
// goToFilterScreen() {
//   Get.toNamed(AppRoutes.filter);
// }



}