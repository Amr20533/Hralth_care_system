import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/home/booking_controller.dart';
import 'package:co_rhema/User/views/bookings/cancel_booking.dart';
import 'package:co_rhema/User/views/favs/widgets/choice_button.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    this.reviewTap,
    required this.phs,
    this.isCompleted = false,
    this.isCanceled = false,
  });

  final dynamic phs;
  final void Function()? reviewTap;
  final bool isCompleted,isCanceled;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingsControllerImp>(
        builder: (controller) {
          return Container(
              height: 236.h,
              // height: 290.h,
              width: 300.w,
              // padding: EdgeInsets.only(left: 4.w,top: 4.w),
              decoration: BoxDecoration(color: Colors.white,
                // border: Border.all(color: Colors.black26,width: 1.0),
                borderRadius: BorderRadius.circular(12.h),
                border: Border.all(width: 1, color: Colors.grey[200]!),
// /*
//                 boxShadow: customBoxShadow(80,Color(0xFF0c0c2c),24), // changes position of shadow]

          // boxShadow: [
          // BoxShadow(
          //     color: kTextLightColor.withOpacity(0.1), //color of shadow
          //     blurRadius: 30.0, //spread radius
          //     offset:const Offset(-28, -28)),
          // BoxShadow(
          //     color: kTextLightColor.withOpacity(0.1), //color of shadow
          //     blurRadius: 30.0, //spread radius
          //     offset:const Offset(28, 28)),], // changes position of shadow]
// */
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: (isCanceled || isCompleted)
                        ? EdgeInsets.only(
                        right: 5.0.w, left: 10.w, top: 16.h, bottom: 13.0.h)
                        // right: 5.0.w, left: 10.w, top: 15.h, bottom: 10.0.h)
                        : EdgeInsets.only(
                        right: 6.0.w, left: 9.w, top: 6.h, bottom: 6.0.h),
                        // right: 6.0.w, left: 9.w, top: 8.h, bottom: 8.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${DateFormat('MMM d, yyy').format(
                            DateTime.now())} - 10.00 AM', style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w500,fontSize: 11.w),),
                        // const Spacer(flex: 2,),
                        (isCompleted || isCanceled) ?
                        Container()
                            :
                        Row(
                          children: [
                            Text('96'.tr, style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 9.w, fontWeight: FontWeight
                                .w500),),
                            // SizedBox(width: 3.w,),
                            Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                value: controller.active,
                                // key:Key('the-key'),
                                // key:Key('${phs.id}'),
                                activeColor: myBlueColor,
                                onChanged: (value) {
                                  controller.toggleIcon(value);
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  Container(margin: EdgeInsets.symmetric(horizontal: 12.w),
                    color: const Color(0XFF838383).withOpacity(0.2),
                    height: 0.6.h,),
                  SizedBox(height: 3.h,),

                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 80.w,
                        height: 84.w,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 8.0.h, left: 12.0.h),
                        decoration: BoxDecoration(
                          color: kColorsLightBlue100,
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(fit: BoxFit.cover,
                              image: AssetImage(phs.image!)
                          ),
                        ),
                        // child: Center(child: SvgPicture.asset('${phs[index].image}',width: 16.w,height: 16.w,color: spec[index].color,)),
                      ),

                      SizedBox(width: 10.0.h,),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${phs.title}', style: categoryBarTitleStyle(context)),
                            SizedBox(height: 3.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 2.0.w, top: 5.h),
                              child: Row(
                                children: [
                                  Icon(MaterialIcons.location_pin,
                                    color: myBlueColor, size: 14.w,),
                                  SizedBox(width: 5.w,),
                                  Text("Hyde Park,NY,12538", style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: 10.w)),
                                ],),
                            ),
                            SizedBox(height: 3.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 2.0.w, top: 3.h),
                              child: Row(
                                children: [
                                  Icon(FontAwesome.id_card_o, size: 13.w,),
                                  SizedBox(width: 6.w,),
                                  Text('97'.tr, style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: 10.w)),
                                  SizedBox(width: 8.w,),
                                  Text('#DR452SA54', style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                      color: myBlueColor.withOpacity(0.6),
                                      fontSize: 12.w,
                                      fontWeight: FontWeight.w600)),
                                ],),
                            ),

                          ],
                        ),
                      ),
                    ],),
                  SizedBox(height: 15.h,),
                  Container(margin: EdgeInsets.symmetric(horizontal: 12.w),
                    color: const Color(0XFF838383).withOpacity(0.2),
                    height: 0.6.h,),
                  SizedBox(height: 15.h,),


                  isCanceled ? GestureDetector(
                    onTap: reviewTap,
                    child: Container(width: 300.w,
                      height: 35.w,
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: myBlueColor,
                        borderRadius: BorderRadius.circular(22.0.h),
                      ),
                      child: Center(
                        child: Text('75'.tr, style: TextStyle(
                            color: kColorsLightBlue100,
                            fontSize: 14.w,
                            fontWeight: FontWeight.w400),),
                      ),
                    ),
                  ) : isCompleted ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceButton(width: 120.w,
                            height: 35.w,
                            text: '95'.tr,
                            tColor: myBlueColor,
                            color: kColorsLightBlue100,
                            onTap: () {
                              // Get.back();
                            }),
                        ChoiceButton(width: 120.w,
                            height: 35.w,
                            text: '75'.tr,
                            color: myBlueColor,
                            tColor: Colors.white,
                            onTap: () {

                            }),
                      ],),
                  ) : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceButton(width: 120.w,
                            height: 32.w,
                            text: '93'.tr,
                            tColor: myBlueColor,
                            color: kColorsLightBlue100,
                            onTap: () {
                              Get.toNamed(AppRoutes.cancelBooking);
                            }),
                        ChoiceButton(width: 120.w,
                            height: 32.w,
                            text: '94'.tr,
                            color: myBlueColor,
                            tColor: Colors.white,
                            onTap: () {

                            }),
                      ],),
                  ),
                ],
              )
          );
        }
    );
  }

}