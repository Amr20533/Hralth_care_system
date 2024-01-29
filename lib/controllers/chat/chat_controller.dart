import 'package:co_rhema/constants.dart';
import 'package:co_rhema/core/constant/app_routes.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ChatController extends GetxController {
  goToChats();
}
class ChatControllerImp extends ChatController{


  @override
  void onInit(){
    super.onInit();

  }

  @override
  void onClose() {
    super.onClose();
  }


  @override
  goToChats() {
    Get.offNamed(AppRoutes.chatsDetails);
  }


}
