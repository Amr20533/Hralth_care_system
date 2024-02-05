import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/auth/signUp_controller.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:co_rhema/models/signup_model.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_body_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_text_title_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_textform_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/text_signUp.dart';
import 'package:co_rhema/User/utils/valid_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SignUpControllerImp controller = Get.put(SignUpControllerImp());
    Get.lazyPut(()=>SignUpControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: myGreyColor,
      //   elevation: 0.0,
      //   title: Text('Sign Up',
      //       style: Theme.of(context)
      //           .textTheme
      //           .headline1!
      //           .copyWith(color: Colors.grey[400])),
      // ),
      body: GetBuilder<SignUpControllerImp>(builder: (controller) =>Form(
        key: controller.formState,
        child: controller.processing ? Center(child: Lottie.asset(ImageAsset.loading,width: 200.w,height: 200.w)) : Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: "40".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(
                text: "41".tr),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              type: TextInputType.name,
              inputValidator: (name){
                // return validInput(val!,3,50,"username");
                if(name!.isNotEmpty){
                    if(!name.contains(RegExp(r'[A-Z]'))){
                    return '166'.tr;
                    }
                    return null;
                    }else{
                    return '167'.tr;
                    }
              },
              controller: controller.username,
              hintText: "23".tr,
              iconData: Icons.person_outline,
              labelText: "20".tr,
            ),
            CustomTextFormAuth(
              type: TextInputType.emailAddress,
              inputValidator: (String? email){
                // return validInput(email!,12,25,"email");

                if(email!.isNotEmpty){
                  if(!email.contains("@")){
                      return 'Please Provide a valid email';
                  }
                      return null;
                  }else{
                     return '167'.tr;
                  }
  },
              controller: controller.email,
              hintText: "12".tr,
              iconData: Icons.email_outlined,
              labelText: "18".tr,
            ),
            // CustomTextFormAuth(
            //   type: const TextInputType.numberWithOptions(decimal: true),
            //   inputValidator: (val){
            //     return validInput(val!,11,11,"phone");
            //   },
            //   controller: controller.phone,
            //   hintText: "22".tr,
            //   iconData: Icons.phone_android_outlined,
            //   labelText: "21".tr,
            // ),
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
            SizedBox(height: 10.0.h,),

            CustomButtonAuth(text: "17".tr, onPressed: () {


              SignupModel signupModel = SignupModel(username: controller.username.text, email: controller.email.text, password: controller.password.text, confirmPassword: controller.password.text,);
              controller.userSignUp(signupModel).then((response){
                if(response == true && !controller.processing){
                  controller.goToSuccessSignUp();
                }else{
                  debugPrint("Form not valid");
                }
              });


            }),
            SizedBox(height: 25.0.h,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20.0.w),
                    color: Colors.grey[400],
                    height: 1,
                  ),
                ),
                SizedBox(width: 8.0.w,),
                Text('42'.tr,style: TextStyle(color: Colors.grey[500],fontSize: 9.w, fontWeight: FontWeight.w400),),
                SizedBox(width: 8.0.w,),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0.w),
                    color: Colors.grey[400],
                    height: 1,
                    // width: 20,
                  ),
                ),
                // const Expanded(
                //   child: VerticalDivider(
                //     color: Colors.grey,
                //     thickness: 1,
                //     // width: 20,
                //   ),
                // ),

              ],
            ),
            SizedBox(height: 25.0.w,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(
                    margin: EdgeInsets.only(right: 5.0.w),
                    alignment: Alignment.center,
                    height: 55.w,width: 55.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[400]!),
                      // color: Colors.black87
                    ),
                    child: SvgPicture.asset('assets/images/icons/apple.svg',width: 24.w,height: 24.w,fit: BoxFit.cover,),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5.0.w),
                    alignment: Alignment.center,
                    height: 55.w,width: 55.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[400]!),
                      // color: Colors.black87
                    ),
                    child: SvgPicture.asset('assets/images/icons/google.svg',width: 24.w,height: 24.w,fit: BoxFit.cover,),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5.0.w),
                    alignment: Alignment.center,
                    height: 55.w,width: 55.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[400]!),
                      // color: Colors.black87
                    ),
                    child: SvgPicture.asset('assets/images/icons/facebook.svg',width: 24.w,height: 24.w,fit: BoxFit.cover,color: myBlueColor,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            CustomTextSignUpOrSignIn(
              title: "25".tr,
              text: "9".tr,
              onTap: () {
                controller.goToSignIn();
              },
            ),
          ]),
        ),
      ) ,),
    );
  }
}