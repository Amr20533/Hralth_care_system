import 'package:co_rhema/User/views/doc/views/widgets/side_bar_widget.dart';
import 'package:co_rhema/User/views/handling_data_view.dart';
import 'package:co_rhema/User/views/home/widgets/custom_form_field.dart';
import 'package:co_rhema/User/views/home/widgets/doc_widgets/doc_home_header.dart';
import 'package:co_rhema/User/views/home/widgets/doc_widgets/username_box.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/Doctor/home/doc_management_home_controller.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:co_rhema/core/localization/change_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class DocManHomeScreen extends StatelessWidget {
  const DocManHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController lController = Get.put(LocalController());
    bool isRTL = lController.language.languageCode.toLowerCase() == 'ar';

    Get.put(DocManagementHomeController());
    return Scaffold(
      body:GetBuilder<DocManagementHomeController>(builder: (controller){
        return HandlingDataView(request:controller.statusRequest ,
          widget: Container(width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: kDocGradientColor
          ),
          child: Obx(()=>Stack(alignment: Alignment.centerLeft,
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                width: 60.w,height: 600.h,
                // color: Colors.yellow,

                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SideBarWidget(onTap: (){controller.curTab.value = 0;}, color: controller.curTab.value == 0 ? kDocActiveIconColor : Colors.transparent, image: ImageAsset.home),
                    SideBarWidget(onTap: (){controller.curTab.value = 1;}, color: controller.curTab.value == 1 ? kDocActiveIconColor : Colors.transparent, image: ImageAsset.calender),
                    SideBarWidget(onTap: (){controller.curTab.value = 2;}, color: controller.curTab.value == 2 ? kDocActiveIconColor : Colors.transparent, image: ImageAsset.messagingSec),
                    SideBarWidget(onTap: (){controller.curTab.value = 3;}, color: controller.curTab.value == 3 ? kDocActiveIconColor : Colors.transparent, image: ImageAsset.chart),
                    SideBarWidget(onTap: (){controller.curTab.value = 4;}, color: controller.curTab.value == 4 ? kDocActiveIconColor : Colors.transparent, image: ImageAsset.settings),
                    GestureDetector(
                      onTap:(){
                        controller.logoutClicked();
                        controller.doctorLogout().then((loggedOut){
                          if(loggedOut == true){
                            // controller.logoutClicked();
                            Get.offAllNamed(AppRoutes.doctorsLogin);
                            debugPrint("Successfully LoggedOut");
                          }else{
                            // controller.clicked = loggedOut;
                            debugPrint("Failed to Log out");
                          }

                        });
                      },
                      child: Container(
                        width: 50.w,height:50.h,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.w),
                          color: controller.clicked? kDocActiveIconColor : Colors.transparent,
                        ),
                        child: SvgPicture.asset(ImageAsset.logout,color: Colors.white,width: 15.w,height: 15.h,),
                      ),
                    ),
                  ],
                ),),
              Container(
                width: double.infinity,height: MediaQuery.of(context).size.height,
                margin: isRTL ? EdgeInsets.only(right:800.w * 0.122) : EdgeInsets.only(left:800.w * 0.122),
                padding: EdgeInsets.symmetric(horizontal:800.w * 0.04,vertical:800.w * 0.03, ),
                decoration: BoxDecoration(
                  color:kDocColorsLightGrey,
                  borderRadius:isRTL ? BorderRadius.only(topRight: Radius.circular(800.w * 0.062),bottomRight: Radius.circular(800.w * 0.062),) : BorderRadius.only(topLeft: Radius.circular(800.w * 0.062),bottomLeft: Radius.circular(800.w * 0.062)),
                ),
                child: controller.screen[controller.curTab.value],
              )

              // HandlingDataView(request:controller.statusRequest ,
              //   widget: ListView.builder(
              //     itemCount: controller.data.length,
              //     itemBuilder: (context,index) {
              //       return controller.data[index]['id'] == controller.getDocId() ? Text('${controller.data[index]['name']}') : const Text('');
              //     },
              //
              //
              //   ) ,)
            ],
          ))),
        );

      }),

        // if(controller.statusRequest == StatusRequest.LOADING){
        //   return const Center(child: CircularProgressIndicator(),);
        // }else if(controller.statusRequest == StatusRequest.OFFLINEFAILURE){
        //   return const Center(child: Text('OFFLINE FAILURE'),);
        // }else if(controller.statusRequest == StatusRequest.SERVERFAILURE){
        //   return const Center(child: Text('SERVER FAILURE'),);
        // }else if(controller.statusRequest == StatusRequest.FAILURE){
        //   return const Center(child: Text('GET DATA FAILURE!!'),);
        // }else{
        //   return ListView.builder(
        //     itemCount: controller.data.length,
        //     itemBuilder: (context,index) {
        //       return Text('${controller.data}');
        //     },
        //
        //   );
        // }
      // }),
    );
  }
}

