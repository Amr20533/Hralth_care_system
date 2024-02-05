import 'package:co_rhema/constants.dart';
import 'package:co_rhema/core/class/status_request.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({required this.widget,required this.request,Key? key}) : super(key: key);
  final StatusRequest request;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: request == StatusRequest.LOADING
          ?
      Center(child: Lottie.asset(ImageAsset.loading,width: 200.w,height: 200.w))
      : request == StatusRequest.OFFLINEFAILURE ?
      Center(child: Lottie.asset(ImageAsset.offline,width: 280.w,height: 280.w),)
      :
      request == StatusRequest.SERVERFAILURE || request == StatusRequest.EXCEPTIONFAILURE ?
      Center(child: Lottie.asset(ImageAsset.server,width: 200.w,height: 200.w))
    :
      request == StatusRequest.FAILURE ?
      Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(ImageAsset.noData,width: 280.w,height: 280.w,repeat: true),
            Text('246'.tr,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kDocGreyColor.withOpacity(0.6),fontWeight: FontWeight.w400),),
          ],
        ),
      )
          :
          widget
    );
  }
}
