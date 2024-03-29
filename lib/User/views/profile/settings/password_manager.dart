
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:co_rhema/User/views/appointment/patient_details.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/Doctor/home/doc_management_home_controller.dart';
import 'package:co_rhema/controllers/auth/reset_password_controller.dart';
import 'package:co_rhema/User/utils/valid_input.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_body_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_text_title_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_textform_auth.dart';
import 'package:co_rhema/controllers/profileController.dart';
import 'package:co_rhema/models/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class PasswordManager extends StatelessWidget {
  const PasswordManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return GetBuilder<ProfileControllerImp>(builder: (controller){
      return Scaffold(
        backgroundColor: myGreyColor,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
          child: Form(
            key: controller.formState,
            child: ListView(children: [
              CustomDocCard(title:"85".tr, icon: AntDesign.arrowleft,),
              SizedBox(height: 20.h,),

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
              GestureDetector(onTap: (){
                controller.goToForgetPassword();
              },
                  child: Text("14".tr,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 10.w,decoration: TextDecoration.underline), textAlign: TextAlign.end,)),

              // Text(
              //   "14".tr,
              //   textAlign: TextAlign.end,
              // ),
              SizedBox(height: 15.h),
              CustomTextFormAuth(
                type: TextInputType.visiblePassword,
                inputValidator: (val){
                  return validInput(val!,6,65,"password");
                },
                suffixTap: (){
                  controller.resetPasswordToggleIcon();
                },
                suffixIcon: controller.isResetPassword ?  Icons.visibility_off_sharp : Icons.visibility_sharp,
                isPassword: controller.isResetPassword,
                controller: controller.resPassword,
                hintText: '13'.tr,
                iconData: Icons.lock_outline,
                labelText: "35".tr,
              ),
              SizedBox(height: 10.h),
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
                controller: controller.confPassword,
                hintText: "Re ${'13'.tr}",
                iconData: Icons.lock_outline,
                labelText: "46".tr,
              ),
              SizedBox(height: 24.h),

              // const SizedBox(height: 40),
            ]),
          ),
        ),
      bottomNavigationBar: CustomBottomButton(text: "153".tr,onTap:()async{
        UpdatePasswordModel model = UpdatePasswordModel(currentPassword: controller.password.text, newPassword: controller.resPassword.text, confirmPassword: controller.confPassword.text);
        String? token = controller.getUserToken();
        controller.updatePassword(token!, model).then((newPass){
          if(newPass && controller.password.text == controller.resPassword.text){
            controller.userLogout();
            controller.update();
          }else if(controller.confPassword.text != controller.resPassword.text){
            CherryToast.warning(
              displayCloseButton: false,
              enableIconAnimation: true,
              title: Text("150".tr, style: TextStyle(color: Colors.amber,fontSize: 16.w, fontWeight: FontWeight.bold)),
              displayTitle:  true,
              description:  Text("5".tr, style: const TextStyle(color: Colors.black45)),
              animationType:  AnimationType.fromLeft,
              animationDuration: const Duration(seconds: 2),
              animationCurve: Curves.fastLinearToSlowEaseIn,
              // action:  const Text("Warning!", style: TextStyle(color: Colors.redAccent)),
              actionHandler: (){


              },
              autoDismiss:  true,
              toastPosition:  Position.bottom,
            ).show(context);

          }else{
            CherryToast.error(
              displayCloseButton: false,
              title: Text("7".tr, style: TextStyle(color: Colors.redAccent,fontSize: 16.w, fontWeight: FontWeight.bold)),
              displayTitle:  true,
              description:  Text("6".tr, style: const TextStyle(color: Colors.black45)),
              animationType:  AnimationType.fromLeft,
              animationDuration: const Duration(seconds: 2),
              animationCurve: Curves.fastLinearToSlowEaseIn,
              // action:  const Text("Warning!", style: TextStyle(color: Colors.redAccent)),
              actionHandler: (){

              },
              enableIconAnimation: true,
              autoDismiss:  true,
              toastPosition:  Position.bottom,
            ).show(context);

          }

        });
      }),

      );
    });
  }
}