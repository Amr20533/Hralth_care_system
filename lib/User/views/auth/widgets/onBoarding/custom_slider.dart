import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/OnBoardingController.dart';
import 'package:co_rhema/core/localization/change_local.dart';
import 'package:co_rhema/User/utils/data_source/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController lController = Get.put(LocalController());
    bool isRTL = lController.language!.languageCode.toLowerCase() == 'ar';

    return PageView.builder(
        controller: controller.pageController,
        itemCount: onBoardingList.length,
        onPageChanged: (value){
          controller.onPageChanged(value);
        },
        itemBuilder: (context, i) => Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                onBoardingList[i].image!,
                width: 230.w,
                height: 230.h,
                fit: BoxFit.fill,
              ),
               SizedBox(height: 20.h),
              // Text(onBoardingList[i].title!,
              //     style: const TextStyle(
              //         fontWeight: FontWeight.bold, fontSize: 20)),
              isRTL ? RichText(textAlign: TextAlign.center,
                  text: TextSpan(
                      children:[
                        TextSpan(text: arOnBoardingList[i].title ?? '',style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.w,color: Colors.black)),
                        TextSpan(text: arOnBoardingList[i].subTitle ?? '',style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.w,color: myBlueColor)),
                        TextSpan(text: arOnBoardingList[i].text ?? '',style: onBoardingList[i].text!.isNotEmpty ? TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.w,color: Colors.black) : null),

                      ])): RichText(textAlign: TextAlign.center,
                  text: TextSpan(
                  children:[
                TextSpan(text: onBoardingList[i].title ?? '',style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.w,color: Colors.black)),
                TextSpan(text: onBoardingList[i].subTitle ?? '',style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.w,color: myBlueColor)),
                TextSpan(text: onBoardingList[i].text ?? '',style:onBoardingList[i].text!.isNotEmpty ?  TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.w,color: Colors.black): null),

              ])),
              SizedBox(height: 14.h),

              Container(
                  width: 200.w,
                  alignment: Alignment.center,
                  child: Text(
                    isRTL ? arOnBoardingList[i].body! : onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                        height: 1.5,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        fontSize: 12.w),
                  )),
            ],
          ),
        ));
  }
}