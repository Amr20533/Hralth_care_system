
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

abstract class HelpCenterController extends GetxController {
  toggleItem(String item);
  expandContainer(int panelIndex,bool value);
}

class HelpCenterControllerImp extends HelpCenterController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool expand = false;
  final selectedItems = <String>[].obs; // Declaration of selectedItems as a reactive list
  final List<String> filterList =['All','Services','General','Account','Account',].obs;
  List<bool> isExpandedList = [false, false,false, false,false, false,false,]; // Track expansion state for each panel
  List<String> expandedTitles = ["107".tr,"108".tr,"109".tr,"110".tr,"111".tr,"112".tr,"113".tr,]; // Track expansion state for each panel
  List<String> contactList = ["100".tr,"(480) 555-0103","https://example.com","https://www.facebook.com","https://www.twitter.com","https://www.instagram.com"]; // Track expansion state for each panel
  List<String> contactTitle = ["114".tr,"115".tr,"116".tr,"117".tr,"118".tr,"119".tr]; // Track expansion state for each panel
  List<IconData> icons = [MaterialCommunityIcons.headphones,MaterialCommunityIcons.whatsapp,MaterialCommunityIcons.web,MaterialCommunityIcons.facebook,MaterialCommunityIcons.twitter,MaterialCommunityIcons.instagram,]; // Track expansion state for each panel
  late TextEditingController search;


  // @override
  // goToSignIn() {
  //   Get.offNamed(AppRoutes.login);
  // }

  @override
  void onInit() {
    search = TextEditingController() ;
    super.onInit();
  }

  @override
  void toggleItem(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
      update();
    } else {
      selectedItems.add(item);
      update();
    }
  }
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  expandContainer(int panelIndex,bool value) {
      isExpandedList[panelIndex] = value;
    update();
  }
}
