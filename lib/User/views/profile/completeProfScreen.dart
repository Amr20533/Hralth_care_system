
import 'package:co_rhema/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:co_rhema/controllers/profileController.dart';
import 'package:co_rhema/User/utils/valid_input.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/appointment/widgets/dropped_card.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_body_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_text_title_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class CompleteProfScreen extends StatelessWidget {
  const CompleteProfScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     Get.lazyPut(()=> ProfileControllerImp());
    return Scaffold(
      backgroundColor: myGreyColor,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: myGreyColor,
      //   elevation: 0.0,
      //   title: Text('CompleteProfScreen',
      //       style: Theme.of(context)
      //           .textTheme
      //           .headline1!
      //           .copyWith(color: Colors.grey[400])),
      // ),
      body: GetBuilder<ProfileControllerImp>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 18.w),
            child: ListView(children: [
              const CustomDocCard(title:"", icon: AntDesign.arrowleft,),
              SizedBox(height: 20.h,),
              CustomTextTitleAuth(text: "47".tr),
              Center(
                child: Text('48'.tr,style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 11.w,color: Colors.black38)),
              ),
              SizedBox(height: 15.h),
              Center(
                child: Stack(alignment: AlignmentDirectional.bottomEnd,
                  children: [
                  SizedBox(width: 85.w,height: 85.w,
                    child: CircleAvatar(
                        radius: 32.h,backgroundColor: const Color(0XFFE5E5E5),
                        child: Icon(Ionicons.person,size: 36.w,color: const Color(0XFF797979),),
                        // backgroundImage: NetworkImage(image),
                      ),
                    ),
                    Positioned(bottom: 0,right: -2.w,
                        child: Container(width: 26.w,height: 26.w,
                          alignment: Alignment.center,
                          decoration:const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(width: 20.w,height: 20.w,
                              decoration:const BoxDecoration(
                                color: myBlueColor,
                                shape: BoxShape.circle
                              ),
                              child: Icon(MaterialIcons.edit,color: Colors.white,size: 14.w,)),
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
                hintText: "50".tr,
                iconData: Icons.person_outline,
                labelText: "49".tr,
              ),
              Padding(
                padding: EdgeInsets.only(top:6.0.h,bottom: 10.0.h,),
                child: Text('21'.tr,style: TextStyle(color: Colors.black87,fontSize: 12.0.w,fontWeight: FontWeight.normal),),
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                  hintText: "|  " + "22".tr,
                  hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 11.w),
                  // prefixIcon: Icon(AntDesign.search1,color: Colors.blue[500],),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  contentPadding:  EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 10.w),
                  // contentPadding: EdgeInsets.only(bottom: 5.w,top: 8.w),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.w),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  // prefixIcon: Icon(iconData),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.w)),
                ),
                initialCountryCode: 'EG',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
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
              SizedBox(height: 18.h),
              CustomButtonAuth(
                  text: "54".tr,
                  onPressed: () {
                    // controller.goToSuccessCompleteProfScreen();
                  }),
              // const SizedBox(height: 40),
            ]),
          );
        }
      ),
    );
  }
}