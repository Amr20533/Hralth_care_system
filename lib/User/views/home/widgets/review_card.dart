import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.username,
    required this.date,
    required this.ratings,
    required this.image,
    required this.comment,

  });
  final String username,date,image,comment;
  final double ratings;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:12.0.w),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Stack(alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(width: 42.w,height: 40.w,alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: 22.h,
                      // backgroundImage: NetworkImage(image),
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                  Positioned(bottom: 1.h,right: 2.w,
                      child: Container(width: 14.w,height: 14.w,
                        alignment: Alignment.center,
                        decoration:const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                            // width: 14.w,height: 14.w,
                            decoration:const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                            child: Icon(MaterialIcons.verified,color: myBlueColor,size: 14.w,)),
                      )),
                                  ],
              ),
              const Spacer(flex:1),
              Text(username,style: TextStyle(color: Colors.black,fontSize: 16.h,fontWeight: FontWeight.w500),),
              const Spacer(flex:7),
              Padding(
                padding: EdgeInsets.only(right: 12.0.w),
                child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(MaterialIcons.star,color: kColorsLightYellow,size: 18.w,),
                        Text('$ratings',style: TextStyle(color: Colors.black,fontSize: 16.h,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Text(date,style: TextStyle(color: const Color(0XFF838383),fontSize: 14.h,fontWeight: FontWeight.w400),),
                  ],),
              )
            ],
          ),
          SizedBox(height: 15.h,),
          SizedBox(width:285.w,child: Text(comment,style: TextStyle(color: Colors.black45,fontSize: 13.h,fontWeight: FontWeight.w400))),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}
