import 'package:co_rhema/constants.dart';
import 'package:co_rhema/shares/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HospitalSlider extends StatelessWidget {
  const HospitalSlider({super.key,
    required this.image,required this.distance,required this.ratings,required this.time,required this.title
  });
  final String time,distance,title,image,ratings;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(16.w),topLeft: Radius.circular(16.w),bottomRight: Radius.circular(16.w),bottomLeft: Radius.circular(16.w),),
      child: Container(
          height: 200.h, width: 170.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            boxShadow: customBoxShadow(4, kColorsLightGrey.withOpacity(0.08), 4),

          ),
          child: Stack(
            children: [
              /// hosslider image
              Container(
                width: 170.w,height: 120.h,
                decoration: BoxDecoration(
                  // color: myBlueColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12.w),topLeft: Radius.circular(12.w)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        // image: AssetImage('assets/images/clinc01.jpg')
                        image: AssetImage(image)
                    )
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 7.w,right: 9.w,
                      child: Container(
                          width: 26.w,height:26.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xFFEAEAEB).withOpacity(0.7),
                              shape: BoxShape.circle
                          ),
                          // child: Icon(IconBroken.Heart,color: Colors.white,size: 18.w,)
                          child: SvgPicture.asset('assets/images/icons/heart-icon.svg',color: Colors.white70,width: 16.w,height: 16.w,)
                      ),
                    ),
                    Positioned(
                      bottom: 7.w,right: 8.w,
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                          width: 50.w,height:22.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(12.w),topLeft: Radius.circular(12.w),bottomLeft: Radius.circular(12.w))
                            // shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: 4.0.w),
                            child: Row(
                              children: [
                                Icon(MaterialIcons.star,color: kColorsLightYellow,size: 16.w,),
                                const Spacer(),
                                Text(ratings,style:TextStyle(color: Colors.black,fontSize: 12.0.w,fontWeight: FontWeight.w500)),
                              ],
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 85.h,
                margin: EdgeInsets.only(top: 120.h),
                padding: EdgeInsets.only(left: 8.w,top: 8.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                  // boxShadow: customBoxShadow(25, kColorsLightGrey.withOpacity(0.6), 4),

                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.w),bottomLeft: Radius.circular(12.w)),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14.w),),
                    SizedBox(height: 6.0.w,),
                    Row(
                      children: [
                        Icon(Icons.watch_later,color: myBlueColor,size: 12.w,),
                        SizedBox(width: 1.0.w,),
                        Text(time,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 11.w),),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          width: 3.w,height: 3.w,
                          decoration:const BoxDecoration(
                            shape:BoxShape.circle,
                            color: Colors.black45,
                          ),
                        ),
                        Text(distance,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 11.w),),
                      ],
                    ),
                  ],
                ),
              )

            ],
          )
      ),
    );
  }
}