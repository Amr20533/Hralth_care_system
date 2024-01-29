import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DotColor extends StatelessWidget {
  final Color color;
  final double width,height;
  bool isSelected;
  DotColor({super.key, this.isSelected=false,required this.color,required this.width,required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:12.w/4,right:12.w/3),
      padding: EdgeInsets.all(4.w),
      width: width,height: height,
      decoration: BoxDecoration(
          border: Border.all(color:isSelected?color:const Color(0XFF838383).withOpacity(0.4)),
          shape: BoxShape.circle),
      child:DecoratedBox(
        decoration: BoxDecoration(
            color: isSelected ? color : Colors.transparent,
            shape: BoxShape.circle
        ),
      ),
    );
  }
}