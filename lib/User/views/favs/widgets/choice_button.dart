import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceButton extends StatelessWidget {
  ChoiceButton({Key? key,required this.text,required this.color,required this.width,required this.height,required this.tColor,required this.onTap,this.cancel = false}) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final Color color,tColor;
  final double width,height;
  bool cancel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(22.w),
            // border: cancel?Border.all(color: Colors.grey,width: 1):null
        ),
        child: Text(text,style:TextStyle(color: tColor,fontSize: 14.w,fontWeight: FontWeight.w500)),
      ),
    );
  }
}
