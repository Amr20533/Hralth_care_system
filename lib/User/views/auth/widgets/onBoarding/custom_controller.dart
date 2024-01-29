import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/OnBoardingController.dart';
import 'package:co_rhema/User/utils/data_source/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller)=> Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ...List.generate(
        onBoardingList.length,
            (index) => AnimatedContainer(
            margin: EdgeInsets.only(right: 7.w),
            duration: const Duration(milliseconds: 900),
            width: controller.currentPage == index ? 12.w : 8.w,
            height: controller.currentPage == index ? 12.w : 8.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.currentPage == index ? myBlueColor : const Color(0xFFCBDFFE),
            // borderRadius: BorderRadius.circular(10)
        ),
    ))
    ],
    ));
  }
}