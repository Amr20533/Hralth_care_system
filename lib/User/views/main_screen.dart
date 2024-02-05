import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/home/main_screen_controller.dart';
import 'package:co_rhema/User/views/main/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
class MainScreen extends GetView<MainScreenController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MainScreenController());

    return Obx(()=> Scaffold(
        backgroundColor: controller.bgColors[controller.curTab.value],
        body:  SafeArea(child: controller.screen[controller.curTab.value]),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 65.w,
            padding: EdgeInsets.fromLTRB(18.0.w, 5.h, 0, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 18,
                  offset: const Offset(-8, -8),
                  color: const Color(0XFF797979).withOpacity(0.1),
                )
              ],
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.circular(20.w),
              //   topLeft: Radius.circular(14.w),
              // ),
            ),
            child: Row(
              children: [
                BottomNavWidget(
                  onTap: () {
                    controller.curTab.value = 0;
                  },
                  title: "Home",
                  icon: controller.curTab.value == 0
                      ? FontAwesome.home
                      : FontAwesome.home,
                  color: controller.curTab.value == 0 ? myBlueColor : Colors.grey,
                ),
                BottomNavWidget(
                  onTap: () {
                    controller.curTab.value = 1;
                  },
                  title: "Explore",
                  icon: controller.curTab.value == 1
                      ? MaterialIcons.location_pin
                      : Icons.location_pin,
                  color: controller.curTab.value == 1 ? myBlueColor : Colors.grey,
                ),
                BottomNavWidget(
                  onTap: () {
                    controller.curTab.value = 2;
                  },
                  title: "Bookings",
                  icon: controller.curTab.value == 2
                      ? Icons.date_range
                      : Icons.date_range_outlined,
                  color: controller.curTab.value == 2 ? myBlueColor : Colors.grey,
                ),
                BottomNavWidget(
                  onTap: () {
                    controller.curTab.value = 3;
                  },
                  title: "Chat",
                  icon: controller.curTab.value == 3 ? Icons.chat : Icons.chat_outlined,
                  color: controller.curTab.value == 3 ? myBlueColor : Colors.grey,
                ),
                BottomNavWidget(
                  onTap: () {
                    controller.curTab.value = 4;
                  },
                  title: "Profile",
                  icon: controller.curTab.value == 4 ? Ionicons.person : Ionicons.person_outline,
                  color: controller.curTab.value == 4 ? myBlueColor : Colors.grey,
                ),
              ],
            ),
          ),
          Positioned(
            top: -10,
            left:curPos(controller.curTab.value),
            // right: controller.curTab.value == 0 ? 120.5.w * 2 : 1,
            // (controller.curTab.value * 92.w) , // Adjust the positioning
            // right: controller.curTab.value == 0 ? (controller.curTab.value *  30.2.w) : 0, // Adjust the positioning
            child: Container(
              height: 18.h,
              width: 18.w,
              margin:controller.curTab.value == 0 ?  EdgeInsets.only(left: 33.w) : null,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: myBlueColor,
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
  curPos(int pos){
    switch(pos){
      case 0:
        return (pos * 92.w);
      case 1:
        return (pos * 92.w);
      case 2:
        return (pos * 76.6.w);
      case 3:
        return (pos * 71.1.w);
      case 4:
        return (pos * 68.2.w);
      // case 5:
      //   return (pos * 71.2.w);

    }
  }
}
/*
            Container(
          height: 75.w,
              padding: EdgeInsets.all(12.0.h),
              margin: EdgeInsets.only(right: 18.0.w),
              // padding: EdgeInsets.fromLTRB(18.0.w,10.0.w,18.0.w,28.0.w),
          decoration: BoxDecoration(color: Colors.white,
              boxShadow: [BoxShadow(
                blurRadius: 22,offset:const Offset(-4,-4),
                color:const Color(0XFF797979).withOpacity(0.1),
              )],
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.w),topLeft: Radius.circular(14.w))),
              child: Row(
                children: [
                  BottomNavWidget(onTap:(){
                    controller.curTab.value = 0;
                  } ,icon:controller.curTab.value  == 0? MaterialCommunityIcons.home: MaterialCommunityIcons.home_outline,color: controller.curTab.value == 0 ? myBlueColor : Colors.grey ),
                  BottomNavWidget(onTap:(){
                    controller.curTab.value = 1;
                  } ,icon:controller.curTab.value  == 1 ? Ionicons.search : Ionicons.search_outline,color: controller.curTab.value == 1 ? myBlueColor : Colors.grey ),
                  BottomNavWidget(onTap:(){                      controller.curTab.value  = 2;
                  } ,icon:controller.curTab.value  == 2 ? Ionicons.heart : Ionicons.heart_circle_outline,color: controller.curTab.value == 2 ? myBlueColor : Colors.grey ),
                  BottomNavWidget(onTap:(){
                    controller.curTab.value  = 3;
                  } ,icon:controller.curTab.value  == 3 ? Ionicons.cart : Ionicons.cart_outline,color: controller.curTab.value == 3 ? myBlueColor : Colors.grey ),
                  BottomNavWidget(onTap:(){
                    controller.curTab.value  = 4;
                  } ,icon:controller.curTab.value  == 4 ? Ionicons.person : Ionicons.person_outline, color: controller.curTab.value == 4 ? myBlueColor : Colors.grey  ,),
                ],
              ),
            ),

                        BottomNavigationBar(
                selectedItemColor: myBlueColor,unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,showSelectedLabels: true,
                selectedFontSize: 11.w,
                currentIndex: controller.curTab.value,
                onTap: (index){
                  controller.changeCurTab(index);
                },
                items: [
             BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home") ,
             BottomNavigationBarItem(icon: Icon(MaterialIcons.location_pin),label: "explore") ,
             BottomNavigationBarItem(icon: Icon(Icons.date_range_outlined),label: "Bookings") ,
             BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Chat") ,
             BottomNavigationBarItem(icon: Icon(MaterialIcons.person),label: "Profile") ,
            ]
            ),


* */
