
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/services/app_services.dart';
import 'package:co_rhema/User/utils/data_source/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



abstract class OnBoardingController extends GetxController {
  next();
  prev();
  boardingSkip();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;
  AppServices appServices = Get.find();


  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      appServices.sharedPreferences.setString("on-Boarding", "1");
      boardingSkip();
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }
  @override
  prev() {
    currentPage--;
    pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    update();
  }
  @override
  boardingSkip() {
    Get.offAllNamed(AppRoutes.login) ;
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}