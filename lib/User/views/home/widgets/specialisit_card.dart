import 'package:co_rhema/constants.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class SpecialistCard extends StatelessWidget {
  const SpecialistCard({
    super.key,
    required this.onTap,
    this.favTap,
    // required this.phs,
    required this.receivedData,
    required this.child,
    this.bottomSheet = false,
    required this.verified,
    this.icon = Icons.add,
  });

  final dynamic receivedData;
  // final dynamic phs;
  final bool bottomSheet;
  final IconData icon;
  final Widget child;
  final void Function()? onTap;
  final void Function()? favTap;
  final IconData verified;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomSheet ? 112.0.w: 185.h,width: 300.w,
      // height: bottomSheet ? 112.0.w: 250.h,width: 300.w,
      // padding: EdgeInsets.only(left: 4.w,top: 4.w),
      decoration: BoxDecoration(color: Colors.white,
        // border: Border.all(color: Colors.black26,width: 1.0),
        borderRadius: BorderRadius.circular(12.h),
        border: Border.all(width: 1,color: Colors.grey[200]!),
      //   boxShadow: [
      //     BoxShadow(
      //       color: kTextLightColor.withOpacity(0.1), //color of shadow
      //       blurRadius: 30.0, //spread radius
      //       offset:const Offset(-28, -28)),
      //     BoxShadow(
      //       color: kTextLightColor.withOpacity(0.1), //color of shadow
      //       blurRadius: 30.0, //spread radius
      //       offset:const Offset(28, 28)),], // changes position of shadow]
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 77.w,height: 90.w,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top:8.0.h,left: 8.0.h),
                decoration:  BoxDecoration(
                  color: kColorsLightBlue100,
                  borderRadius: BorderRadius.circular(8.0.w),
                  image: DecorationImage(fit: BoxFit.cover,
                      image: AssetImage(ImageAsset.user)
                  ),
                ),
                // child: Center(child: SvgPicture.asset('${phs[index].image}',width: 16.w,height: 16.w,color: spec[index].color,)),
              ),

              SizedBox(width: 10.0.h,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 116.w,height: 25.h,
                        margin: EdgeInsets.only(top:15.0.h,right: 36.0.w),
                        // padding: const EdgeInsets.only(right: 15.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kColorsLightBlue100,
                          borderRadius: BorderRadius.circular(16.h),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0.w),
                          child: Row(
                            children: [
                              Icon(verified,color: myBlueColor,size: 12.w,),
                              SizedBox(width: 3.w,),
                              Text('Professional Doctor', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: myBlueColor.withOpacity(0.6),fontWeight: FontWeight.w500,fontSize: 10.w),overflow: TextOverflow.ellipsis,maxLines: 1,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w,),
                      // SizedBox(width: 25.w,),
                      bottomSheet ? Container() : GestureDetector(
                        onTap:favTap,
                        child: Container(width: 28.w,height: 28.w,padding:EdgeInsets.only(top: 10.w,right:9.w),
                            // child: SvgPicture.asset('assets/images/icons/heart-icon.svg')),
                            child: child),
                      )
                      // const Icon(MaterialCommunityIcons.heart_outline)
                    ],),
                  SizedBox(height: 12.0.h,),

                  Text('${receivedData['name']}', style:Theme.of(context).textTheme.titleMedium!.copyWith(color:Colors.black,fontWeight:FontWeight.w400,fontSize: 13.w),overflow: TextOverflow.ellipsis,maxLines: 1,),
                  SizedBox(height: 3.h,),
                  Text('Dentist', style:Theme.of(context).textTheme.titleSmall!.copyWith(color:Colors.black45,fontWeight:FontWeight.w400,fontSize: 10.w),overflow: TextOverflow.ellipsis,maxLines: 1,),
                  Row(
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          ...List.generate(5, (index) => Icon(MaterialIcons.star,color: kColorsLightYellow,size: 16.w,))
                        ],
                      ),
                      SizedBox(width: 3.w,),
                      Text('${receivedData['ratingsAverage']}', style: Theme.of(context).textTheme.titleMedium!.copyWith(color:Colors.black,fontWeight:FontWeight.w500,fontSize: 12.w)),
                      // Text('${phs.ratings}', style: TextStyle(color: Colors.black,fontSize: 12.w,fontWeight: FontWeight.w500)),
                      SizedBox(width: 11.w,),
                      // SizedBox(width: 16.w,),
                      Text('|', style: Theme.of(context).textTheme.titleMedium!.copyWith(color:Colors.black26,fontWeight:FontWeight.w400,fontSize: 16.w)),
                      SizedBox(width: 11.w,),
                      // SizedBox(width: 16.w,),
                      Text('${receivedData['ratingsQuantity']} ${"59".tr}', style: Theme.of(context).textTheme.titleMedium!.copyWith(color:const Color(0XFF9D9D9D),fontWeight:FontWeight.w500,fontSize: 12.w)),
                    ],),

                ],
              ),
            ],),
          SizedBox(height: 10.h,),

          bottomSheet ? Container() : GestureDetector(
            onTap: onTap,
            child: Container(width: 300.w,height: 40.w,
              margin: EdgeInsets.symmetric(horizontal: 7.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kColorsLightBlue100,
                borderRadius: BorderRadius.circular(10.0.h),
              ),
              child: Center(
                child: Text('228'.tr,style: TextStyle(color: myBlueColor,fontSize: 14.w,fontWeight: FontWeight.w400),),
              ),
            ),
          )
        ],
      ),
    );
  }

}