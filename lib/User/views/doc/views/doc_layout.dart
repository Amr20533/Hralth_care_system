import 'package:co_rhema/User/views/doc/views/widgets/doc_calender.dart';
import 'package:co_rhema/User/views/doc/views/widgets/enclosing_coming_patients.dart';
import 'package:co_rhema/User/views/doc/views/widgets/upcoming_visits.dart';
import 'package:co_rhema/User/views/doc/views/widgets/visit_box.dart';
import 'package:co_rhema/User/views/home/widgets/doc_widgets/doc_home_header.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/Doctor/home/doc_management_home_controller.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:co_rhema/core/localization/change_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DocLayout extends StatelessWidget {
  const DocLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController lController = Get.put(LocalController());
    bool isRTL = lController.language.languageCode.toLowerCase() == 'ar';
    initializeDateFormatting(lController.language.languageCode.toLowerCase(), null);

    Get.lazyPut(() => DocManagementHomeController());
    return GetBuilder<DocManagementHomeController>(builder: (controller){
      return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DocHomeHeader(controller:controller,image: ImageAsset.priDoc,searchController: controller.searchController),
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0.h),
                    child: Expanded(flex:3,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for(int i = 0; i< controller.data.length; i++)...[
                            if(controller.data[i]['id'] == controller.getDocId())...[

                              RichText(text: TextSpan(children: [
                                TextSpan(text: "137".tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500)),
                                TextSpan(text:  " ${"149".tr} ${controller.data[i]['name']} !",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kDocColorsDarkBlue,fontWeight:FontWeight.bold,fontSize: 24.w)),
                              ]),),

                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20.h),
                                padding: EdgeInsets.only(right: 20.w),
                                // margin: EdgeInsets.only(left: 24, bottom: 40),
                                height: MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                  // gradient: kDocDemoCardGradientColor,
                                  gradient: kDocCardGradientColor,
                                  borderRadius: BorderRadius.all(Radius.circular(14.w)),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: MediaQuery.of(context).size.height * 0.023,
                                      left: 10.w,
                                      right: 10.w,
                                      child: VisitBox(isRTL: isRTL),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: SvgPicture.asset(
                                        ImageAsset.priDoc,fit: BoxFit.fill,
                                        width: 280.w,height: 280.h,
                                      ),
                                    ),
                                    //

                                  ],
                                ),
                              ),

                              ///Consultation Box
                              Expanded(
                                child: EnclosingComingPatients(controller:controller, lController: lController),
                              ),
                            ]
                          ]

                        ],
                      ),
                    ),
                  ),
                  // const Spacer(flex: 1,),
                  Expanded(flex: 2,
                    child: Column(
                      children: [
                        Expanded(flex: 4,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                            // margin: EdgeInsets.only(left: 24, bottom: 40),
                            // height: MediaQuery.of(context).size.height * 0.6,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(14.w)),
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("144".tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 20.w)),
                                      IconButton(onPressed: (){},icon: SvgPicture.asset(ImageAsset.arrowDown,width: 16.w,height: 16.w,)),
                                    ],),
                                ),
                                DocCalender(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 18.w,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("162".tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 20.w)),
                                      TextButton(onPressed: (){},child: Text("146".tr,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kDocLightGreenTextColor,fontWeight:FontWeight.w400,fontSize: 14.w,decoration: TextDecoration.underline,decorationThickness: 1.0,textBaseline: TextBaseline.ideographic ))),
                                    ],),
                                ),
                                UpcomingVisitsBox(width: 45.w, height: 45.h, trimName: 'M', title: '145'.tr, status: '${formatDate(DateTime.now(), locale: lController.language.languageCode.toLowerCase())} | ${formatTime(DateTime.now(), locale: lController.language.languageCode.toLowerCase())}')
                              ],
                            ),
                          ),
                        ),
                        // Spacer(),
                        Expanded(flex: 2,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                            // margin: EdgeInsets.only(left: 24, bottom: 40),
                            // height: MediaQuery.of(context).size.height * 0.6,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(14.w)),
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 18.h,),
                                  child: SizedBox(
                                    width: 150.w,height: 38.h,
                                    child: Row(
                                      children: [
                                      Container(alignment: Alignment.center,
                                        // margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                                        margin: isRTL ? EdgeInsets.only(left: 10.w,) : EdgeInsets.only(right: 10.w,),
                                        height: 8.h,
                                        width: 8.w,
                                        decoration: const BoxDecoration(
                                          color: kDocCircularGreenColor,
                                          shape:BoxShape.circle
                                      ),),
                                        Text("147".tr,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 16.w)),
                                      ],),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 18.h,),
                                  child: Text("245".tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 22.w),maxLines: 2, overflow: TextOverflow.ellipsis,),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(26.w)),
                                      // image: DecorationImage(
                                      //     fit: BoxFit.cover,
                                      //   image: AssetImage(ImageAsset.equipment_2)
                                      // )
                                      // color: Colors.red,
                                    ),
                                    // child: Image.asset(ImageAsset.equipment_2,fit: BoxFit.cover,width: double.infinity,height: 100.h,),
                                    child:SvgPicture.asset(ImageAsset.equipment,fit: BoxFit.cover,width: double.infinity,height: 100.h,),
                                  ),
                                ),
                              
                          
                          ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //                       Expanded(
                  //                          child: Column(
                  //                            children: [
                  //
                  //                            ],
                  //                          ),
                  //                        ),

                ],
              ),
            )

          ],
        ),
      );
    });

  }
  String formatDate(DateTime date, {String locale = 'en'}) {
    final formatter = DateFormat('dd MMMM yyyy',locale);
    return formatter.format(date);
  }
  String formatTime(DateTime time, {String locale = 'en'}) {
    String formattedTime = DateFormat('h:mm a', locale).format(time);
    return formattedTime;
  }
}




