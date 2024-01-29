import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LocationBar extends StatelessWidget {
  const LocationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 5.0.h,),
            Text('Location',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black26,fontSize: 12.0.w),),
            SizedBox(height: 5.0.h,),
            // Text('Location',style: TextStyle(color: kTextMediumColor.withOpacity(0.3),fontSize: 14.0),),
            Row(children: [
              Icon(MaterialIcons.location_pin,color:myBlueColor,size: 11.w,),
              SizedBox(width: 5.w,),
              Text("Cairo, Egypt",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontSize: 11.0.w),),
              SizedBox(width: 5.0.w,),
              SizedBox(width: 11.w,height:11.h,child: SvgPicture.asset('assets/images/icons/angle-down.svg',color: Colors.black,)),
            ],)
          ],),
        Row(children: [
          Container(width: 24.w,height: 24.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kTextMediumColor.withOpacity(0.03),
              borderRadius: BorderRadius.circular(20.0.w),
              border: Border.all(color: Colors.black12.withOpacity(0.1), width: 1),
            ),
            child: Center(child: Icon(MaterialIcons.notifications_active,size: 12.w,)),
          )
        ],),
      ],
    );
  }
}
