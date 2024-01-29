import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/profileController.dart';
import 'package:co_rhema/shares/style/icon_broken.dart';
import 'package:co_rhema/User/utils/valid_input.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/appointment/widgets/dropped_card.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_textform_auth.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/User/views/profile/widgets/tiles_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileControllerImp>(builder: (controller){
        debugPrint('${controller.data.length}');
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:14.0.w,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.0.h),
                  child: CustomDocCard(
                    title: "87".tr, icon: AntDesign.arrowleft,),
                ),
                Center(
                  child: Stack(alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(width: 94.w, height: 94.w,
                        margin: EdgeInsets.only(top: 10.h),
                        child: CircleAvatar(
                          radius: 36.h,
                          backgroundImage: const NetworkImage(
                              'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D'),
                          // backgroundImage: NetworkImage(image),
                        ),
                      ),
                      Positioned(bottom: 0, right: 2.w,
                          child: Container(width: 30.w,
                            height: 30.w,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Container(width: 24.w, height: 24.w,
                                decoration: const BoxDecoration(
                                    color: myBlueColor,
                                    shape: BoxShape.circle
                                ),
                                child: Icon(MaterialIcons.edit, color: Colors.white,
                                  size: 14.w,)),
                          ))
                      // child: Icon(MaterialIcons.verified,color: myBlueColor,size: 14.w,))
                    ],
                  ),
                ),
                SizedBox(height: 30.h),

                CustomTextFormAuth(
                  type: TextInputType.name,
                  inputValidator: (val){
                    return validInput(val!,12,100,"username");
                  },
                  controller: controller.username,
                  hintText: "${controller.data[0]['name']}",
                  // hintText: "50".tr,
                  iconData: Icons.person_outline,
                  labelText: "49".tr,
                ),
                CustomTextFormAuth(
                  type: const TextInputType.numberWithOptions(decimal: true),
                  inputValidator: (val){
                    return validInput(val!,11,11,"phone");
                  },
                  isPhone:true,
                  suffixText: '90'.tr,
                  controller: controller.phone,
                  hintText: "22".tr,
                  iconData: Icons.phone_android_outlined,
                  labelText: "21".tr,
                ),
                CustomTextFormAuth(
                  type: TextInputType.emailAddress,
                  inputValidator: (val){
                    return validInput(val!,12,100,"email");
                  },
                  controller: controller.email,
                  hintText: "example@gmail.com",
                  iconData: Icons.email_outlined,
                  labelText: "18".tr,
                ),
                CustomTextFormAuth(
                  type: TextInputType.datetime,
                  inputValidator: (val){
                    return validInput(val!,8,8,"date");
                  },
                  controller: controller.date,
                  hintText: "89".tr,
                  iconData: Icons.date_range_outlined,
                  labelText: "88".tr,
                ),
                // SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(top:6.0.h,bottom: 10.0.h,),
                  child: Text('51'.tr,style: TextStyle(color: Colors.black87,fontSize: 12.0.w,fontWeight: FontWeight.normal),),
                ),
                DroppedCard(
                  text: controller.selectedGender,
                  items: controller.genderList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                        value: value,
                        child:Text(value) );
                  }).toList(),
                  onChanged: (String? value){
                    controller.genderSelector(value:value!);
                  },),
          GestureDetector(
            onTap: (){},
            child: Container(width: double.infinity,height: 40.w,
              margin: EdgeInsets.only(top: 50.w,bottom: 5.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: myBlueColor,
                borderRadius: BorderRadius.circular(25.0.w),
              ),
              child: Center(
                child: Text('91'.tr,style: TextStyle(color: Colors.white,fontSize: 15.w,fontWeight: FontWeight.w400),),
              ),
            ),
          ) ,
              ],
            ),
          ),
        );
      },),
      // bottomNavigationBar: CustomBottomButton(text: "91".tr,onTap: (){},),
    );
  }
}