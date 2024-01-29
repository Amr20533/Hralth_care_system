import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsernameBox extends StatelessWidget {
  final Color color,borderColor;
  final double width,height;
  const UsernameBox({super.key, required this.color,required this.borderColor,required this.width,required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:12.w/4,right:12.w/3),
      padding: EdgeInsets.all(2.w),
      width: width,height: height,
      decoration: BoxDecoration(
          border: Border.all(color:borderColor,width: 1.w),
          shape: BoxShape.circle),
      child:DecoratedBox(
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
        child: Text('SM',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight:FontWeight.w400,fontSize: 16.w)),
      ),
    );
  }
}
