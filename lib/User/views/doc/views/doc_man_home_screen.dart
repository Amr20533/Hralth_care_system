import 'package:co_rhema/User/views/handling_data_view.dart';
import 'package:co_rhema/User/views/home/widgets/custom_form_field.dart';
import 'package:co_rhema/User/views/home/widgets/doc_widgets/doc_home_header.dart';
import 'package:co_rhema/User/views/home/widgets/doc_widgets/username_box.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/Doctor/home/doc_management_home_controller.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class DocManHomeScreen extends StatelessWidget {
  const DocManHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DocManagementHomeController());
    return Scaffold(
      body:GetBuilder<DocManagementHomeController>(builder: (controller){
        return HandlingDataView(request:controller.statusRequest ,
          widget: Container(width: double.infinity,
          height: 1000.h,
          decoration: const BoxDecoration(
            gradient: kDocGradientColor
          ),
          child: Stack(alignment: Alignment.centerLeft,
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
              width: 60.w,height: 600.h,
                // color: Colors.yellow,

              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60.w,height:60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: kDocActiveIconColor,
                    ),
                    child: SvgPicture.asset(ImageAsset.messagingSec,color: Colors.white,width: 20.w,height: 20.h,),
                  ),
                  Container(
                    width: 60.w,height:60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: kDocActiveIconColor,
                    ),
                    child: SvgPicture.asset(ImageAsset.calender,color: Colors.white,width: 20.w,height: 20.h,),
                  ),
                  Container(
                    width: 60.w,height:60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: kDocActiveIconColor,
                    ),
                    child: SvgPicture.asset(ImageAsset.messagingSec,color: Colors.white,width: 20.w,height: 20.h,),
                  ),
                  Container(
                    width: 60.w,height:60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: kDocActiveIconColor,
                    ),
                    child: SvgPicture.asset(ImageAsset.chart,color: Colors.white,width: 15.w,height: 15.h,),
                  ),
                  Container(
                    width: 60.w,height:60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: kDocActiveIconColor,
                    ),
                    child: SvgPicture.asset(ImageAsset.settings,color: Colors.white,width: 15.w,height: 15.h,),
                  ),
                  GestureDetector(
                    onTap:(){
                      controller.doctorLogout().then((loggedOut){
                        if(loggedOut == true){
                          debugPrint("Successfully LoggedOut");
                        }else{
                          debugPrint("Failed to Log out");
                        }

                      });
                    },
                    child: Container(
                      width: 60.w,height:60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.w),
                        // color: kDocActiveIconColor,
                      ),
                      child: SvgPicture.asset(ImageAsset.logout,color: Colors.white,width: 15.w,height: 15.h,),
                    ),
                  ),
                ],
              ),),

              Container(
                width: double.infinity,height: 1000.h,
                margin: EdgeInsets.only(left:800.w * 0.122),
                padding: EdgeInsets.symmetric(horizontal:800.w * 0.04,vertical:800.w * 0.03, ),
                decoration: BoxDecoration(
                    color:kDocColorsLightGrey,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(800.w * 0.062),bottomLeft: Radius.circular(800.w * 0.062),)
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DocHomeHeader(controller:controller,image: 'assets/images/docs/doctor_1.svg',searchController: controller.searchController),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 18.0.h),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for(int i = 0; i< controller.data.length; i++)...[
                                if(controller.data[i]['id'] == controller.getDocId())...[

                                  RichText(text: TextSpan(children: [
                                    TextSpan(text: "137".tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500)),
                                    TextSpan(text: "149".tr +  " ${controller.data[i]['name']} !",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kDocColorsDarkBlue,fontWeight:FontWeight.bold,fontSize: 24.w)),
                                  ]),),

                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20.h),
                                    // margin: EdgeInsets.only(left: 24, bottom: 40),
                                    height: 245.h,
                                    width: 602.w,
                                    decoration: BoxDecoration(
                                      gradient: kDocCardGradientColor,
                                      borderRadius: BorderRadius.all(Radius.circular(14.w)),
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 15.w,
                                          left: 20.w,
                                          right: 0,
                                          child: Container(
                                            height: 221,
                                            // decoration: BoxDecoration(
                                            //   color: Colors.white,
                                            //   borderRadius: BorderRadius.circular(12.w),
                                            //   // boxShadow: [
                                            //   //   BoxShadow(
                                            //   //     offset: const Offset(0, 10),
                                            //   //     blurRadius: 33,
                                            //   //     color: kShadowColor,
                                            //   //   ),
                                            //   // ],
                                            // ),
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                RichText(text: TextSpan(children: [
                                                  TextSpan(text: "136".tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 22.w)),
                                                  TextSpan(text: "\n104 ",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 52.w,)),
                                                ]),),

                                                Padding(
                                                  padding: EdgeInsets.only(top:18.0.h),
                                                  child: Row(
                                                    children: [
                                                      Container(width: 220.w,height: 100.h,
                                                        // padding: EdgeInsets.only(top: 5.h,bottom:5.h,left: 16.w),
                                                        margin: EdgeInsets.only(right: 16.w),

                                                        decoration: BoxDecoration(
                                                          color: Colors.yellow,
                                                          borderRadius: BorderRadius.circular(12.w),
                                                          // boxShadow: [
                                                          //   BoxShadow(
                                                          //     offset: const Offset(0, 10),
                                                          //     blurRadius: 33,
                                                          //     color: kShadowColor,
                                                          //   ),
                                                          // ],
                                                        ),
                                                        child: Stack(alignment:AlignmentDirectional.centerStart,
                                                          children: [
                                                            Container(
                                                              width: 200.w,height: 100.h,
                                                              decoration: BoxDecoration(
                                                                color: kDocContainerColor,
                                                                borderRadius: BorderRadius.circular(12.w),
                                                                // boxShadow: [
                                                                //   BoxShadow(
                                                                //     offset: const Offset(0, 10),
                                                                //     blurRadius: 33,
                                                                //     color: kShadowColor,
                                                                //   ),
                                                                // ],
                                                              ),
                                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Text('138'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontSize: 16.w,fontWeight: FontWeight.w500),),
                                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Text('40',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontSize: 33.w,fontWeight: FontWeight.w500),),
                                                                      Container(
                                                                        width: 60.w,height: 25.h,
                                                                        padding:EdgeInsets.symmetric(horizontal:4.w),
                                                                        decoration: BoxDecoration(
                                                                          color: kDocArrowLightGreenColor,
                                                                          borderRadius: BorderRadius.circular(8.w),
                                                                          // boxShadow: [
                                                                          //   BoxShadow(
                                                                          //     offset: const Offset(0, 10),
                                                                          //     blurRadius: 33,
                                                                          //     color: kShadowColor,
                                                                          //   ),w
                                                                          // ],
                                                                        ),
                                                                        child: Row(
                                                                          children: [
                                                                            Text('51%',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kDocArrowGreenColor,fontSize: 16.w,fontWeight: FontWeight.w400),),
                                                                            SvgPicture.asset(ImageAsset.chartArrowUp,color: kDocArrowGreenColor,width: 12.w,height: 12.h,),

                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ),
                                                      Container(width: 180.w,height: 90.h,
                                                        padding: EdgeInsets.only(top: 5.h,bottom:5.h,left: 16.w),
                                                        decoration: BoxDecoration(
                                                          color: kDocSecContainerColor,
                                                          borderRadius: BorderRadius.circular(12.w),
                                                          // boxShadow: [
                                                          //   BoxShadow(
                                                          //     offset: const Offset(0, 10),
                                                          //     blurRadius: 33,
                                                          //     color: kShadowColor,
                                                          //   ),
                                                          // ],
                                                        ),
                                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Text('139'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
                                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text('40',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontSize: 33.w,fontWeight: FontWeight.w500),),
                                                                Container(
                                                                  width: 60.w,height: 25.h,
                                                                  padding:EdgeInsets.symmetric(horizontal:4.w),
                                                                  decoration: BoxDecoration(
                                                                    color: kDocBorderLightRedColor,
                                                                    borderRadius: BorderRadius.circular(8.w),
                                                                    // boxShadow: [
                                                                    //   BoxShadow(
                                                                    //     offset: const Offset(0, 10),
                                                                    //     blurRadius: 33,
                                                                    //     color: kShadowColor,
                                                                    //   ),
                                                                    // ],
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Text('20%',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kDocArrowRedColor,fontSize: 16.w,fontWeight: FontWeight.w400),),
                                                                      const Spacer(),
                                                                      SvgPicture.asset(ImageAsset.chartArrowDown,color: kDocArrowRedColor,width: 16.w,height: 16.h,),

                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          'assets/images/docs/doctor_1.svg',fit: BoxFit.fill,
                                          width: 150.w,height: 150.h,color: Colors.redAccent,
                                        ),

                                      ],
                                    ),
                                  ),

                                  ///Consutation Box
                                  Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.h),
                                  // margin: EdgeInsets.only(left: 24, bottom: 40),
                                  height: 245.h,
                                  width: 602.w,
                                  decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(14.w)),
                                  ),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                            children:[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("135".tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 20.w)),
                                                  Row(
                                                    children: [
                                                      Text("148".tr,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kShadowColor,fontWeight:FontWeight.w400,fontSize: 14.w)),
                                                      // SizedBox(width: 5.w),
                                                      SvgPicture.asset(ImageAsset.arrowDown,color: kShadowColor,width: 18.w,height: 18.h,),
                                                    ],
                                                  ),
                                                ],),
                                              // const Spacer(flex: 2),
                                              Container(
                                                width: 260.w,height: 40.h,color:Colors.blue,
                                                child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                                                  children:[
                                                    UsernameBox(color:kDocCircularLightRedColor,borderColor: kDocCircularLightRedColor,width: 80.w,height: 80.h,),
                                                    SizedBox(width: 5.w),
                                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Stacy Mitchell",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 18.w)),
                                                        Text("Weekly Visit",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kDocDarkRedTextColor,fontWeight:FontWeight.w400,fontSize: 12.w)),
                                                      ],
                                                    ),
                                                    SizedBox(width: 15.w),
                                                    Container(
                                                      width: 55.w,height: 20.h,
                                                      decoration:BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4.w),
                                                        color: kDocCircularLightRedColor,
                                                      ),
                                                      child: Text('9 : 15 AM',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kDocDarkRedTextColor,fontWeight:FontWeight.bold,fontSize: 11.w)),
                                                    ),
                                                  ]
                                                ),
                                              ),
                                              // const Spacer(flex: 1),
                                            ]
                                          ),
                                        ),
                                              ////
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[
                                                Text("140".tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 20.w)),
                                                // const Spacer(flex: 2),
                                                Container(
                                                  width: 260.w,height: 200.h,
                                                  decoration: BoxDecoration(
                                                  border: Border.all(color:Color(0XFFC3E4F3),width: 1.w)
                                                  ),
                                                  child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                                                      children:[
                                                        UsernameBox(color:kDocCircularLightRedColor,borderColor: kDocCircularLightRedColor,width: 80.w,height: 80.h,),
                                                        SizedBox(width: 5.w),
                                                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("Stacy Mitchell",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 18.w)),
                                                            Text("Weekly Visit",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kDocDarkRedTextColor,fontWeight:FontWeight.w400,fontSize: 12.w)),
                                                          ],
                                                        ),
                                                        SizedBox(width: 15.w),
                                                        Container(
                                                          width: 55.w,height: 20.h,
                                                          decoration:BoxDecoration(
                                                            borderRadius: BorderRadius.circular(4.w),
                                                            color: kDocCircularLightRedColor,
                                                          ),
                                                          child: Text('9 : 15 AM',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kDocDarkRedTextColor,fontWeight:FontWeight.bold,fontSize: 11.w)),
                                                        ),
                                                      ]
                                                  ),
                                                ),
                                                // const Spacer(flex: 1),
                                              ]
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                ]
                              ]

                            ],
                          ),
                        ),
                        const Spacer(flex: 1,),
                        Column(
                          children: [

                          ],
                        ),
 //                       Expanded(
 //                          child: Column(
 //                            children: [
 //
 //                            ],
 //                          ),
 //                        ),

                      ],
                    )

                  ],
                ),
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
          ),
        ));

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
