import 'package:co_rhema/core/class/crud.dart';
import 'package:co_rhema/core/class/status_request.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/func_utils/handling_data.dart';
import 'package:co_rhema/shares/remote/remote_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  // Crud crud;
  TestData testData = TestData(Get.find());

  List data = [];
  late StatusRequest statusRequest;

  // getData() async {
  //   statusRequest = StatusRequest.LOADING;
  //   var response = await testData.getData();
  //   print("==================== Controller $response");
  //   statusRequest = handlingData(response);
  //
  //
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == 'success') {
  //       data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.FAILURE;
  //     }
  //     update();
  //   }
  // }

  @override
  void onInit() {
    // getData();
    super.onInit();
  }

}