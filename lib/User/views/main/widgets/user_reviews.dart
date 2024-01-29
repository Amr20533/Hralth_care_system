import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class UserReviews extends StatelessWidget {
  const UserReviews({
    super.key,
    required this.username,
    required this.date,
    required this.ratings,
    required this.image,
    required this.comment,
    required this.follower,

  });
  static const IconData verified = IconData(0xe699, fontFamily: 'MaterialIcons');

  final String username,date,image,comment,follower;
  final double ratings;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:12.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Stack(alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 22.h,
                    backgroundImage: AssetImage(image),
                    // backgroundImage: NetworkImage(image),
                  ),
                  Positioned(bottom: 0,right: 0.0,
                      child: Container(width: 12.w,height: 12.w,
                        alignment: Alignment.center,
                          decoration:const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(MaterialIcons.verified,color: myBlueColor,size: 14.w,),
                      ))
                      // child: Icon(MaterialIcons.verified,color: myBlueColor,size: 14.w,))
                ],
              ),
              const Spacer(flex:1),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username,style: TextStyle(color: Colors.black,fontSize: 16.h,fontWeight: FontWeight.w500),),
                  SizedBox(height: 6.h,),
                  Text(follower,style: TextStyle(color: Colors.black45,fontSize: 12.h,fontWeight: FontWeight.w400),),
                ],
              ),
              const Spacer(flex:10),
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
          SizedBox(height: 12.h,),
          Padding(
            padding: EdgeInsets.only(left: 12.0.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
              ...List.generate(5, (index) => Icon(Icons.star,color: myBlueColor,size: 18.w,)),
                SizedBox(width: 5.w,),
                Text('5.0',style: TextStyle(color: Colors.black,fontSize: 15.h,fontWeight: FontWeight.bold),),

              ],),
          ),
          SizedBox(height: 15.h,),
          Divider(color: const Color(0XFF838383).withOpacity(0.4),height: 0.6.w,indent: 20.w,endIndent: 20.w,),

        ],
      ),
    );
  }
}
