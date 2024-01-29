import 'package:co_rhema/User/utils/app_exit_alert.dart';
import 'package:co_rhema/User/utils/valid_input.dart';
import 'package:co_rhema/User/views/doc/models/auth/doc_login_model.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/auth/login_controller.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_body_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_text_title_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_textform_auth.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/text_signUp.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class DocLoginScreen extends StatelessWidget {
   DocLoginScreen({Key? key}) : super(key: key);
  String platform = 'Unknown';


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Check if the app is running on the web
    if (kIsWeb) {
      platform = 'Web';
    } else {
      // Check if running on desktop (Windows, Linux, macOS)
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        platform = 'Desktop';
      }
      // Check if running on Android
      else if (Platform.isAndroid) {
        platform = 'Android';
      }else{
        platform = 'ios';
      }
    }
    bool phsDevice = (platform == 'Android' || platform == 'ios');

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
          padding: phsDevice ? EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w) : EdgeInsets.symmetric(vertical: size.height * 0.1, horizontal: size.width * 0.28),
          child:controller.processing ? Center(child: Lottie.asset(ImageAsset.loading,width: 200.w,height: 200.w)) : Center(
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
                inputValidator: (val){
                  return validInput(val!,12,100,"email");
                },
                controller: controller.email,
                hintText: "12".tr,
                iconData: Icons.email_outlined,
                labelText: "18".tr,
              ),
              CustomTextFormAuth(
                type: TextInputType.visiblePassword,
                inputValidator: (password){
                  // return validInput(val!,6,65,"password");
                  if(password!.isEmpty || password.length < 7){
                    return 'Password is too weak';
                  }
                  // else if(password.isEmpty || password.length > 20){
                  //   return 'Password is Strong';
                  // }
                  else{
                    return null;
                  }
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
                controller.goToDocForgetPassword();
              },
                  child: Text("14".tr,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 10.w,decoration: TextDecoration.underline), textAlign: TextAlign.end,)),

              // Text(
              //   "14".tr,
              //   textAlign: TextAlign.end,
              // ),
              SizedBox(height: 30.h),

              Padding(
                padding:phsDevice ? EdgeInsets.symmetric(horizontal: 15.w) : EdgeInsets.symmetric(horizontal: size.width * 0.12),
                child: CustomButtonAuth(text: "26".tr, onPressed: () {
                  DocLoginModel loginModel = DocLoginModel(email: controller.email.text, password: controller.password.text);
                  controller.doctorLogin(loginModel).then((response){
                    if(response == true){
                      debugPrint("Status Success - Logged in: $response");
                      controller.goToDocHomeScreen();
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DocManHomeScreen() ));
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RemoteTestScreen() ));
                    }else{
                      debugPrint(" ************************ Could not log in check your credentials! ***********************");
                    }
                  });
                  // controller.goToDocHomeScreen();
                }),
              ),
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
                controller.goToDocSignUp();
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
