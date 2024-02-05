import 'package:co_rhema/User/views/auth/widgets/auth/show_cherry_toast.dart';
import 'package:co_rhema/User/views/doc/auth/forgot_password/reset_password.dart';
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
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
class DocOTPScreen extends StatelessWidget {
  const DocOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _storage = GetStorage();

    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
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

                  const CustomTextTitleAuth(text: "Verify code"),
                  SizedBox(height: 8.h),
                  // const CustomTextBodyAuth(
                  //     text: "Please enter the code we just sent to email"),
                  RichText(textAlign: TextAlign.center,
                      text: TextSpan(
                          children:[
                            TextSpan(text: 'Please enter the code we just sent to email',style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 11.w,color: Colors.black38)),
                            TextSpan(text: '\n ${_storage.read("resend_Email")}',style: TextStyle(
                                fontWeight: FontWeight.w400, height: 1.5,fontSize: 10.w,color: myBlueColor)),

                          ])),
                  SizedBox(height: 33.h),
                  OtpTextField(
                    fieldWidth: 50.0.w,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 6,
                    borderColor: myBlueColor,focusedBorderColor:myBlueColor ,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      _storage.write("doc_otp", verificationCode);
                      controller.goToDocResPassScreen();
                    }, // end onSubmit
                  ),
                  SizedBox(height: 30.h),
                  Text('2'.tr,style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 11.w,color: Colors.black45)),
                  GetBuilder<VerifyCodeControllerImp>(builder: (ctrl){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        // padding:const EdgeInsets.symmetric(vertical: 13),
                        onPressed: (){
                          String resendCode = _storage.read("resend_Email");
                          ctrl.verifyEmail(resendCode).then((mail){
                            if(mail && !ctrl.processing){
                              debugPrint('Status: $mail >>>>>>>>>>>>>>> GO check your email!');
                            }else{
                              showCherryErrorToast(context, title: Text("7".tr), description: Text("8".tr));
                            }


                            // Get.showSnackbar(GetSnackBar(title: 'Warning',snackStyle: SnackStyle.FLOATING,message: 'Status: $mail No user exists with this email address!',));
                            // debugPrint('Status: $checkEmail ____________________ Failed!');
                          });

                        },
                        child: Text('Resend code',style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 11.w,height: 1.7,color: myBlueColor,decoration: TextDecoration.underline)),
                      ),
                    );

                  }),
                  // RichText(textAlign: TextAlign.center,
                  //     text: TextSpan(
                  //         children:[
                  //           TextSpan(text: 'Did\'t receive OTP?',style: TextStyle(
                  //               fontWeight: FontWeight.w500, fontSize: 11.w,color: Colors.black45)),
                  //           TextSpan(text: '\nResend code',style: TextStyle(
                  //               fontWeight: FontWeight.w400, fontSize: 11.w,height: 1.7,color: myBlueColor,decoration: TextDecoration.underline)),
                  //         ])),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.w),
                    child: CustomButtonAuth(text: "43".tr, onPressed: () {


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
