import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/help_center_controller.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/User/views/favs/fav_doc_screen.dart';
import 'package:co_rhema/User/views/favs/fav_hospitals_screen.dart';
import 'package:co_rhema/User/views/home/widgets/custom_form_field.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:co_rhema/User/views/profile/Help_center/contact_screen.dart';
import 'package:co_rhema/User/views/profile/Help_center/faq_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> with TickerProviderStateMixin{
  late final TabController _tabController = TabController(length: tabs.length, vsync: this);

  List<String> tabs = ["103".tr, "104".tr];
  List<Specialist> phs = Specialist.physicians;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: GetBuilder<HelpCenterControllerImp>(builder: (controller){
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 8.0.w),
                    child: Row(
                      children: [
                        IconCircle(onTap:(){Get.back();},icon: AntDesign.arrowleft,),
                        const Spacer(flex: 2,),
                        Text('105'.tr,style: TextStyle(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
                        const Spacer(flex: 3,),
                      ],),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: CustomFormField(
                        controller: controller.search,
                        hintText: "106".tr,
                        borderRadius: BorderRadius.circular(16.0.w),
                        width: 325.w,height: 40.w,
                        focusBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: myBlueColor, width: 2.0),
                          borderRadius: BorderRadius.circular(12.0.w),
                        ),
                        prefixIcon:const Icon(AntDesign.search1,color: myBlueColor,)),
                  ),
                  SizedBox(height: 14.h,),
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
                            labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,fontSize: 14.w),
                            unselectedLabelColor: Colors.black45,
                            labelPadding: EdgeInsets.only(left: 50.w,right: 50.w),
                            indicatorPadding: EdgeInsets.only(left:_tabController.index == 1 ? 15.w : 0),
                            // tabAlignment: TabAlignment.center,
                            tabs:  [
                              Tab(text: tabs[0],),
                              Tab(text: tabs[1],),
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
                            children: const[
                              FAQScreen(),
                              ContactScreen(),
                            ]),
                      ),
                    ),
                  ),
                ]);
          },)
        ),
      ),
    );
  }
}
