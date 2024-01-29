import 'package:co_rhema/User/utils/app_exit_alert.dart';
import 'package:co_rhema/User/utils/valid_input.dart';

import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/auth/login_controller.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_body_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_text_title_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_textform_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/text_signUp.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:co_rhema/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoginControllerImp controller = Get.put(LoginControllerImp());
    Get.lazyPut(() => LoginControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   title: Text('Sign In',
      //       style: Theme.of(context)
      //           .textTheme
      //           .displayLarge!
      //           .copyWith(color: Colors.grey[600])),
      // ),
      body: WillPopScope(
        onWillPop: appExitAlert,
        child: GetBuilder<LoginControllerImp>(builder: (controller)=> Container(
          padding:  EdgeInsets.symmetric(vertical: 15, horizontal: 20.w),
          child: controller.processing ? Center(child: Lottie.asset(ImageAsset.loading,width: 200.w,height: 200.w)) :Form(
            key: controller.formState,
            child: ListView(children: [
              // const LogoAuth(),
              SizedBox(height: 20.h) ,
              CustomTextTitleAuth(text: "9".tr),
              SizedBox(height: 10.h),
              CustomTextBodyAuth(
                  text: "10".tr),
               SizedBox(height: 20.h),
              CustomTextFormAuth(
                type: TextInputType.emailAddress,
                inputValidator: (email){
                  // return validInput(email!,12,100,"email");
                  if(email!.isNotEmpty){
                    if(!email.contains("@")){
                      return 'Please Provide a valid email';
                    }
                    return null;
                  }else{
                    return 'Field cannot be empty';
                  }
                },
                controller: controller.email,
                hintText: "12".tr,
                iconData: Icons.email_outlined,
                labelText: "18".tr,
              ),
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
              GestureDetector(onTap: (){
                controller.goToForgetPassword();
              },
                  child: Text("14".tr,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 10.w,decoration: TextDecoration.underline), textAlign: TextAlign.end,)),

              // Text(
              //   "14".tr,
              //   textAlign: TextAlign.end,
              // ),
              SizedBox(height: 30.h),

              CustomButtonAuth(text: "26".tr, onPressed: () {
                LoginModel loginModel = LoginModel(email: controller.email.text, password: controller.password.text,);
                controller.userLogin(loginModel).then((response){
                  if(response == true){
                    debugPrint("Status Success - User Logged in: $response");
                    controller.goToHomeScreen();
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DocManHomeScreen() ));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RemoteTestScreen() ));
                  }else{
                    debugPrint(" ************************ 'User' Could not log in check your credentials! ***********************");
                  }
                });;

              }),
              SizedBox(height: 30.h),
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
                  Text('39'.tr,style: TextStyle(color: Colors.grey[500],fontSize: 9.w, fontWeight: FontWeight.w400),),
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
              SizedBox(height: 30.0.w,),
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

              SizedBox(height: 30.0.w,),

              // SocialIconsDivider(),
              CustomTextSignUpOrSignIn(title:"16".tr ,text: "17".tr, onTap: () {
                controller.goToSignUp();
              },),
/*
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("16".tr,style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 9.w),),
                  InkWell(
                    onTap: (){
                      controller.goToSignUp();
                    },
                    child: Text("17".tr,
                       style: Theme.of(context).textTheme.titleSmall!.copyWith(
                           color: myBlueColor,
                           fontWeight: FontWeight.bold,decoration: TextDecoration.underline,fontSize: 9.w),),
                  ),
                ],
              ),
*/
            ]),
          ),
        ),),
      )
    );
  }
}
