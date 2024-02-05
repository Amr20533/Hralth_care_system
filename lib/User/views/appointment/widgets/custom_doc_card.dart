import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:co_rhema/core/localization/change_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class CustomDocCard extends StatelessWidget {
  const CustomDocCard({
    super.key,this.color = Colors.black,this.txtColor = Colors.black,required this.title,this.deActivate = false,required this.icon,
  });
  final String title;
  final IconData icon;
  final bool deActivate;
  final Color color,txtColor;
  @override
  Widget build(BuildContext context) {
    LocalController localController = Get.put(LocalController());
    bool isRTL = localController.language.languageCode.toLowerCase() == 'ar';
    return isRTL ? Padding(
      padding: EdgeInsets.fromLTRB(0.0,3.0.w,0.0,5.0.w),
      child: Row(
        children: [
          Text(title,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,fontSize: 15.w,color: txtColor)),

          const Spacer(flex: 4,),
          IconCircle(onTap:(){ deActivate ? null : Navigator.of(context).pop(true);},icon: AntDesign.arrowright,color: color,),

          const Spacer(flex: 6,),
        ],),
    ):Padding(
      padding: EdgeInsets.fromLTRB(0.0,3.0.w,0.0,5.0.w),
      child: Row(
        children: [
          IconCircle(onTap:(){ deActivate ? null : Navigator.of(context).pop(true);},icon: icon,color: color,),
          const Spacer(flex: 4,),

          Text(title,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,fontSize: 15.w,color: txtColor)),
          const Spacer(flex: 6,),
        ],),
    );
  }
}