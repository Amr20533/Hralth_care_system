import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 8.0.w),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                      children: [
                        IconCircle(onTap:(){Get.back();},icon: AntDesign.arrowleft,),
                        const Spacer(flex: 2,),
                        Text('98'.tr,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
                        const Spacer(flex: 3,),
                      ],),
                    SizedBox(height: 25.h,),
                    Text('99'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: myBlueColor.withOpacity(0.8),fontWeight: FontWeight.w600),),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text('100'.tr,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: const Color(0XFF797979),fontSize: 12.w,fontWeight: FontWeight.normal),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h,top: 8.h),
                      child: Text('101'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: myBlueColor.withOpacity(0.8),fontWeight: FontWeight.w600),),
                    ),
                    for(int i = 0; i < 6; i++ )...[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Text('102'.tr,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: const Color(0XFF797979),fontSize: 12.w,fontWeight: FontWeight.normal),),
                      ),

                    ],
                  ]),
            ),
          )
      ),
    );
  }
}
