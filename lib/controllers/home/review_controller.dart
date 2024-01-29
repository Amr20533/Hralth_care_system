import 'dart:io';

import 'package:co_rhema/core/constant/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
abstract class ReviewController  extends GetxController{
  toggleItem(String item);
  goToDoctorReview();
  goToHospitalReview();
  goToFilterScreen();
  addImage();
  removePostImage();
}
class ReviewControllerImp extends ReviewController{

  // MainScreenController();
  final formKey = GlobalKey<FormState>();
  final selectedItems = <String>[].obs; // Declaration of selectedItems as a reactive list
  final List<String> filterList =['Verified','Latest','With Photos','Doctors'].obs;
  late TextEditingController reviewsController;
  File? postImage;
  var picker = ImagePicker();

  @override
  Future<void> addImage()async{
    final post = await picker.pickImage(source: ImageSource.gallery);
    if(post != null){
      postImage = File(post.path);
      update();
    }else{
      print('No Image Selected!');
      update();
    }
  }

  @override
  void removePostImage(){
    postImage = null;
    update();
  }
  @override
  goToFilterScreen() {
    Get.toNamed(AppRoutes.filter);
  }
  @override
  void toggleItem(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
      update();
    } else {
      selectedItems.add(item);
      update();
    }
  }
  @override
  void onInit(){
    reviewsController = TextEditingController();
    super.onInit();

  }

  @override
  void dispose() {
    super.dispose();
    reviewsController.dispose();
  }
  @override
  void onClose() {
    // formKey.currentState!.dispose();
    super.onClose();
  }

  @override
  goToDoctorReview() {
    Get.offNamed(AppRoutes.doctorReviews);
  }

  @override
  goToHospitalReview() {
    Get.offNamed(AppRoutes.hospitalReviews);
  }



}
