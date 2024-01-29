import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String title;
  final String text;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn(
      {Key? key,
        required this.title,
        required this.text,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 9.w),),
        InkWell(
          onTap: onTap,
          child: Text(text,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: myBlueColor,
              fontWeight: FontWeight.bold,decoration: TextDecoration.underline,fontSize: 9.w),),
        )
      ],
    );
  }
}