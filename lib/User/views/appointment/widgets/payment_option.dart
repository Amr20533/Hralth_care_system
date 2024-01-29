import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/appointment/widgets/dot_color.dart';
import 'package:co_rhema/User/views/home/widgets/special_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PaymentOption extends StatelessWidget {
  const PaymentOption({
    super.key,
    required this.text,required this.onTap,this.greyScale = false,required this.icon,required this.isSelected,
  });
  final bool isSelected;
  final String text;
  final bool greyScale;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 325.w,height: 50.w,alignment: Alignment.center,
        padding:EdgeInsets.symmetric(horizontal: 5.0.w),
        margin: EdgeInsets.only(bottom: 12.0.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0.w),
          boxShadow: [BoxShadow(
            blurRadius: 3,offset: const Offset(-2,-2),
            color: const Color(0XFF797979).withOpacity(0.1),
          ),BoxShadow(
            blurRadius: 3,offset: const Offset(2,2),
            color: const Color(0XFF797979).withOpacity(0.1),
          ),],
        ),
        child: Row(
          children: [
            Icon(icon,color: greyScale ? Colors.black: myBlueColor,size: 25.h,),
            SizedBox(width: 5.0.w,),
            Text(text,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 12.0.w),),
            const Spacer(flex: 1,),
            DotColor(width: 20.w,height: 20.w,
              color: myBlueColor,isSelected: isSelected,),
          ],
        ),
      ),
    );
  }
}
