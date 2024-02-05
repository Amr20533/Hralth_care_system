import 'package:co_rhema/User/views/doc/views/chat/chats_details.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/core/constant/app_routes.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ChatController extends GetxController {
  goToChats();
  openChat(int index);
}
class ChatControllerImp extends ChatController{
  int curChat = 0;
  late TextEditingController searchController;

  List chats = [
    DocChatsDetails(),
    Container(
      color: Colors.orange, // Set the background color for Settings screen
      child: Center(
        child: Text('Settings Screen'),
      ),
    ),
    Container(
      color: Colors.orange, // Set the background color for Settings screen
      child: Center(
        child: Text('Settings Screen'),
      ),
    ),
    Container(
      color: Colors.orange, // Set the background color for Settings screen
      child: Center(
        child: Text('Settings Screen'),
      ),
    ),
    Container(
      color: Colors.orange, // Set the background color for Settings screen
      child: Center(
        child: Text('Settings Screen'),
      ),
    ),
    Container(
      color: Colors.orange, // Set the background color for Settings screen
      child: Center(
        child: Text('Settings Screen'),
      ),
    ),
    Container(
      color: Colors.orange, // Set the background color for Settings screen
      child: Center(
        child: Text('Settings Screen'),
      ),
    ),
    Container(
      color: Colors.orange, // Set the background color for Settings screen
      child: Center(
        child: Text('Settings Screen'),
      ),
    ),

  ];

  @override
  void openChat(int index){
    curChat = index;
    update();
  }
  @override
  void onInit(){
    searchController = TextEditingController();
    super.onInit();

  }

  @override
  void onClose() {
    super.onClose();
  }
  @override
    void dispose() {
    searchController.dispose();
    super.dispose();
    }

  @override
  goToChats() {
    Get.offNamed(AppRoutes.chatsDetails);
  }


}
