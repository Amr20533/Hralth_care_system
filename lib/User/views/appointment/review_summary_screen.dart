import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../home/widgets/custom_bottom_button.dart';
class ReviewSummaryScreen extends StatelessWidget {
  ReviewSummaryScreen({Key? key}) : super(key: key);
  List<Specialist> phs = Specialist.physicians;
  String formattedDate = DateFormat('MMM d yyy').format(DateTime.now());
  String formattedTime = DateFormat('h:mm:a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 5.0.w),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.0.w,top: 10.h,bottom: 5.h,),
                    child: Row(
                      children: [
                        IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),
                        const Spacer(flex: 4,),

                        Text('127'.tr,style: TextStyle(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
                        const Spacer(flex: 6,),
                      ],),
                  ),
                  SizedBox(width: 325.w,height: 100.w,
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 40.h,
                              backgroundImage:AssetImage(phs[0].image!),
                            ),
                            Positioned(bottom: 5,right: 0.0,
                                child: Icon(MaterialIcons.verified,color: myBlueColor,size: 18.w,))
                          ],
                        ),
                        SizedBox(width: 7.w,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(phs[0].title!,style: TextStyle(color: Colors.black,fontSize: 16.h,fontWeight: FontWeight.w500),),
                            SizedBox(height: 6.h,),
                            Text(phs[0].speciality!,style: TextStyle(color:const Color(0XFF838383),fontSize: 14.h,fontWeight: FontWeight.w400),),
                            SizedBox(height: 10.h,),
                            Row(
                              children: [
                                Icon(MaterialCommunityIcons.map_marker,color: myBlueColor,size: 16.w,),
                                SizedBox(width: 3.w,),
                                Text(phs[0].location!,style: TextStyle(color:const Color(0XFF797979),fontSize: 14.h,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5.w,),
                                Icon(MaterialCommunityIcons.map,color: myBlueColor,size: 16.w,),

                              ],
                            ),
                          ],
                        ),

                      ],
                    ),

                  ),
                  Divider(color: const Color(0XFF838383),height: 0.6.w,),
                  Padding(
                    padding: EdgeInsets.only(bottom:10.0.h,top: 18.0.w),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Date & Hour',style: TextStyle(color:const Color(0XFF838383),fontSize: 16.h,fontWeight: FontWeight.w400),),
                        Text('$formattedDate | $formattedTime',style: TextStyle(color:Colors.black,fontSize: 16.h,fontWeight: FontWeight.w400),),
                      ],),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom:10.0.h,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Package',style: TextStyle(color:const Color(0XFF838383),fontSize: 16.h,fontWeight: FontWeight.w400),),
                        Text('Messaging',style: TextStyle(color:Colors.black,fontSize: 16.h,fontWeight: FontWeight.w400),),
                      ],),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom:10.0.h,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Duration',style: TextStyle(color:const Color(0XFF838383),fontSize: 16.h,fontWeight: FontWeight.w400),),
                        Text('30 minutes',style: TextStyle(color:Colors.black,fontSize: 16.h,fontWeight: FontWeight.w400),),
                      ],),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom:16.0.h,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Booking for',style: TextStyle(color:const Color(0XFF838383),fontSize: 16.h,fontWeight: FontWeight.w400),),
                        Text('Self',style: TextStyle(color:Colors.black,fontSize: 16.h,fontWeight: FontWeight.w400),),
                      ],),
                  ),
                  Divider(color: const Color(0XFF838383),height: 0.6.w,),
                  Padding(
                    padding: EdgeInsets.only(bottom:16.0.h,top:18.0.w),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Amount',style: TextStyle(color:const Color(0XFF838383),fontSize: 16.h,fontWeight: FontWeight.w400),),
                        Text('\$20',style: TextStyle(color:Colors.black,fontSize: 16.h,fontWeight: FontWeight.w400),),
                      ],),
                  ),Padding(
                    padding: EdgeInsets.only(bottom:16.0.h,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Duration (30 mins)',style: TextStyle(color:const Color(0XFF838383),fontSize: 16.h,fontWeight: FontWeight.w400),),
                        Text('1 x \$20',style: TextStyle(color:Colors.black,fontSize: 16.h,fontWeight: FontWeight.w400),),
                      ],),
                  ),Padding(
                    padding: EdgeInsets.only(bottom:16.0.h,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Duration',style: TextStyle(color:const Color(0XFF838383),fontSize: 16.h,fontWeight: FontWeight.w400),),
                        Text('30 minutes',style: TextStyle(color:Colors.black,fontSize: 16.h,fontWeight: FontWeight.w400),),
                      ],),),
                  Padding(
                    padding: EdgeInsets.only(bottom:16.0.h,top: 18.0.w),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',style: TextStyle(color:const Color(0XFF838383),fontSize: 16.h,fontWeight: FontWeight.w400),),
                        Text('\$20',style: TextStyle(color:Colors.black,fontSize: 16.h,fontWeight: FontWeight.w400),),
                      ],),),
                  Divider(color: const Color(0XFF838383),height: 0.6.w,),
                  Padding(
                    padding: EdgeInsets.only(bottom:16.0.h,top:18.0.w),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Row(
                         children: [
                           // Icon(Icons.calendar_month_sharp,color: myBlueColor,),
                           const Icon(MaterialCommunityIcons.cash_multiple,color: myBlueColor,),
                           SizedBox(width: 8.0.w,),
                           Text('Cash',style: TextStyle(color:const Color(0XFF838383),fontSize: 16.h,fontWeight: FontWeight.w400),),
                         ],
                       ),
                        Text('Change',style: TextStyle(color:myBlueColor,fontSize: 16.h,fontWeight: FontWeight.w500),),
                      ],),
                  ),

                ]),
          ),),),
      bottomNavigationBar: CustomBottomButton(text:'128'.tr,onTap:(){  Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewSummaryScreen()));}),

      // bottomNavigationBar: Container(width: double.infinity,
      //   height: 70.w,alignment: Alignment.center,
      //   decoration: BoxDecoration(color: Colors.white,
      //       boxShadow: [BoxShadow(
      //         blurRadius: 10,offset:const Offset(-4,-4),
      //         color:const Color(0XFF797979).withOpacity(0.1),
      //       )],
      //       borderRadius: BorderRadius.only(topRight: Radius.circular(14.w),topLeft: Radius.circular(14.w))),
      //   child:GestureDetector(
      //     onTap: (){
      //       // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ReviewSummaryScreen()));
      //     },
      //     child: Container(width: 290.w,height: 40.w,
      //       // margin: EdgeInsets.symmetric(horizontal: 7.w),
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //         color: myBlueColor,
      //         borderRadius: BorderRadius.circular(20.0.h),
      //       ),
      //       child: Center(
      //         child: Text('128'.tr,style: TextStyle(color: Colors.white,fontSize: 15.w,fontWeight: FontWeight.w400),),
      //       ),
      //     ),
      //   ) ,),
    );
  }
}
