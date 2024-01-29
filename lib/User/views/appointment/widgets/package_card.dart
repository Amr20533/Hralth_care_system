import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/appointment/widgets/dot_color.dart';
import 'package:co_rhema/User/views/home/widgets/special_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PackageCard extends StatelessWidget {
  const PackageCard({
    required this.text,required this.subText,required this.onTap,this.hasInfo = false,required this.icon,required this.price,required this.duration,required this.isSelected,
    super.key,
  });
  final bool isSelected,hasInfo;
  final String text,subText,price,duration;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 325.w,height: 70.w,alignment: Alignment.center,
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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SpecialCircle(width: 60.w,height: 50.w,child: Icon(icon,color: myBlueColor,size: 25.h,)),
            SizedBox(width: 3.0.w,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(text,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
                SizedBox(height: 5.h,),
                Text(subText,style: Theme.of(context).textTheme.titleSmall!.copyWith(color:const Color(0XFF797979),fontSize: 10.w )),
              ],
            ),
            const Spacer(flex: 3,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(price,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,fontSize: 13.w)),
                SizedBox(height: 5.0.w,),
                !hasInfo ? Text(duration,style: Theme.of(context).textTheme.titleSmall!.copyWith(color:const Color(0XFF797979),fontSize: 10.w ))
                    : Text('Paid',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: const Color(0XFF01D831),fontSize: 10.w ,fontWeight: FontWeight.w500)) ,
              ],
            ),
            hasInfo ? SizedBox(width: 8.w,) : Container(),
            !hasInfo ? const Spacer(flex: 1,) : Container(),
            !hasInfo ? DotColor(width: 20.w,height: 20.w,
              color: myBlueColor,isSelected: isSelected,): Container(),
          ],
        ),
      ),
    );
  }
}
