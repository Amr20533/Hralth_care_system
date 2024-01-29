import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    required this.time,
    required this.date,
    required this.phoneTap,

    super.key,
  });
  final String time,date;
  final void Function()? phoneTap;
  @override
  Widget build(BuildContext context) {
    return Container(width: 325.w,
        height: 125.h,
        // height: 170.h,
        // padding: EdgeInsets.only(left: 5.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: myBlueColor,
            borderRadius: BorderRadius.circular(10.0.h)
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0.h,left: 10.w,right: 10.w),
              child: Row(
                children: [
                  Container(width: 35.w,height: 35.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: myBlueColor,
                        borderRadius: BorderRadius.circular(30.0.h),
                        image: const DecorationImage(fit:BoxFit.fill,
                            image: AssetImage('assets/images/docs/m_doc_1.jpg')
                        )
                    ),
                  ),
                  SizedBox(width: 5.0.w,),
                  Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. Alana Reuter", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 12.w)),
                      Text("Dentist Consultation", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70,fontWeight: FontWeight.normal,fontSize: 10.w)),
                      // Text("Dentist Consultation", style: appStyle(14,Colors.white70,FontWeight.normal)),
                    ],),
                  const Spacer(),
                  GestureDetector(
                    onTap: phoneTap,
                    child: Container(width: 35.w,height: 35.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0.h),
                      ),
                      child: Icon(MaterialIcons.phone,color: myBlueColor,size: 20.w,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0.h,),
            Container(width: 285.w,height: 36.w,
              margin: EdgeInsets.symmetric(horizontal: 10.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kColorsLightBlue900,
                borderRadius: BorderRadius.circular(10.0.h),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15.0.w),
                child: Row(
                  children: [
                    // const Icon(MaterialCommunityIcons.calendar,color: Colors.white,size: 22,),
                    SizedBox(width:14.w,height:14.w,child: SvgPicture.asset('assets/images/icons/calendar.svg',color: Colors.white70,)),
                    SizedBox(width: 5.0.w,),
                    // Text("${DateFormat('MMM d,h:mm a').format(DateTime.now())}", style: appStyle(16,Colors.white,FontWeight.normal)),
                    Text(date, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70,fontSize: 11.0.w),),
                    SizedBox(width: 36.0.w,),
                    Text("|", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white60,fontSize: 14.0.w),),
                    SizedBox(width: 36.0.w,),
                    Row(
                      children: [
                        SizedBox(width:14.w,height:14.w,child: SvgPicture.asset('assets/images/icons/clock.svg',color: Colors.white70,)),
                        // const Icon(FontAwesome.clock_o,color: Colors.white,size: 22,),
                        SizedBox(width: 5.0.w,),
                        Text(time, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70,fontSize: 11.0.w),),
                      ],
                    ),

                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
