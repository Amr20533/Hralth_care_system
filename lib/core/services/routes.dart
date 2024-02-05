import 'package:co_rhema/User/views/auth/OTPScreen.dart';
import 'package:co_rhema/User/views/bookings/cancel_booking.dart';
import 'package:co_rhema/User/views/doc/auth/DoctorOTPScreen.dart';
import 'package:co_rhema/User/views/doc/auth/forgot_password/forgot_password.dart';
import 'package:co_rhema/User/views/doc/auth/forgot_password/reset_password.dart';
import 'package:co_rhema/User/views/doc/auth/forgot_password/success_reset_password.dart';
import 'package:co_rhema/User/views/doc/auth/forgot_password/verify_code.dart';
import 'package:co_rhema/User/views/doc/auth/doc_login_screen.dart';
import 'package:co_rhema/User/views/doc/auth/signup_screen.dart';
import 'package:co_rhema/User/views/doc/auth/signup_verify_code.dart';
import 'package:co_rhema/User/views/doc/auth/success_sign_up.dart';
import 'package:co_rhema/User/views/doc/views/doc_man_home_screen.dart';
import 'package:co_rhema/User/views/favs/fav_screen.dart';
import 'package:co_rhema/User/views/home/details_screen.dart';
import 'package:co_rhema/User/views/profile/settings/password_manager.dart';
import 'package:co_rhema/chat_test/chat_home.dart';
import 'package:co_rhema/controllers/Doctor/home/doc_management_home_controller.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/middleware/user_middleware.dart';
import 'package:co_rhema/User/views/auth/forgot_password/forgot_password.dart';
import 'package:co_rhema/User/views/auth/forgot_password/reset_password.dart';
import 'package:co_rhema/User/views/auth/forgot_password/success_reset_password.dart';
import 'package:co_rhema/User/views/auth/forgot_password/verify_code.dart';
import 'package:co_rhema/User/views/auth/login_screen.dart';
import 'package:co_rhema/User/views/auth/signup_screen.dart';
import 'package:co_rhema/User/views/auth/signup_verify_code.dart';
import 'package:co_rhema/User/views/auth/start/on_boarding_screen.dart';
import 'package:co_rhema/User/views/auth/success_sign_up.dart';
import 'package:co_rhema/User/views/chats/chat_screen.dart';
import 'package:co_rhema/User/views/chats/chats_details_screen.dart';
import 'package:co_rhema/User/views/home/home_screen.dart';
import 'package:co_rhema/User/views/home/reviews/doctor_reviews.dart';
import 'package:co_rhema/User/views/home/reviews/filter_screen.dart';
import 'package:co_rhema/User/views/home/reviews/hospital_reviews.dart';
import 'package:co_rhema/User/views/main_screen.dart';
import 'package:co_rhema/User/views/remote_test_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> pageRoutes = [
  // GetPage(name: "/", page: ()=> const RemoteTestScreen()),

  GetPage(name: "/", page: ()=> const OnBoardingScreen(),middlewares: [
    UserMiddleWare(),

  ]
  ),
  // GetPage(name: '/', page: ()=> const LoginScreen()),
  GetPage(name: AppRoutes.login, page: ()=> const LoginScreen(),middlewares: [
    UserAuthDocWare(),

  ]),
  GetPage(name: AppRoutes.home, page: ()=> const MainScreen(),middlewares: [

  ]),
  GetPage(name: AppRoutes.chatsDetails, page: ()=> const ChatsDetailsScreen()),
  GetPage(name: AppRoutes.chatsScreen, page: ()=> ChatScreen()),
  GetPage(name: AppRoutes.forgetPassword, page: ()=> const ForgetPassword()),
  GetPage(name: AppRoutes.signUp, page: ()=> const SignUpPage()),
  GetPage(name: AppRoutes.signUpVerifyCode, page: ()=> const SignUpVerifyCode()),
  GetPage(name: AppRoutes.verifyCode, page: ()=> const OTPScreen()),
  GetPage(name: AppRoutes.resetPassword, page: ()=> const ResetPassword()),
  GetPage(name: AppRoutes.successResetPassword, page: ()=> const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: ()=> const SuccessSignUp()),
  ///Reviews
  GetPage(name: AppRoutes.doctorReviews, page: () {
    DoctorReviewScreen revScreen = Get.arguments;
    return revScreen;
  }),
  GetPage(name: AppRoutes.details, page: (){
    DetailsScreen detailScreen = Get.arguments;
    return detailScreen;
    }
  ),
  GetPage(name: AppRoutes.hospitalReviews, page: ()=> const HospitalReviewScreen()),
  GetPage(name: AppRoutes.filter, page: ()=> const FilterScreen()),
  /// OnBoarding
  GetPage(name: AppRoutes.onBoarding, page: ()=> const OnBoardingScreen()),
  /// Bookings
  GetPage(name: AppRoutes.cancelBooking, page: ()=> const CancelBooking()),
  /// Pass manager
  GetPage(name: AppRoutes.passwordManager, page: ()=> const PasswordManager()),
