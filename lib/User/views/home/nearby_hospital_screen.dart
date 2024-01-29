import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/favs/widgets/hospital_card.dart';
import 'package:co_rhema/User/views/home/details_screen.dart';
import 'package:co_rhema/User/views/home/widgets/hospital_slider.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:co_rhema/User/views/home/widgets/specialisit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class NearbyHospitalScreen extends StatefulWidget {
  const NearbyHospitalScreen({required this.phs,Key? key}) : super(key: key);
  final dynamic phs;
  @override
  State<NearbyHospitalScreen> createState() => _NearbyHospitalScreenState();
}

class _NearbyHospitalScreenState extends State<NearbyHospitalScreen> {
  final List<String> _topList = ["All", "Dentist","Cardiologist","Skin Care"];
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 15.0.w),
                  child: Row(
                    children: [
                      IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),
                      const Spacer(flex: 3,),

                      Text('129'.tr,style: TextStyle(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
                      const Spacer(flex: 3,),
                      IconCircle(onTap:(){},icon: AntDesign.search1,),
                    ],),
                ),
                // SizedBox(height: 18.w,),
                Padding(
                  padding: EdgeInsets.only(left:8.0.w),
                  child:SizedBox(height: 52.h,
                    child: ListView.builder(
                      itemCount: _topList.length,scrollDirection: Axis.horizontal,padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),shrinkWrap: true,
                      itemBuilder: (context,index) => GestureDetector(
                        onTap: (){
                          selected = index;
                          setState(() {});
                        },
                        child: Container(height: 30.h,
                            padding: EdgeInsets.only(left:14.h,right:14.h,top: 5.0.h,bottom: 5.0.h,),
                            margin: EdgeInsets.only(top:8.h,bottom:14.h,left: 8.w),
                            decoration: BoxDecoration(
                              color: selected == index ? myBlueColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(14.w),
                              border:Border.all(color:const Color(0XFF838383).withOpacity(0.3),width: 1),
                            ),
                            child:Text(_topList[index],style: TextStyle(color: selected == index ? Colors.white : Colors.black,fontSize: 14.h,fontWeight: FontWeight.w400),)
                        ),
                      ),
                    ),
                  ),

                ),
               ListView.separated(
                      itemCount: 5,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),shrinkWrap: true,
                      itemBuilder: (context,index) => HospitalCard(image:'assets/images/clinc01.jpg',ratings:'4.8',title: 'Serenity Wellness Clinic', time:'15 min', location:'8502 Perston Rd, Inglewood, Maine 98380',distance: '1.5km', onTap: () {

                      },),
                      separatorBuilder: (context,index) => SizedBox(height: 12.0.w,),
                    ),
              ]),
        ),
      ),);
  }
}
