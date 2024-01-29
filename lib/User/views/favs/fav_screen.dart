import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/User/views/favs/fav_doc_screen.dart';
import 'package:co_rhema/User/views/favs/fav_hospitals_screen.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> with TickerProviderStateMixin{
  late final TabController _tabController = TabController(length: tabs.length, vsync: this);

  List<String> tabs = ["Doctors", "Hospitals"];
  List<Specialist> phs = Specialist.physicians;

  int _current = 0;
  double changePositionOffline(){
    switch (_current){
      case 0:
        return 0;
      case 1:
        return 70;
      case 2:
        return 190;
      case 3:
        return 263;
      default:
        return 0;
    }
  }
  double changeContainerWidth(){
    switch (_current){
      case 0:
        return 50;
      case 1:
        return 80;
      case 2:
        return 50;
      case 3:
        return 50;
      default:
        return 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 5.0.w),
                  child: Row(
                    children: [
                      IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),
                      const Spacer(flex: 3,),

                      Text('Favorites',style: TextStyle(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
                      const Spacer(flex: 3,),
                      IconCircle(onTap:(){},icon: AntDesign.search1,),
                    ],),
                ),
                SizedBox(height: 18.w,),
                Stack(
                  children: [
                    SizedBox(width: 325.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.w),
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
                          labelStyle: appStyle(15.w,Colors.white,FontWeight.w500),
                          unselectedLabelColor: Colors.black45,
                          labelPadding: EdgeInsets.only(left: 50.w,right: 50.w),
                          indicatorPadding: EdgeInsets.only(left: 5.w),
                          // tabAlignment: TabAlignment.center,
                          tabs: const [
                            // Tab(child: Expanded(child: Text("Doctors")),iconMargin: EdgeInsets.only(left: 30.0),),
                            // Tab(child: Expanded(child: Text("Hospitals")),),
                            Tab(text: "Doctors",),
                            Tab(text: "Hospitals",),
                            // Tab(text: "Hospitals",),
                          ],),
                      ),
                    ),
                    Positioned(bottom:0,child:Container(width: 325.w,height: 1.0,color: Colors.grey[300],))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top:20.0.h),
                  child: Expanded(
                    child: Container(width: 325.w,height: 625.w,
                      padding: EdgeInsets.only(left: 5.0.w,right: 5.0.w),
                      child: TabBarView(
                          controller: _tabController,
                          children: [
                            FavDoctorScreen(phs: phs,),
                            FavHospitalScreen(),
                          ]),
                    ),
                  ),
                ),
                // SizedBox(
                //     width: 325.w,height:30.w,
                //     child:Stack(
                //       children: [
                //         Positioned(top:0,left: 0,right: 0,
                //           child: SizedBox(
                //             width: 325.w,height: 825.h * 0.04,
                //             // color: Colors.grey,
                //             child: ListView.builder(
                //               physics: const BouncingScrollPhysics(),
                //               itemCount: tabs.length,scrollDirection: Axis.horizontal,
                //               itemBuilder: (context,index) => GestureDetector(
                //                 onTap: (){
                //                   setState(() {
                //                     _current = index;
                //                   });
                //                 },
                //                 child: Padding(
                //                   padding: EdgeInsets.only(left: index == 0 ? 26.0.w : 0 ,top:5, right: index == 1 ? 26.0.w : 16.0.w),
                //                   child: Text(tabs[index],style:GoogleFonts.ubuntu(fontSize: _current == index ? 16.w : 14.w,color:_current == index ? myBlueColor : Colors.black54,
                //                       fontWeight: _current == index ? FontWeight.w400 : FontWeight.w300
                //                   )),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         // AnimatedPositioned(bottom:0,
                //         //   duration: const Duration(milliseconds: 300),
                //         //   left: changePositionOffline(),
                //         //   child: AnimatedContainer(duration: const Duration(milliseconds: 500),
                //         //     curve: Curves.fastLinearToSlowEaseIn,
                //         //     margin: const EdgeInsets.only(left: 10),
                //         //     width: 30.w,height: 825.h * 0.008,
                //         //     decoration: BoxDecoration(
                //         //         color: myBlueColor,
                //         //         borderRadius: BorderRadius.circular(10.0)
                //         //     ),
                //         //   ),
                //         // )
                //       ],
                //     )
                // ),
                /* Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: showCurrentScreen(_current),
              )*/
              ]),
        ),
      ),
    );
  }
  showCurrentScreen(int index){
    if(index == 1){
      return FavHospitalScreen();
    }else{
      return FavDoctorScreen(phs: phs,);
    }
  }
}
