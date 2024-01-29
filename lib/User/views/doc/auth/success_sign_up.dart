import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/auth/signup_success_controller.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DocSuccessSignUp extends StatelessWidget {
  const DocSuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpSuccessControllerImp controller = Get.put(SignUpSuccessControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: myGreyColor,
      //   elevation: 0.0,
      //   title: Text('32'.tr,
      //       style: Theme.of(context)
      //           .textTheme
      //           .titleLarge!
      //           .copyWith(color: Colors.grey[400],fontSize: 22.w)),
      // ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          SizedBox(height: 40.h,),
        Text('32'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.grey[500],fontSize: 22.w)),
          SizedBox(height: 40.h,),
          Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200.w,
                color: myBlueColor,
              )),
          Text("37".tr,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 30.w)),
          const Spacer(flex: 1,),
          Text("38".tr,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12.w),),
          const Spacer(flex: 18,),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToDocLoginPage();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}