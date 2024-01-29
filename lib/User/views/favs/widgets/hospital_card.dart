import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HospitalCard extends StatelessWidget {
  const HospitalCard({super.key,
    required this.image,required this.distance,required this.onTap,required this.location,required this.ratings,required this.time,required this.title
  });
  final String time,distance,location,title,image,ratings;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 225.h, width: 325.w,
        margin: EdgeInsets.symmetric(horizontal: 16.0.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          boxShadow: customBoxShadow(3,const Color(0XFF838383).withOpacity(0.07), 4),
          // [BoxShadow(
          //     color: const Color(0XFF838383).withOpacity(0.07),
          //     offset:const Offset(-4,-4),
          //     blurRadius: 3
          // ),BoxShadow(
          //     color: const Color(0XFF838383).withOpacity(0.07),
          //     offset:const Offset(4,4),
          //     blurRadius: 3
          // )],
        ),
        child: Stack(
          children: [
            Container(
              width: 325.w,height: 130.h,
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
                    top: 9.w,right: 9.w,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Container(
                          width: 26.w,height:26.w,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white60,
                              shape: BoxShape.circle
                          ),
                          // child: Icon(IconBroken.Heart,color: Colors.white,size: 18.w,)
                          child: SvgPicture.asset('assets/images/icons/heart.svg',color: myBlueColor,width: 12.w,height: 12.w,)
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 7.w,right: 8.w,
                    child: Container(
                        padding: EdgeInsets.only(left: 5.0.w),
                        width: 105.w,height:18.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.8),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(12.w),topLeft: Radius.circular(12.w),bottomLeft: Radius.circular(12.w))
                          // shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 4.0.w),
                          child: Row(
                            children: [
                              Icon(MaterialIcons.star,color: kColorsLightYellow,size: 14.w,),
                              SizedBox(width: 3.0.w,),
                              Text(ratings,style:TextStyle(color: Colors.black,fontSize: 10.0.w,fontWeight: FontWeight.w400)),
                              SizedBox(width: 3.0.w,),
                              Text('(1k+ Review)',style:TextStyle(color: Colors.black45.withOpacity(0.5),fontSize: 10.0.w,fontWeight: FontWeight.w400)),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 135.h,
              margin: EdgeInsets.only(top: 130.h),
              padding: EdgeInsets.only(left: 8.w,top: 8.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.w),bottomLeft: Radius.circular(12.w))
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 11.w),),
                  SizedBox(height: 3.0.w,),
                  Text('Dental, Skin care',style: TextStyle(color: const Color(0XFF838383),fontWeight: FontWeight.w400,fontSize: 10.h),),
                  SizedBox(height: 3.0.w,),
                  Divider(color: const Color(0XFF838383).withOpacity(0.4),height: 0.6.w,indent: 7.0.w,endIndent: 7.0.w,),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.w),
                    child: Row(
                      children: [
                        Icon(Icons.location_on,color: myBlueColor,size: 11.w,),
                        SizedBox(width: 1.0.w,),
                        Text(location,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 9.w),),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.watch_later,color: myBlueColor,size: 11.w,),
                      SizedBox(width: 1.0.w,),
                      Text(time,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 9.w),),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        width: 3.w,height: 3.w,
                        decoration:const BoxDecoration(
                          shape:BoxShape.circle,
                          color: Colors.black45,
                        ),
                      ),
                      Text(distance,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 9.w),),
                    ],
                  ),

                ],
              ),
            )

          ],
        )
    );
  }
}