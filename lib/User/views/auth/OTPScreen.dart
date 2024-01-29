import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/auth/verify_code_controller.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/auth/forgot_password/reset_password.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_body_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    var _storage = GetStorage();
    String resendCode = _storage.read("user_resend_Email");

    return Scaffold(
      backgroundColor: myGreyColor,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0.w,left: 16.0.w),
              child: const CustomDocCard(title:"", icon: AntDesign.arrowleft,),
            ),
            SizedBox(height: 30.h,),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10.w),

                  CustomTextTitleAuth(text: "3".tr),
                  SizedBox(height: 8.h),
                  // const CustomTextBodyAuth(
                  //     text: "Please enter the code we just sent to email"),
                  Text('2'.tr,style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 11.w,color: Colors.black45)),
                  GetBuilder<VerifyCodeControllerImp>(builder: (ctrl){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        // padding:const EdgeInsets.symmetric(vertical: 13),
                        onPressed: (){
                          ctrl.userVerifyEmail(resendCode).then((mail){
                            if(mail && !ctrl.processing){
                              debugPrint('Status: $mail >>>>>>>>>>>>>>> GO check your email!');
                            }


                            // Get.showSnackbar(GetSnackBar(title: 'Warning',snackStyle: SnackStyle.FLOATING,message: 'Status: $mail No user exists with this email address!',));
                            // debugPrint('Status: $checkEmail ____________________ Failed!');
                          });

                        },
                        child: Text(resendCode,style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 11.w,height: 1.7,color: myBlueColor,decoration: TextDecoration.underline)),
                      ),
                    );

                  }),

                  SizedBox(height: 33.h),
                  OtpTextField(
                    fieldWidth: 50.0.w,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 5,
                    borderColor: myBlueColor,focusedBorderColor:myBlueColor ,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      // controller.goToResetPassword();
                    }, // end onSubmit
                  ),
                  SizedBox(height: 30.h),
                  RichText(textAlign: TextAlign.center,
                      text: TextSpan(
                          children:[
                            TextSpan(text: '50'.tr,style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 11.w,color: Colors.black45)),
                            TextSpan(text: '\n${'4'.tr}',style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 11.w,height: 1.7,color: myBlueColor,decoration: TextDecoration.underline)),
                          ])),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.w),
                    child: CustomButtonAuth(text: "43".tr, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));

                      // controller.goToHomeScreen();
                    }),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