/// Favorites
  GetPage(name: AppRoutes.favorites, page: ()=> const FavScreen()),




    // GetPage(name: AppRoutes.test, page: ()=> const RemoteTestScreen()),




];

List<GetPage<dynamic>> docRoutes = [

  GetPage(name: '/', page: ()=> DocLoginScreen(),
      middlewares: [
        AuthDocWare()
      ]
  ),
  GetPage(name: AppRoutes.doctorsLogin, page: ()=>  DocLoginScreen(),
    ),
  GetPage(name: AppRoutes.doctorsHome, page: ()=> DocManHomeScreen()),
  // GetPage(name: AppRoutes.doctorsHome, page: ()=> const RemoteTestScreen()),
  // GetPage(name: AppRoutes.chatsDetails, page: ()=> const ChatsDetailsScreen()),
  // GetPage(name: AppRoutes.chatsScreen, page: ()=> DocChatScreen()),
  GetPage(name: AppRoutes.doctorsForgetPassword, page: ()=> const DocForgetPassword()),
  GetPage(name: AppRoutes.doctorsSignUp, page: ()=> const DocSignUpPage()),
  GetPage(name: AppRoutes.doctorsSignUpVerifyCode, page: ()=> const DocSignUpVerifyCode()),
  GetPage(name: AppRoutes.doctorsVerifyCode, page: ()=> const DocOTPScreen()),
  GetPage(name: AppRoutes.doctorsResetPassword, page: ()=> const DocResetPassword()),
  GetPage(name: AppRoutes.doctorsSuccessResetPassword, page: ()=> const DocSuccessResetPassword()),
  GetPage(name: AppRoutes.doctorsSuccessSignUp, page: ()=> const DocSuccessSignUp()),
  ///Reviews
  // GetPage(name: AppRoutes.doctorReviews, page: ()=> const DoctorReviewScreen()),
  // GetPage(name: AppRoutes.hospitalReviews, page: ()=> const HospitalReviewScreen()),
  // GetPage(name: AppRoutes.filter, page: ()=> const FilterScreen()),
  /// OnBoarding




];

//
// Map<String, Widget Function(BuildContext)> routes = {
//   AppRoutes.login: (context) => const LoginScreen(),
//   AppRoutes.home: (context) => MainScreen(),
//   AppRoutes.chatsDetails: (context) => const ChatsDetailsScreen(),
//   AppRoutes.chatsScreen: (context) => ChatScreen(),
//   // AppRoutes.details: (context) => DetailsScreen(),
//   AppRoutes.forgetPassword: (context) => const ForgetPassword(),
//   AppRoutes.signUp: (context) => const SignUpPage(),
//   AppRoutes.signUpVerifyCode: (context) => const SignUpVerifyCode(),
//   AppRoutes.verifyCode: (context) => const VerifyCode(),
//   AppRoutes.resetPassword: (context) => const ResetPassword(),
//   // AppRoutes.checkEmail: (context) => const CheckEmail(),
//   AppRoutes.successResetPassword: (context) => const SuccessResetPassword(),
//   AppRoutes.successSignUp: (context) => const SuccessSignUp(),
//   ///Reviews
//   AppRoutes.doctorReviews: (context) => const DoctorReviewScreen(),
//   AppRoutes.hospitalReviews: (context) => const HospitalReviewScreen(),
//   AppRoutes.filter: (context) => const FilterScreen(),
//   /// OnBoarding
//   AppRoutes.onBoarding: (context) => const OnBoardingScreen(),
// };