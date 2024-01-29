import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/User/views/bookings/canceled_bookings.dart';
import 'package:co_rhema/User/views/bookings/completed_bookings.dart';
import 'package:co_rhema/User/views/bookings/upcoming_bookings.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with TickerProviderStateMixin{
  late final TabController _tabController = TabController(length: tabs.length, vsync: this);

  List<String> tabs = ["Upcoming", "Completed","Canceled"];
  List<Specialist> phs = Specialist.physicians;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 8.0.w),
                child: Row(
                  children: [
                    IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),
                    const Spacer(flex: 3,),

                    Text('92'.tr,style: TextStyle(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
                    const Spacer(flex: 3,),
                    IconCircle(onTap:(){},icon: AntDesign.search1,),
                  ],),
              ),
              SizedBox(height: 18.w,),
              Stack(
                children: [
                  SizedBox(width: 325.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.0.w),
                      // padding: EdgeInsets.only(left: 15.0.w),
                      child: TabBar(
                        padding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.values.first,
                        indicatorColor: myBlueColor,
                        indicatorWeight: 5.0,
                        // indicator: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(10.0)
                        // ),
                        controller: _tabController,
                        isScrollable:true,
                        labelColor: myBlueColor.withOpacity(0.8),
                        labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color:Colors.white,fontSize: 18.w,fontWeight: FontWeight.w500,height: -0.01.h),
                        unselectedLabelColor: Colors.black45,
                        // labelPadding: EdgeInsets.only(left: 50.w,right: 50.w),
                        indicatorPadding: EdgeInsets.only(left: 8.w,right: 8.w),
                        // labelPadding: EdgeInsets.only(right: 7.w,),
                        // tabAlignment: TabAlignment.center,
                        tabs: [
                          Tab(text: tabs[0],),
                          Tab(text: tabs[1],),
                          Tab(text: tabs[2],),
                        ],),
                    ),
                  ),
                  Positioned(bottom:0,child:Container(width: 325.w,height: 1.0,color: Colors.grey[300],))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top:20.0.h),
                child: Expanded(
                  child: Container(width: 325.w, height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(left: 5.0.w,right: 5.0.w),
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Center(child: Text(tabs[0]),),
                          // Center(child: Text(tabs[1]),),
                          // Center(child: Text(tabs[2]),),
                          UpcomingBookings(phs: phs,),
                          CompletedBookings(phs: phs,),
                          CanceledBookings(phs: phs,),
                        ]),
                  ),
                ),
              ),

            ]),
      ),
    );
  }
  getBookings(int index){
    switch(index){
      case 0: 
        return UpcomingBookings(phs: phs,);
      case 1:
        return CompletedBookings(phs: phs,);
      case 2:
        return CanceledBookings(phs: phs,);
      default:
        return UpcomingBookings(phs: phs,);
    }
  }
  }
