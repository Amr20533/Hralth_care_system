import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/appointment/package_screen.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/appointment/widgets/custon_circular_card.dart';
import 'package:co_rhema/User/views/appointment/widgets/scheduled_box.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:co_rhema/User/views/home/widgets/special_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentScreen extends StatefulWidget {
  AppointmentScreen({Key? key,required this.phs}) : super(key: key);
  final dynamic phs;

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final _currentDate = DateTime.now();

  final _timeFormat = DateFormat('H MM p');

  final _dayFormatter = DateFormat('EEEE');

  final _monthFormatter = DateFormat('d MMM');

  List<String> timeList = ["7:00 PM","7:30 PM","8:00 PM","8:30 PM","9:00 PM","10:00 PM"];

  int selectedTime = 0;

  int selectedDate = 0;

  @override
  Widget build(BuildContext context) {

    final dates = <Widget>[];

    for (int i = 0; i < 7; i++) {
      final date = _currentDate.add(Duration(days: i));
      dates.add(
          Column(
            children: [
              // Text('Today',style:TextStyle(color: Colors.white38,fontSize:10.w,fontWeight: FontWeight.normal)) ,
              // Text(DateFormat.MMMd().format(DateTime.now()),style: TextStyle(color: Colors.white38,fontSize:16.w,fontWeight: FontWeight.w600)),
              // Text(_dayFormatter.format(date),style: TextStyle(color: Colors.black45,fontSize:14.w,fontWeight: FontWeight.w600)),
              Text(_monthFormatter.format(date),style: TextStyle(color: Colors.black45,fontSize:14.w,fontWeight: FontWeight.w600)),
            ],));
    }

    return Scaffold(
      backgroundColor:const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 5.0.w),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: SizedBox(height: 825.h * 1.2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDocCard(title:"126".tr, icon: AntDesign.arrowleft,),
                    CustomCircularCard(phs: widget.phs),
                    Divider(color: const Color(0XFF838383).withOpacity(0.3),height: 0.6.w,),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 18.0.h,),
                        child: Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SpecialCircle(width: 45.w,height: 45.w,child: Icon(MaterialIcons.people,color: myBlueColor,size: 26.h,)),
                                SizedBox(height: 5.0.h,),
                                Text('7,500+',style: TextStyle(color: myBlueColor,fontSize: 15.w,fontWeight: FontWeight.w600),),
                                SizedBox(height: 7.0.h,),
                                Text('Patients',style: TextStyle(color: const Color(0XFF838383),fontSize: 12.w,fontWeight: FontWeight.w500),),
                              ],
                            ),
                            Column(
                              children: [
                                SpecialCircle(width: 45.w,height: 45.w,child: Icon(MaterialIcons.person,color: myBlueColor,size: 26.h,)),
                                SizedBox(height: 5.0.h,),
                                Text('10+',style: TextStyle(color: myBlueColor,fontSize: 15.w,fontWeight: FontWeight.w600),),
                                SizedBox(height: 7.0.h,),
                                Text('Years Exp.',style: TextStyle(color: const Color(0XFF838383),fontSize: 12.w,fontWeight: FontWeight.w500),),

                              ],
                            ),
                            Column(
                              children: [
                                SpecialCircle(width: 45.w,height: 45.w,child: Icon(MaterialIcons.star,color: myBlueColor,size: 26.h,)),
                                SizedBox(height: 5.0.h,),
                                Text('4.9+',style: TextStyle(color: myBlueColor,fontSize: 15.w,fontWeight: FontWeight.w600),),
                                SizedBox(height: 7.0.h,),
                                Text('Rating',style: TextStyle(color: const Color(0XFF838383),fontSize: 12.w,fontWeight: FontWeight.w500),),

                              ],
                            ),
                            Column(
                              children: [
                                SpecialCircle(width: 45.w,height: 45.w,child: Icon(MaterialIcons.message,color: myBlueColor,size: 26.h,)),
                                SizedBox(height: 5.0.h,),
                                Text('4,956',style: TextStyle(color: myBlueColor,fontSize: 15.w,fontWeight: FontWeight.w600),),
                                SizedBox(height: 7.0.h,),
                                Text('Reviews',style: TextStyle(color: const Color(0XFF838383),fontSize: 12.w,fontWeight: FontWeight.w500),),

                              ],
                            ),
                          ],
                        )
                    ),
                    // SizedBox(height:8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0.h),
                      child: Text('Book Appointment'.toUpperCase(),style: TextStyle(color:Colors.black45,fontSize: 14.h,fontWeight: FontWeight.w400),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 12.0.h),
                      child: Text('Day',style: TextStyle(color:Colors.black,fontSize: 18.h,fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 46.0.w,
                      child: ListView.builder(
                        itemCount: dates.length,shrinkWrap: true,scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index) {
                          final date0 = _currentDate.add(Duration(days: index));
                          if (index < 7){
                          return GestureDetector(
                              onTap: (){
                              setState(() {
                              selectedDate = index;
                              });
                              },
                              child: Container(
                              margin: EdgeInsets.only(right: 7.0.w),
                              width: 75.w,height: 46.w,
                              decoration:BoxDecoration(
                              color: selectedDate == index ? myBlueColor : Colors.white,
                              borderRadius:BorderRadius.circular(30.w),
                              border:Border.all(width:selectedDate == index ? 0 : 1,color:Colors.grey[400]!)
                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              index == 0 ? Text('Today',style:TextStyle(color: selectedDate == index ? Colors.white :  Colors.black45,fontSize:10.w,fontWeight: FontWeight.w400)) : Text(_dayFormatter.format(date0).toString().substring(0,3),style:TextStyle(color: selectedDate == index ? Colors.white :  Colors.black45,fontSize:10.w,fontWeight: FontWeight.w400)),
                                SizedBox(height: 5.0.h,),
                                Text(DateFormat('d MMM').format(date0),style:TextStyle(color: selectedDate == index ? Colors.white :  Colors.black,fontSize:13.w,fontWeight: FontWeight.w500)),

                              ],),
                        ),
                          );
                          }
                },
    ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 12.0.h,top: 18.0.h),
                      child: Text('Time',style: TextStyle(color:Colors.black,fontSize: 18.h,fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 46.0.w,
                      child: ListView.builder(
                        itemCount: timeList.length,shrinkWrap: true,scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=>GestureDetector(
                          onTap: (){
                            selectedTime = index;
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 7.0.w),
                            width: 100.w,height: 46.w,alignment: Alignment.center,
                            decoration:BoxDecoration(
                                color: selectedTime == index ? myBlueColor : Colors.white,
                                borderRadius:BorderRadius.circular(30.w),
                                border:Border.all(width:selectedTime == index ? 0 : 1,color:Colors.grey[300]!)
                            ),
                            child: Text(timeList[index],style:TextStyle(color: selectedTime == index ? Colors.white :  Colors.black,fontSize:16.w,fontWeight: FontWeight.w500)),
                          ),
                        ),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0.w),
                      child: ScheduleBox(onPressed: (){},
                          text: 'Request Schedule', hintText: 'Want a custom schedule?'),
                    ),

                  ]),
            ),
          ),),),
      bottomNavigationBar: CustomBottomButton(text:'Make Appointment',onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => PackageScreen()));}),
    );

  }
}


