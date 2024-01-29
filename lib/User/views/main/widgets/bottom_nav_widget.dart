import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({required this.onTap,required this.icon,required this.title,required this.color,
    Key? key,
  }) : super(key: key);
  final void Function()? onTap;
  final IconData? icon;
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(height: 50.w, width: 49.w,margin: EdgeInsets.only(right: 11.w),alignment: Alignment.center,
        child:Column(
          children: [
            Icon(icon,color:color,size:20.w),
            SizedBox(height:3.h ,),
            Text(title,style:Theme.of(context).textTheme.titleSmall!.copyWith(color: color,fontSize: 11.w))
          ],
        ) ,),
    );
  }
}