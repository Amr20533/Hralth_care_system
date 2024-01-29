import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/modules/packages.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/User/views/appointment/package_screen.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/appointment/widgets/info_bar.dart';
import 'package:co_rhema/User/views/appointment/widgets/package_card.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class UserAppointmentScreen extends StatelessWidget {
  UserAppointmentScreen({Key? key}) : super(key: key);
  List<Specialist> phs = Specialist.physicians;
  List<Package> package = Package.packages;

  @override
  Widget build(BuildContext context) {
    var start = DateFormat.jmz().format(DateTime.now());
    var end = DateFormat.jmz().format(DateTime.now().add(const Duration(minutes: 30)));
    return Scaffold(
      backgroundColor:const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 5.0.w),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDocCard(title:"63".tr, icon: AntDesign.arrowleft,),

                  // SizedBox(height:8.h),
                  SizedBox(width: 325.w,height: 100.w,
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 40.h,
                              backgroundImage:AssetImage(phs[0].image!),
                            ),
                            Positioned(bottom: 5,right: 0.0,
                                child: Icon(MaterialIcons.verified,color: myBlueColor,size: 18.w,))
                          ],
                        ),
                        SizedBox(width: 7.w,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(phs[0].title!,style: TextStyle(color: Colors.black,fontSize: 16.h,fontWeight: FontWeight.w500),),
                            SizedBox(height: 6.h,),
                            Text(phs[0].speciality!,style: TextStyle(color:const Color(0XFF838383),fontSize: 14.h,fontWeight: FontWeight.w400),),
                            SizedBox(height: 10.h,),
                            Row(
                              children: [
                                Icon(MaterialCommunityIcons.map_marker,color: myBlueColor,size: 16.w,),
                                SizedBox(width: 3.w,),
                                Text(phs[0].location!,style: TextStyle(color:const Color(0XFF797979),fontSize: 14.h,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5.w,),
                                Icon(MaterialCommunityIcons.map,color: myBlueColor,size: 16.w,),

                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0.h),
                    child: Container(color: const Color(0XFF838383),height: 0.4.w,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0.h,top: 15.h),
                    child: Text('64'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500,),),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom:16.0.h,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('73'.tr,style:Theme.of(context).textTheme.titleMedium!.copyWith(color:const Color(0XFF838383),fontSize: 13.w,fontWeight: FontWeight.w500)),
                        Text(DateFormat('MMM d yyy').format(DateTime.now()),style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,fontSize: 14.w),),
                      ],),),
                    Padding(
                    padding: EdgeInsets.only(bottom:16.0.h,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('72'.tr,style:Theme.of(context).textTheme.titleMedium!.copyWith(color:const Color(0XFF838383),fontSize: 13.w,fontWeight: FontWeight.w500)),
                        Text('$start - $end (30 minutes)',style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,fontSize: 12.w),),
                      ],),),
                  InfoBar(leading: '70'.tr,ending: "71".tr),
                  Padding(
                    padding: EdgeInsets.only(bottom: 22.0.h,top: 3.h),
                    child: Container(color: const Color(0XFF838383),height: 0.4.w,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0.h),
                    child: Text('65'.tr,style: TextStyle(color:Colors.black,fontSize: 18.h,fontWeight: FontWeight.w600),),
                  ),
                  InfoBar(leading: '69'.tr,ending: "Esther Howard"),
                  InfoBar(leading: '51'.tr,ending: "52".tr),
                  InfoBar(leading: '67'.tr,ending: "27"),
                  InfoBar(leading: '68'.tr,ending: "Lorem Ipsum dolor"),
                  Padding(
                    padding: EdgeInsets.only(bottom: 22.0.h,top: 3.h),
                    child: Container(color: const Color(0XFF838383),height: 0.4.w,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0.h),
                    child: Text('65'.tr,style: TextStyle(color:Colors.black,fontSize: 18.h,fontWeight: FontWeight.w600),),
                  ),
                  PackageCard(onTap:(){},hasInfo: true,
                      text: package[0].text!,subText: package[0].subText!,icon: package[0].icon!,duration: package[0].duration!,price: package[0].price!,isSelected:  false),


                ]),
          ),),),
      bottomNavigationBar: CustomBottomButton(text:'66'.tr,onTap:(){}),
    );
  }
}


