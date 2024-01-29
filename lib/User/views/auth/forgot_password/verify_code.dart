// import 'package:co_rhema/User/utils/valid_input.dart';
//
// import 'package:co_rhema/constants.dart';
// import 'package:co_rhema/controllers/auth/forgot_password_controller.dart';
// import 'package:co_rhema/User/views/auth/widgets/auth/custom_button_auth.dart';
// import 'package:co_rhema/User/views/auth/widgets/auth/custom_body_auth.dart';
// import 'package:co_rhema/User/views/auth/widgets/auth/custom_text_title_auth.dart';
// import 'package:co_rhema/User/views/auth/widgets/auth/custom_textform_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class VerifyCode extends StatelessWidget {
//   const VerifyCode({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ForgotPasswordControllerImp controller = Get.put(ForgotPasswordControllerImp());
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   backgroundColor: myGreyColor,
//       //   elevation: 0.0,
//       //   title: Text('Verification Code',
//       //       style: Theme.of(context)
//       //           .textTheme
//       //           .displayLarge!
//       //           .copyWith(color: Colors.grey[400])),
//       // ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         child: ListView(children: [
//           const SizedBox(height: 20),
//           CustomTextTitleAuth(text: "Check code"),
//           const SizedBox(height: 10),
//           const CustomTextBodyAuth(
//               text:
//               "Sign Up With Your Email And Password OR Continue With Social Media"),
//           const SizedBox(height: 15),
//           CustomTextFormAuth(
//             type: TextInputType.emailAddress,
//             inputValidator: (val){
//               return validInput(val!,12,100,"email");
//             },
//             controller: controller.email,
//             hintText: "Enter Your Email",
//             iconData: Icons.email_outlined,
//             labelText: "Email",
//           ),
//           CustomButtonAuth(text: "Check", onPressed: () {controller.goToVerifyCode();}),
//           const SizedBox(height: 40),
//         ]),
//       ),
//     );
//   }
// }