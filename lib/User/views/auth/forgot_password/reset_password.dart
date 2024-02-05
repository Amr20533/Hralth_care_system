
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _storage = GetStorage();
    Get.put(ResetPasswordControllerImp());
    Get.put(DocManagementHomeController());
    Get.put(ProfileControllerImp());
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
          child: Form(
            key: controller.formState,
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
                hintText: "Re ${'13'.tr}",
                iconData: Icons.lock_outline,
                labelText: "46".tr,
              ),
              SizedBox(height: 24.h),

              CustomButtonAuth(
                  text: "33".tr,
                  onPressed: () async{
                        String otp = _storage.read("user_otp");
                        controller.resetPassword(otp, controller.password.text).then((newPass){
                          if(newPass && controller.password.text == controller.resPassword.text){
                              controller.goToSuccessResetPassword();
                          }else if(controller.password.text != controller.resPassword.text){
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
                              actionHandler: (){},
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
              // const SizedBox(height: 40),
            ]),
          ),
        ),
      );
    });
  }
}