import 'package:co_rhema/User/utils/delete_account_alert.dart';
import 'package:co_rhema/controllers/profileController.dart';
import 'package:co_rhema/shares/style/icon_broken.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/profile/widgets/tiles_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProfileControllerImp>(builder: (controller){
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14.0.w,top: 12.0.w),
                child: CustomDocCard(title:"83".tr, icon: AntDesign.arrowleft,),
              ),
              TilesWidget(onTap:(){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoriteLayout()));
              }, title: '84'.tr, leading: FontAwesome.user_o,
              ),
              TilesWidget(onTap:(){
                  controller.goToPasswordManager();

              },title: "85".tr,leading: Icons.key_outlined,),
              TilesWidget(onTap:(){
                deleteAccountAlert(context, onPressed: () {

                }, );
              },title: "86".tr,leading: FontAwesome.credit_card,),
            ],
          );
        },),
      ),
    );
  }
}
