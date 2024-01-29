import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleBox extends StatelessWidget {
  const ScheduleBox({super.key,required this.onPressed,required this.text,required this.hintText});
  final String text,hintText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,height: 28.w,
      padding: EdgeInsets.only(left: 12.0.w),
      margin: EdgeInsets.only(top: 10.0.w),
      // margin: EdgeInsets.only(left: 10.0.w,right: 13.0.w,top: 10.0.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0XFFF5F5F5),
        border: Border.all(width:1, color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(18.0.w),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              maxLines: null, // Set maxLines to null for a multiline text input
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only( bottom: 16.w),
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.9),fontSize: 10.0.w,fontWeight: FontWeight.w500),
              ),
            ),
          ),
          TextButton(onPressed: onPressed,
            child:Text(text,style: TextStyle(color: myBlueColor,fontSize: 11.0.w,),) ,),
        ],
      ),
    );
  }
}
