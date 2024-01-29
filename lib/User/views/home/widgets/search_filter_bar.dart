import 'package:co_rhema/User/views/home/widgets/custom_form_field.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/shares/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({
    required this.controller,
    super.key,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          CustomFormField(
            width:325.w * 0.793,
            // width:325.w * 0.821,
            height: 40.h,
            // CustomFormField(width:230.w,height: 40.h,
            borderRadius: BorderRadius.circular(8.0.w),

            // validator: (String? search){return null;},
            // onEditingComplete: (){},
            controller: controller,focusBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: myBlueColor, width: 2.0),
            borderRadius: BorderRadius.circular(8.0.w),
          ),
            hintText: "106".tr,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 6.0.w),
              child: Icon(AntDesign.search1,color: Colors.blue[500],size: 12.w,),
            ),),
          SizedBox(width: 8.0.w,),
          // const Spacer(flex: 1,),
          GestureDetector(
            onTap: (){
              Get.toNamed(AppRoutes.filter);
            },
            child: Container(width: 32.w,height: 32.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: myBlueColor,
                  borderRadius: BorderRadius.circular(4.0.w)
              ),
              child: Center(child: Icon(IconBroken.Filter,color: Colors.white,size: 22.w,)),
            ),
          ),
          // const Spacer(flex: 1,),

        ]
    );
  }
}
