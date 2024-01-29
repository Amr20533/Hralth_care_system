import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialCircle extends StatelessWidget {
  const SpecialCircle({
    super.key,
    required this.child,
    this.width = 50,
    this.height = 50,
  });

  final Widget child;
  final double height,width;

  @override
  Widget build(BuildContext context) {
    return Container(width: width,height: height,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: kColorsLightBlue100,
        shape: BoxShape.circle,
      ),
      child: Center(child: child),
    );
  }
}