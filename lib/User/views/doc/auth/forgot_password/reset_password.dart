
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/auth/reset_password_controller.dart';
import 'package:co_rhema/User/utils/valid_input.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_body_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_text_title_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class DocResetPassword extends StatelessWidget {
  const DocResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return GetBuilder<ResetPasswordControllerImp>(builder: (controller){
      return Scaffold(
        backgroundColor: myGreyColor,
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: myGreyColor,
        //   elevation: 0.0,
        //   title: Text('ResetPassword',
        //       style: Theme.of(context)
        //           .textTheme
        //           .headline1!
        //           .copyWith(color: Colors.grey[400])),
        // ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
          child: ListView(children: [
            const CustomDocCard(title:"", icon: AntDesign.arrowleft,),
            SizedBox(height: 20.h,),
            CustomTextTitleAuth(text: "35".tr),
            SizedBox(height: 12.h),
            // CustomTextBodyAuth(text: "44".tr),
            Center(
                child: Text('44'.tr,style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 11.w,color: Colors.black38))),
            SizedBox(height: 30.h),
            CustomTextFormAuth(
              type: TextInputType.visiblePassword,
              inputValidator: (val){
                return validInput(val!,6,65,"password");
              },
              suffixTap: (){
                controller.toggleIcon();
              },
              suffixIcon: controller.isPassword ?  Icons.visibility_off_sharp : Icons.visibility_sharp,
              isPassword: controller.isPassword,
              controller: controller.password,
              hintText: "13".tr,
              iconData: Icons.lock_outline,
              labelText: "19".tr,
            ),
            SizedBox(height: 8.h),

            CustomTextFormAuth(
              type: TextInputType.visiblePassword,
              inputValidator: (val){
                return validInput(val!,6,65,"password");
              },
              suffixTap: (){
                controller.confPasswordToggleIcon();
              },
              suffixIcon: controller.isConfirmPassword ?  Icons.visibility_off_sharp : Icons.visibility_sharp,
              isPassword: controller.isConfirmPassword,
              controller: controller.resPassword,
              hintText: "Re" + " " + "13".tr,
              iconData: Icons.lock_outline,
              labelText: "46".tr,
            ),
            SizedBox(height: 24.h),

            CustomButtonAuth(
                text: "33".tr,
                onPressed: () {
                  // controller.goToSuccessResetPassword();
                }),
            // const SizedBox(height: 40),
          ]),
        ),
      );
    });
  }
}