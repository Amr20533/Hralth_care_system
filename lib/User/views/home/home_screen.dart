import 'package:co_rhema/User/views/home/widgets/location_bar.dart';
import 'package:co_rhema/User/views/home/widgets/schedule_card.dart';
import 'package:co_rhema/User/views/home/widgets/search_filter_bar.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/controllers/home/main_screen_controller.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/shares/style/icon_broken.dart';
import 'package:co_rhema/User/views/home/details_screen.dart';
import 'package:co_rhema/User/views/home/hospital_details.dart';
import 'package:co_rhema/User/views/home/nearby_hospital_screen.dart';
import 'package:co_rhema/User/views/home/top_specialist_screen.dart';
import 'package:co_rhema/User/views/home/widgets/custom_form_field.dart';
import 'package:co_rhema/User/views/home/widgets/hospital_slider.dart';
import 'package:co_rhema/User/views/home/widgets/special_circle.dart';
import 'package:co_rhema/User/views/home/widgets/specialisit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<Specialist> spec = Specialist.Specialists;
  List<Specialist> phs = Specialist.physicians;
  // ScrollController scrollController = ScrollController();
  static const IconData verified = IconData(0xe699, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(builder: (controller){
      return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 3.0.h),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0.h,left: 3.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LocationBar(),
                    SizedBox(height: 20.0.h,),
                    SearchFilterBar(controller: controller.searchController,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0.h),
                      child: CategoryBar(text: "131".tr,hasIcon: true,onPressed:(){}),
                    ),
                    /// dental specialist
                    ScheduleCard(time: "09:00 - 10:00",date: DateFormat('EEEE, d MMM').format(DateTime.now()),
                      phoneTap: (){

                      },),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0.h),
                      child: CategoryBar(text: "Doctor Speciality",onPressed:(){}),
                    ),
                    /// ****************************** Doctor Speciality *********************************************
                    SizedBox(
                      height: 85.h,
                      // height: 120.h,
                      child: ListView.separated(
                        itemCount: spec.length,scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),shrinkWrap: true,
                        // controller:scrollController ,
                        itemBuilder: (context,index) => Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SpecialCircle(width: 50.w,height: 50.w,child: SvgPicture.asset('${spec[index].image}',width: index ==0? 24.w : 34.w,height: index ==0? 24.w : 34.w,color: spec[index].color,)),
                            SizedBox(height: 5.0.h,),
                            Text('${spec[index].title}', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500,fontSize: 14.w),overflow: TextOverflow.ellipsis,maxLines: 1,),
                          ],
                        ),
                        separatorBuilder: (context,index) => SizedBox(width: index == 0? 18.w : 16.0.w,),
                        // separatorBuilder: (context,index) => SizedBox(width: index == 0? 20.w : 16.0.w,),
                      ),
                    ),
                    ///****************************** Nearby Hospitals *********************************************
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0.h),
                      child: CategoryBar(text: "132".tr,onPressed:(){
                        Navigator.push(context,MaterialPageRoute(builder:(context) => NearbyHospitalScreen(phs: phs,)));
                      }),
                    ),
                    SizedBox(
                      height: 185.h,
                      // height: 205.h,
                      child: ListView.separated(
                        itemCount: 5,scrollDirection: Axis.horizontal,padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),shrinkWrap: true,
                        itemBuilder: (context,index) => GestureDetector(onTap:(){Navigator.push(context,MaterialPageRoute(builder:(context) => const HospitalDetails()));},
                            child: const HospitalSlider(image:'assets/images/clinc01.jpg',ratings:'4.8',title: 'Elevate Dental', time:'15 min',distance: '1.5km',)),
                        separatorBuilder: (context,index) => SizedBox(width: 12.0.w,),
                      ),
                    ),


                    /// ***************************** Top Specialist *********************
                    CategoryBar(text: "133".tr,onPressed:() {
                      Navigator.push(context,MaterialPageRoute(builder:(context) => TopSpecialistScreen(phs: phs,)));
                    }),
                    ListView.separated(
                      itemCount: phs.length,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
                      // controller:scrollController ,
                      itemBuilder: (context,index) => SpecialistCard(favTap:(){},onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(phs:phs[index] ,)));},phs: phs[index], verified: verified, child: GestureDetector(
                        onTap:(){},
                        child: SvgPicture.asset('assets/images/icons/heart-icon.svg'),
                      ),),
                      separatorBuilder: (context,index) => SizedBox(height: 12.0.h,),
                    ),
                  ]    ),
            ),
          )
      );
    });
  }
}











class CategoryBar extends StatelessWidget {
  const CategoryBar({
    required this.text,
    required this.onPressed,
    this.hasIcon = false,
    super.key,
  });
  final String text;
  final Function()? onPressed;
  final bool hasIcon;
  @override
  Widget build(BuildContext context) {
    // padding: EdgeInsets.fromLTRB(2.w,6.h,0.w,6.h),

    return Column(children: [
      Row(mainAxisAlignment:MainAxisAlignment.start,
          children:[
            Text(text, style: categoryBarStyle(context)),
            hasIcon ?SizedBox(width: 6.w,) : Container(),
            hasIcon ? Container(width: 22.w,height: 22.h,
                // padding: EdgeInsets.only(left: 5.0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: myBlueColor,
                    shape: BoxShape.circle
                    // borderRadius: BorderRadius.circular(26.0)
                ),
                child:Text('8',style: TextStyle(color: Colors.white,fontSize: 14.h),)
            ) : Container(),
            const Spacer(),
            TextButton(onPressed:onPressed,child: Text("134".tr, style: categoryBarSuffixStyle(context)))
          ]),
    ],);
  }
}
