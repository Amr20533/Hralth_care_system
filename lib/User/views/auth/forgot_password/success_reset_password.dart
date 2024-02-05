
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/auth/reset_password_succes_controller.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordSuccessControllerImp controller = Get.put(ResetPasswordSuccessControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: myGreyColor,
      //   elevation: 0.0,
      //   title: Text('Success',
      //       style: Theme.of(context)
      //           .textTheme
      //           .headline1!
      //           .copyWith(color: Colors.grey[400])),
      // ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: myBlueColor,
              )),
          Text("37".tr , style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 30)),
          Text("36".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
                text: "8".tr,
                onPressed: () {
                  controller.goToLoginPage();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );

  }
}