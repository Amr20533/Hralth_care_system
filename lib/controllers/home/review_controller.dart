import 'dart:io';

import 'package:co_rhema/User/views/doc/models/home/review_model.dart';
import 'package:co_rhema/User/views/home/reviews/doctor_reviews.dart';
import 'package:co_rhema/core/class/crud.dart';
import 'package:co_rhema/core/class/status_request.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/func_utils/handling_data.dart';
import 'package:co_rhema/core/services/app_services.dart';
import 'package:co_rhema/link_api.dart';
import 'package:co_rhema/shares/remote/functions/fav_helper.dart';
import 'package:co_rhema/shares/remote/functions/review_helper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
abstract class ReviewController  extends GetxController{
  toggleItem(String item);
  goToDoctorReview(DoctorReviewScreen reviewScreen);
  goToHospitalReview();
  goToFilterScreen();
  addImage();
  removePostImage();
  addReview(String id,ReviewModel reviewModel);
  addRating(double newRating);
}
class ReviewControllerImp extends ReviewController{

  List revData = [];
  // MainScreenController();
  final formKey = GlobalKey<FormState>();
  final selectedItems = <String>[].obs; // Declaration of selectedItems as a reactive list
  final List<String> filterList =['Verified','Latest','With Photos','Doctors'].obs;
  late TextEditingController reviewsController;
  late TextEditingController reviewsSeacrchController;
  File? postImage;
  var picker = ImagePicker();
  double rating = 4.0;
  late StatusRequest statusRequest;
  Crud crud = Crud();
  AppServices appServices = Get.find();
  bool _processing = false;
  bool get processing => _processing;

  set processing(bool newState){
    _processing = newState;
    update();
  }

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

  Future<bool> addReview(String id,ReviewModel reviewModel)async{
    bool ckFavResponse = false;
    String? userToken = appServices.sharedPreferences.getString("user-token");

    try {
      processing = true;
      ckFavResponse = await RevHelper().userAddRev(userToken!, id, reviewModel);
      debugPrint('Favorites Response>>>>>>>>>>>>>>>>>>>>>> $ckFavResponse');
      // return ckFavResponse;
    } finally {

      ckFavResponse = false;
    }
    return ckFavResponse;

  }

  getReview() async{
    // statusRequest = StatusRequest.LOADING;

    final token = appServices.sharedPreferences.getString("user-token");
    debugPrint(">>>>>>>>>>>>> TOKEN <<<<<<<<<< $token");

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.http(AppLink.phyServer, AppLink.userGetReviews);
    var response = await crud.getData(url,requestHeaders);
    // update();
    return response.fold((left) => left, (right) => right);
  }
  getAllRevData() async {
    statusRequest = StatusRequest.LOADING;
    var response = await getReview();
    print("==================== Fav Controller $response");
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response.containsKey('data')) {
        revData.addAll(response['data']['data']);
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


  void addRating(double newRating){
    rating = newRating;
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
    reviewsSeacrchController = TextEditingController();
    super.onInit();

  }

  @override
  void dispose() {
    super.dispose();
    reviewsController.dispose();
    reviewsSeacrchController.dispose();
  }
  @override
  void onClose() {
    // formKey.currentState!.dispose();
    super.onClose();
  }

  @override
  goToDoctorReview(DoctorReviewScreen reviewScreen) {
    Get.toNamed(AppRoutes.doctorReviews, arguments: reviewScreen);
  }

  @override
  goToHospitalReview() {
    Get.offNamed(AppRoutes.hospitalReviews);
  }




}
