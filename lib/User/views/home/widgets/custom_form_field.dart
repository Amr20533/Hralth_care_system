import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomFormField extends StatelessWidget {
  const CustomFormField({required this.controller,required this.hintText,this.keyboard,this.width,this.borderRadius,this.height,this.focusBorder,this.onEditingComplete,this.suffixIcon,this.prefixIcon,this.obscureText,this.validator,Key? key}) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final double? width,height;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final BorderRadiusGeometry? borderRadius;
  final Widget? suffixIcon;
  final InputBorder? focusBorder;
  final void Function()? onEditingComplete;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,height:height,alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: borderRadius,
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText ?? false,
          onEditingComplete: onEditingComplete,
          keyboardType: keyboard,
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[100]!),
                borderRadius: BorderRadius.circular(12.0.w), // Set the desired border radius
              ),
              fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 10),
              focusedBorder:focusBorder,
              hintStyle: appStyle(13.w, Colors.grey, FontWeight.w500),
              // contentPadding: EdgeInsets.zero,
              suffixIconColor: Colors.black
          ),
        )
    );
  }
}
