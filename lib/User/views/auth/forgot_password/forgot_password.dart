
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:co_rhema/controllers/auth/forgot_password_controller.dart';
import 'package:co_rhema/User/utils/valid_input.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _storage = GetStorage();

    ForgotPasswordControllerImp controller = Get.put(ForgotPasswordControllerImp());
    PlatformCheck.checkPlatform();
    return Scaffold(
/*
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: myGreyColor,
        elevation: 0.0,
        title: Text('Forget Password',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.grey[400])),
      ),
*/
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
        child: Form(
          key: controller.formState,
          child: controller.processing ?       Center(child: Lottie.asset(ImageAsset.loading,width: 200.w,height: 200.w))
              : ListView(children: [
            const CustomDocCard(title:"", icon: AntDesign.arrowleft,),
            SizedBox(height: 20.h),
            CustomTextTitleAuth(text: "27".tr),
            SizedBox(height: 10.h),
            CustomTextBodyAuth(
                text: "29".tr),
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
                  ctrl.userCheckEmail(ctrl.email.text).then((mail){
                      if (mail && !controller.processing) {
                        debugPrint('Status: $mail >>>>>>>>>>>>>>> GO check your email!');
                        controller.goToResetPassword();
                      } else if (!mail && controller.processing) {
                        controller.showWarningToast(context,title: "150".tr, description: "151".tr);
                      } else {
                        controller.showErrorToast(context,title: "7".tr, description: "152".tr);
                      }

                    // Get.showSnackbar(GetSnackBar(title: 'Warning',snackStyle: SnackStyle.FLOATING,message: 'Status: $mail No user exists with this email address!',));
                    // debugPrint('Status: $checkEmail ____________________ Failed!');
                  });
                  // ctrl.goToVerifyCode();
                }),
              );
            }),



            // const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }

}