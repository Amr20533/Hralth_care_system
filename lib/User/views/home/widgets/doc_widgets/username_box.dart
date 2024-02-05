import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsernameBox extends StatelessWidget {
  final Color color,borderColor;
  final String trimName;
  final double width,height;
  const UsernameBox({super.key, required this.color,required this.borderColor,required this.width,required this.height,required this.trimName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:12.w/3),
      padding: EdgeInsets.all(3.w),
      width: width,height: height,
      decoration: BoxDecoration(
          border: Border.all(color:borderColor,width: 1.w),
          shape: BoxShape.circle),
      child:Container(alignment: Alignment.center,
        width: width,height: height,
        padding: EdgeInsets.all(4.w),

        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
        child: Text(trimName,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight:FontWeight.w400,fontSize: width * 0.3)),
      ),
    );
  }
}
