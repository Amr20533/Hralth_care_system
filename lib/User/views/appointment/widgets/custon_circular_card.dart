import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CustomCircularCard extends StatelessWidget {
  const CustomCircularCard({
    super.key,
    required this.phs,
  });

  final dynamic phs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 325.w,height: 100.w,
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40.h,
                backgroundImage:AssetImage(phs.image),
              ),
              Positioned(bottom: 5,right: 0.0,
                  child: Icon(MaterialIcons.verified,color: myBlueColor,size: 18.w,))
            ],
          ),
          SizedBox(width: 12.w,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
            children: [
              Text(phs.title,style: TextStyle(color: Colors.black,fontSize: 17.h,fontWeight: FontWeight.w500),),
              SizedBox(height: 6.h,),
              Text(phs.speciality,style: TextStyle(color:const Color(0XFF838383),fontSize: 14.h,fontWeight: FontWeight.w400),),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Icon(MaterialCommunityIcons.map_marker,color: myBlueColor,size: 16.w,),
                  SizedBox(width: 3.w,),
                  Text(phs.location,style: TextStyle(color:const Color(0XFF797979),fontSize: 14.h,fontWeight: FontWeight.w400),),
                  SizedBox(width: 5.w,),
                  // SvgPicture.asset('assets/images/icons/map.svg',color: myBlueColor,width: 18.0.w,height:18.0.w,),
                  Icon(MaterialCommunityIcons.map,color: myBlueColor,size: 16.w,),

                ],
              ),

            ],
          )
        ],
      ),

    );
  }
}
