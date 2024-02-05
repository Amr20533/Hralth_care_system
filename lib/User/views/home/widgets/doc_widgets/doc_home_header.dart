import 'package:co_rhema/constants.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:co_rhema/core/localization/change_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class DocHomeHeader extends StatelessWidget {
  const DocHomeHeader({required this.searchController,required this.controller, required this.image,
    super.key,
  });
  final String image;
  final dynamic controller;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    LocalController lController = Get.put(LocalController());
    bool isRTL = lController.language.languageCode.toLowerCase() == 'ar';

    return Row(
      children: [
        Container(
            width:MediaQuery.of(context).size.width * 0.45,
            // width:325.w * 0.821,
            height: 48.h,alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kDocSearchBarColor,
              borderRadius: BorderRadius.circular(10.0.w),
            ),
            child: TextField(
              controller: searchController,
              // onEditingComplete: onEditingComplete,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "106".tr,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 6.0.w),

                    // child: SvgPicture.asset(ImageAsset.search,color: const Color(0XFFA2A3A4),),
                    child: Icon(AntDesign.search1,color: const Color(0XFFA2A3A4),size: 16.w,),
                  ),
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.grey[100]!),
                  //   borderRadius: BorderRadius.circular(12.0.w), // Set the desired border radius
                  // ),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 10),
                  // focusedBorder:focusBorder,
                  hintStyle: appStyle(13.w,const Color(0XFFA2A3A4), FontWeight.w500),
                  // contentPadding: EdgeInsets.zero,
                  suffixIconColor: Colors.black
              ),
            )
        ),
        const Spacer(),
        Row(
          children: [
            // IconButton(onPressed: (){},icon: const Icon(Icons.message)),
            IconButton(onPressed: (){},icon: SvgPicture.asset(ImageAsset.messaging,width: 50.w,height: 50.w,)),
            SizedBox(width: 20.w,),
            // IconButton(onPressed: (){},icon: const Icon(Icons.notification_add)),
            IconButton(onPressed: (){},icon: SvgPicture.asset(ImageAsset.activeNotification,width: 48.w,height: 48.h,)),
            SizedBox(width: 20.w,),
            Container(
              width: 120.w,height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              decoration: BoxDecoration(
                color:Colors.transparent,
                border: Border.all(width: 1.0.w,color: const Color(0XFFE1E1E1)),
                borderRadius: BorderRadius.circular(16.w),
              ),
              child: isRTL ? Row(
                children: [
                  for(int i = 0; i < controller.data.length; i++)...[
                    if(controller.data[i]['id'] == controller.getDocId())
                      Text(controller.data[i]['name'],style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold,fontSize: 11.sp,color: Colors.black),)
                  ],
                  const Spacer(),

                  SvgPicture.asset(
                    image,
                    fit: BoxFit.cover,width: 15.w,height: 15.h,
                  ),
                  // Container(
                  //   width: 25.w,height: 25.h,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: NetworkImage(image!)
                  //       )
                  //   ),
                  // ),

                ],
              ) : Row(
                children: [
                  SvgPicture.asset(
                    image,
                    fit: BoxFit.cover,width: 15.w,height: 15.h,
                  ),
                  // Container(
                  //   width: 25.w,height: 25.h,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: NetworkImage(image!)
                  //       )
                  //   ),
                  // ),
                  const Spacer(),
                  for(int i = 0; i < controller.data.length; i++)...[
                    if(controller.data[i]['id'] == controller.getDocId())
                      Text(controller.data[i]['name'],style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold,fontSize: 10.w,color: Colors.black),)
                  ]
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
