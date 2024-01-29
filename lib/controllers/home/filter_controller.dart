import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

abstract class FilterController extends GetxController {
  apply();
  toggleIcon(bool value);
  selectCategory(int index);
  selectReview(int index);
  sliderDrag(double value);
}

class FilterControllerImp extends FilterController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool active = true;
  final List<String> filterList = ["All","General", "Dentist","Orthopedic","Cardiologist","Skin Care"];
  final List<String> reviews = ["4.5 and above","4.0 - 4.5", "3.5 - 4.0","3.0 - 3.5","2.5 - 3.0"];
  int selected = 1, selectedReview = 0;
  double sliderValue = 0.0;
  // double value = 20;
  String status = 'idle';
  Color statusColor = Colors.amber;

  @override
  apply() {

  }
  @override
  toggleIcon(bool value) {
    active = value;
    update();
  }
  @override
  selectCategory(int index) {
    selected = index;
    update();
  }
  @override
  sliderDrag(double value) {
    sliderValue = value;
    update();
  }
  @override
  selectReview(int index) {
    selectedReview = index;
    update();
  }

  // @override
  // goToFilterScreen() {
  //   Get.toNamed(AppRoutes.filter);
  // }



}