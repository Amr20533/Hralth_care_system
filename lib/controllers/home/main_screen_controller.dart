import 'package:co_rhema/User/views/bookings/booking_screen.dart';
import 'package:co_rhema/User/views/chats/chat_screen.dart';
import 'package:co_rhema/User/views/explore/explore_screen.dart';
import 'package:co_rhema/User/views/home/home_screen.dart';
import 'package:co_rhema/User/views/profile/profile_screen.dart';
import 'package:co_rhema/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainScreenController extends GetxController{
  late TextEditingController searchController;

  // MainScreenController();
  final formKey = GlobalKey<FormState>();
  final curTab = 0.obs;
  final List screen = [
    HomeScreen(),
    ExploreScreen(),
    //BookingScreen(),
    // FavScreen(),
    BookingScreen(),
    ChatScreen(),
    ProfileScreen(),
  ].obs;
  final List bgColors = const [
    Color(0xFFFCFCFC),
    Color(0xFFFCFCFC),
    Color(0xFFFCFCFC),
    myBlueColor,
    Color(0xFFFCFCFC),
  ].obs;
  @override
  void onInit(){
    searchController = TextEditingController();
    super.onInit();

  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  void onClose() {
    super.onClose();
  }

  void changeCurTab(int index){
    curTab.value = index;
  }


}
