import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    super.key,required this.text,required this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
      height: 80.w,padding: EdgeInsets.fromLTRB(18.0.w,12.0.w,18.0.w,28.0.w),
      decoration: BoxDecoration(color: Colors.white,
          boxShadow: [BoxShadow(
            blurRadius: 22,offset:const Offset(-4,-4),
            color:const Color(0XFF797979).withOpacity(0.1),
          )],
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.w),topLeft: Radius.circular(14.w))),
      child:GestureDetector(
        onTap: onTap,
        child: Container(width: 280.w,height: 44.w,
          // margin: EdgeInsets.symmetric(horizontal: 7.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: myBlueColor,
            borderRadius: BorderRadius.circular(20.0.w),
          ),
          child: Center(
            child: Text(text,style: TextStyle(color: Colors.white,fontSize: 15.w,fontWeight: FontWeight.w400),),
          ),
        ),
      ) ,);
  }
}