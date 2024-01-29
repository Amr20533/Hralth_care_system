import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/favs/widgets/choice_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class EndedConsultation extends StatelessWidget {
  EndedConsultation({Key? key}) : super(key: key);
  List<Specialist> phs = Specialist.physicians;

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomDocCard(title:" ", icon: AntDesign.arrowleft,),
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.0.h,top: 45.h),
                    child: CircleAvatar(
                      radius: 60.h,backgroundColor: myBlueColor,
                      child: Icon(MaterialCommunityIcons.clock,size: 50.w,color: Colors.white,),
                      // backgroundImage: NetworkImage(image),
                    ),
                  ),
                  Text('76'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600, fontSize: 20.w,color: Colors.black),textAlign: TextAlign.center,),
                  SizedBox(height: 22.h,),
                  Text('77'.tr,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 12.w,color: const Color(0XFF797979))),
                  Padding(
                    padding: EdgeInsets.only(bottom: 18.0.h,top: 33.h),
                    child: Container(color: const Color(0XFF838383).withOpacity(0.3),height: 0.4.w,),
                  ),
                  Container(width: 88.w,height: 85.w,
                    margin: EdgeInsets.only(bottom: 12.0.h,top: 24.h),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 48.h,
                          backgroundImage:AssetImage(phs[0].image!),
                        ),
                        Positioned(bottom: 8.w,right: 5.0.w,
                            child: Icon(MaterialIcons.verified,color: myBlueColor,size: 20.w,))
                      ],
                    ),
                  ),
                  Text(phs[0].title!,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600,color: Colors.black),textAlign: TextAlign.center,),
                  SizedBox(height: 6.h,),
                  Text(phs[0].speciality!,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, color: const Color(0XFF797979))),
                  SizedBox(height: 12.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MaterialCommunityIcons.map_marker,color: myBlueColor,size: 16.w,),
                      SizedBox(width: 3.w,),
                      Text(phs[0].location!,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400, fontSize: 14.w,color: const Color(0XFF797979))),
                      SizedBox(width: 5.w,),
                      Icon(MaterialCommunityIcons.map,color: myBlueColor,size: 16.w,),

                    ],
                  ),

                ]),
          ),
        ),
      ),

      bottomNavigationBar: Container(width: double.infinity,
        height: 75.w,padding: EdgeInsets.fromLTRB(12.0.w,12.0.w,12.0.w,22.0.w),
        decoration: BoxDecoration(color: Colors.white,
            boxShadow: [BoxShadow(
              blurRadius: 22,offset:const Offset(-7,-7),
              color:const Color(0XFF797979).withOpacity(0.1),
            )],
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.w),topLeft: Radius.circular(14.w))),
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceButton(width: 130.w,height: 45.w,
                  text:'74'.tr,tColor: myBlueColor,color: kColorsLightBlue100,onTap: (){
                    Get.back();
                  }),
              ChoiceButton(width: 130.w,height: 45.w,
                  text:'75'.tr,color: myBlueColor,tColor: Colors.white,onTap: (){

                  }),
            ],),
        ) ,),
    );
  }
}
