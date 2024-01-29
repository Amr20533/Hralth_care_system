import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconCircle extends StatelessWidget {
  const IconCircle({
    super.key,
    required this.onTap,
    required this.icon,
    this.color = Colors.black,
    this.bgColor = Colors.white,
  });
  final Color color,bgColor;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(width: 33.w,height: 33.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24.0.w),
          border:Border.all(color: Colors.grey[300]!,width: 1),
        ),
        child: Center(child: Icon(icon,size: 20.w,color: color,)),
      ),
    );
  }
}
