import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/shares/style/icon_broken.dart';
import 'package:co_rhema/User/views/appointment/package_screen.dart';
import 'package:co_rhema/User/views/home/about_screen.dart';
import 'package:co_rhema/User/views/home/gallery_screen.dart';
import 'package:co_rhema/User/views/home/review_screen.dart';
import 'package:co_rhema/User/views/home/specialist_screen.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:co_rhema/User/views/home/widgets/special_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
class HospitalDetails extends StatefulWidget {
  const HospitalDetails({Key? key}) : super(key: key);

  @override
  State<HospitalDetails> createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails> with TickerProviderStateMixin{
  late final TabController _tabController = TabController(length: 5, vsync: this);
  List<Specialist> phs = Specialist.physicians;
  ///image:'assets/images/clinc01.jpg',ratings:'4.8',title: 'Elevate Dental', time:'15 min',distance: '1.5km',
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFCFCFC),
        body: SizedBox(
          height: 825.h,
          width: 325.w,
          child: SingleChildScrollView(
            child: Stack(
              children: [

                Container(
                  height: 325.h,
                  padding: EdgeInsets.fromLTRB(16.w, 45.h, 0, 0),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,opacity: 60,
                          image: AssetImage('assets/images/clinc01.jpg')
                      )
                  ),
                  child: Container(
                    padding:  EdgeInsets.only(top:15.h,right: 16.w),
                    width: 375.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),
                            const Spacer(flex: 3,),

                            IconCircle(onTap:(){},icon: Icons.share_sharp,),
                            SizedBox(width: 6.w,),
                            Container(width: 33.w,height: 33.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(26.0),
                                border:Border.all(color: Colors.grey[300]!,width: 1),
                              ),
                              child: Center(child: Opacity(            opacity: 0.5,
                                  child: SvgPicture.asset('assets/images/icons/heart-icon.svg',color: Colors.black,width: 15.w,height: 15.w,))),
                            ),
                          ],),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width:double.infinity,
                    // height: 700.h,
                    margin:EdgeInsets.only(top:180.h) ,
                    padding: EdgeInsets.only(top:30.0.w,) ,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius:BorderRadiusDirectional.only(topStart:Radius.circular(26.w),topEnd:Radius.circular(26.w)),
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Text("Serenity Wellness Clinic",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16.w),),
                        ),
                        SizedBox(height: 3.0.w,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Text('Dental, Skin care, Eye Care,',style: TextStyle(color: const Color(0XFF838383),fontWeight: FontWeight.w400,fontSize: 14.h),),
                        ),
                        SizedBox(height: 6.0.w,),
                        Divider(color: const Color(0XFF838383).withOpacity(0.4),height: 0.6.w,indent: 20.w,endIndent: 20.w,),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0.w,horizontal: 20.w),
                          child: Row(
                            children: [
                              Icon(Icons.location_on,color: myBlueColor,size: 14.w,),
                              SizedBox(width: 1.0.w,),
                              Text("8502 Perston Rd, Inglewood, Maine 98380",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 12.w),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Row(
                            children: [
                              Icon(Icons.watch_later,color: myBlueColor,size: 14.w,),
                              SizedBox(width: 1.0.w,),
                              Text("15 min",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 12.w),),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.w),
                                width: 3.w,height: 3.w,
                                decoration:const BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: Colors.black45,
                                ),
                              ),
                              Text("1.5km",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 12.w),),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.w),
                                width: 3.w,height: 3.w,
                                decoration:const BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: Colors.black45,
                                ),
                              ),
                              Text("Mon  Sun  | 11 am - 11pm",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 12.w),),
                            ],
                          ),
                        ),
                        // SizedBox(height: 25.0.h,),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0.h,horizontal: 7.0.w),
                            child: Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SpecialCircle(width: 45.w,height: 45.w,child: Icon(MaterialCommunityIcons.web,color: myBlueColor,size: 30.h,)),
                                    SizedBox(height: 5.0.h,),
                                    Text('Website',style: TextStyle(color: Colors.black,fontSize: 11.w,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SpecialCircle(width: 45.w,height: 45.w,child: Icon(MaterialIcons.message,color: myBlueColor,size: 30.h,)),
                                    SizedBox(height: 5.0.h,),
                                    Text('Message',style: TextStyle(color: Colors.black,fontSize: 11.w,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SpecialCircle(width: 45.w,height: 45.w,child: Icon(MaterialCommunityIcons.phone,color: myBlueColor,size: 30.h,)),
                                    SizedBox(height: 5.0.h,),
                                    Text('Call',style: TextStyle(color: Colors.black,fontSize: 11.w,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SpecialCircle(width: 45.w,height: 45.w,child: Icon(MaterialCommunityIcons.map,color: myBlueColor,size: 30.h,)),
                                    SizedBox(height: 5.0.h,),
                                    Text('Direction',style: TextStyle(color: Colors.black,fontSize: 11.w,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SpecialCircle(width: 45.w,height: 45.w,child: Icon(FontAwesome.send,color: myBlueColor,size: 22.h,)),
                                    SizedBox(height: 5.0.h,),
                                    Text('Share',style: TextStyle(color: Colors.black,fontSize: 11.w,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ],
                            )
                        ),
                        Stack(
                          children: [
                            Padding(
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
                                labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color:Colors.white,fontSize: 14.w,fontWeight: FontWeight.w500),
                                unselectedLabelColor: Colors.black45,
                                tabs: const [
                                  Tab(text: "Treatments",),
                                  Tab(text: "Specialist",),
                                  Tab(text: "Gallery",),
                                  Tab(text: "Review",),
                                  Tab(text: "About",),
                                ],),
                            ),
                            Positioned(bottom:0,child:Container(width: 325.w,height: 1.0,color: Colors.grey[300],))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:16.0.h),
                          child: Expanded(
                            child: Container(width: 325.w,height: 625.w,
                              padding: EdgeInsets.only(left: 5.0.w,right: 5.0.w),
                              child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    const Center(child:Text('treatments'),),
                                    SpecialistScreen(),
                                    GalleryScreen(),
                                    ReviewScreen(),
                                    AboutScreen(phs: phs[0],),

                                  ]),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      padding: EdgeInsets.only(left: 5.0.w),
                      margin:EdgeInsets.only(top:167.h) ,
                      width: 105.w,height:22.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: myBlueColor,
                          borderRadius: BorderRadius.circular(12.w),
                        // shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: 4.0.w),
                        child: Row(
                          children: [
                            Icon(MaterialIcons.star,color: Colors.white,size: 12.w,),
                            SizedBox(width: 3.0.w,),
                            Text("4.8",style:TextStyle(color: Colors.white,fontSize: 10.0.w,fontWeight: FontWeight.w400)),
                            SizedBox(width: 3.0.w,),
                            Text('(1k+ Review)',style:TextStyle(color: Colors.white70.withOpacity(0.9),fontSize: 10.0.w,fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )
                  ),
                ),

              ],
            ),
          ),
        ),
      bottomNavigationBar: CustomBottomButton(text:'Book Appointment',onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => PackageScreen()));}),

    );

    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: <Widget>[
    //       SliverAppBar(
    //         expandedHeight: 100.0.w,
    //         floating: false,
    //         pinned: true,
    //         flexibleSpace: FlexibleSpaceBar(
    //           title: Text('Custom Scroll View Example'),
    //           background: Container(
    //             color: Colors.black45,
    //             child: Image.asset(
    //               'assets/images/clinc01.jpg',
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         ),
    //       ),
    //       SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //               (BuildContext context, int index) {
    //             return ListTile(
    //               title: Text('Item $index'),
    //             );
    //           },
    //           childCount: 50,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
      // body: CustomScrollView(
      //     slivers: [
      //       SliverAppBar(
      //         pinned: true,
      //         toolbarHeight: 70,
      //         automaticallyImplyLeading:false,
      //         expandedHeight: 300,
      //         flexibleSpace: FlexibleSpaceBar(
      //           background: Image.asset(fit:BoxFit.cover,'assets/images/clinc01.jpg'),
      //         title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //                Stack(
      //                 children: [
      //
      //                   Positioned(
      //                       top:0,left: 0,
      //                       child:                  IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),
      //                   ),
      //
      //                 ],
      //               )
      //           ],
      //         ),
      //         // bottom: PreferredSize(
      //         //   preferredSize:const Size.fromHeight(20),
      //         //   child: Container(
      //         //       width: double.maxFinite,
      //         //       padding:const EdgeInsets.only(top: 10.0,bottom: 10),
      //         //       decoration:const BoxDecoration(
      //         //           color: Colors.white,
      //         //           borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
      //         //       ),
      //         //       child:Center(
      //         //         child: BigText(text:model.name!,color: Colors.black,),
      //         //       )),
      //         // ),
      //         ),     ),
      //
      //     ],
      // ),
  }
}
