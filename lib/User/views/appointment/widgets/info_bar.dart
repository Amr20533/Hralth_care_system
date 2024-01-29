import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InfoBar extends StatelessWidget {
  const InfoBar({
    required this.leading,
    required this.ending,
    super.key,
  });
  final String leading;
  final String ending;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:16.0.h,),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leading,style:Theme.of(context).textTheme.titleMedium!.copyWith(color:const Color(0XFF838383),fontSize: 13.w,fontWeight: FontWeight.w500)),
          Text(ending,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,fontSize: 14.w),),
        ],),);
  }
}
