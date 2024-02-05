import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SideBarWidget extends StatelessWidget {
  const SideBarWidget({
    required this.onTap,required this.color,required this.image,
    super.key,
  });

  final void Function()? onTap;
  final Color color;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,height:50.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: color,
        ),
        child: SvgPicture.asset(image,color: Colors.white,width: 20.w,height: 20.h,),
      ),
    );
  }
}
