import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<bool> appExitAlert(){
  Get.defaultDialog(
    title: "249".tr,
    titleStyle: TextStyle(color: Colors.redAccent,fontSize: 14.w),
    middleText: "247".tr,
    actions: [
      ElevatedButton(onPressed: (){exit(0);},
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: Colors.grey[100]!),),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.w), // Adjust the radius as needed
            ),),
        ),
        child: Text("248".tr),
      ),
      ElevatedButton(onPressed: (){
        Get.back();
      },
        style: ButtonStyle(
          // textStyle: MaterialStateProperty.all(TextStyle(color: const Color(0XFF0165FC).withOpacity(0.8),fontSize: 14.w,fontWeight: FontWeight.w500)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          // foregroundColor: MaterialStateProperty.all(const Color(0XFF0165FC).withOpacity(0.8)),
          side: MaterialStateProperty.all(BorderSide(color: const Color(0XFF0165FC).withOpacity(0.8),width: 2),),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.w),
            ),),
        ),
        child: Text("93".tr,style: TextStyle(color: const Color(0XFF0165FC).withOpacity(0.8),fontSize: 14.w,fontWeight: FontWeight.w500),),
      ),
    ],
  );
  return Future.value(true);
}


