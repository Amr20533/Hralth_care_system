import 'package:co_rhema/constants.dart';
import 'package:co_rhema/shares/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';


class TilesWidget extends StatelessWidget {
  final String title;
  final IconData leading;
  final Function()? onTap;

  const TilesWidget({
    Key? key,
    required this.title,
    required this.leading,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (leading == IconBroken.Logout || title ==  "86".tr) ? Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0.h),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          leading,
          color: myBlueColor.withOpacity(0.7),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16.w,fontWeight: FontWeight.w400),
        ),
        trailing: Icon(
          AntDesign.right,
          size: 16.0,
          color: myBlueColor.withOpacity(0.6),
        ),
      ),
    ) : Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0.h),
      child: Column(
        children: [
          ListTile(
            onTap: onTap,
            leading: Icon(
              leading,
              color: myBlueColor.withOpacity(0.7),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16.w,fontWeight: FontWeight.w400),
            ),
            trailing: Icon(
              AntDesign.right,
              size: 16.0,
              color: myBlueColor.withOpacity(0.6),
            ),
          ),
          Container(margin: EdgeInsets.symmetric(horizontal: 12.w),
            color: const Color(0XFF838383).withOpacity(0.2),height: 1.h,),
        ],
      ),
    );

  }
}