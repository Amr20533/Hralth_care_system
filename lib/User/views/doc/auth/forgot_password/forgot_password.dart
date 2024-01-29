
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/auth/forgot_password_controller.dart';
import 'package:co_rhema/User/utils/valid_input.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/auth/OTPScreen.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_body_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_text_title_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_textform_auth.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:co_rhema/core/constant/platform_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class DocForgetPassword extends StatelessWidget {
  const DocForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _storage = GetStorage();

    ForgotPasswordControllerImp controller = Get.put(ForgotPasswordControllerImp());
    PlatformCheck.checkPlatform();
    return Scaffold(
      body: Form(
        key: controller.formState,
        child: controller.processing ?       Center(child: Lottie.asset(ImageAsset.loading,width: 200.w,height: 200.w))
            : ListView(children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0.w),
            child: const CustomDocCard(title:"", icon: AntDesign.arrowleft,),
          ),
          Container(
                   padding: PlatformCheck.phsDevice ? EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w) : EdgeInsets.symmetric(vertical: size.height * 0.1, horizontal: size.width * 0.28),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CustomTextTitleAuth(text: "27".tr),
                SizedBox(height: 10.h),
                CustomTextBodyAuth(
                    text: "24".tr),
                SizedBox(height: 25.h),
                CustomTextFormAuth(
                  type: TextInputType.emailAddress,
                  inputValidator: (val){
                    return validInput(val!,12,100,"email");
                  },
                  controller: controller.email,
                  hintText: "12".tr,
                  iconData: Icons.email_outlined,
                  labelText: "18".tr,
                ),
                GetBuilder<ForgotPasswordControllerImp>(builder: (ctrl){

                  return Padding(
                    padding: PlatformCheck.phsDevice ? const EdgeInsets.symmetric(vertical: 0.0) : EdgeInsets.symmetric(vertical: size.height * 0.021, horizontal: size.width * 0.12),
                    child: CustomButtonAuth(text: "30".tr, onPressed: () {
                      ctrl.checkEmail(ctrl.email.text).then((mail){
                        if(mail && !ctrl.processing){
                          debugPrint('Status: $mail >>>>>>>>>>>>>>> GO check your email!');
                          _storage.write('resend_Email', ctrl.email.text);
                          ctrl.goToDocResetPassword();

                        }else{
                          if(ctrl.formState.currentState!.validate()){
                            CherryToast.warning(
                              displayCloseButton: false,
                              title: Text("150".tr, style: TextStyle(color: Colors.redAccent,fontSize: 16.w, fontWeight: FontWeight.bold)),
                              displayTitle:  true,
                              description:  Text("151".tr, style: const TextStyle(color: Colors.black45)),
                              animationType:  AnimationType.fromLeft,
                              animationDuration: const Duration(seconds: 2),
                              animationCurve: Curves.fastLinearToSlowEaseIn,
                              // action:  const Text("Warning!", style: TextStyle(color: Colors.redAccent)),
                              actionHandler: (){

                              },
                              autoDismiss:  true,
                              toastPosition:  Position.bottom,
                            ).show(context);

                          }

                        }


                        // Get.showSnackbar(GetSnackBar(title: 'Warning',snackStyle: SnackStyle.FLOATING,message: 'Status: $mail No user exists with this email address!',));
                        // debugPrint('Status: $checkEmail ____________________ Failed!');
                      });
                      // ctrl.goToVerifyCode();
                    }),
                  );
                }),
              ],
            ),
          )

          // const SizedBox(height: 40),
        ]),
      ),
    );
  }
}