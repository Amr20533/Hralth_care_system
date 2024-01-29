import 'package:co_rhema/constants.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/localization/change_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0,vertical: 5.0),
              child: Text('1'.tr,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 22.0,),),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 80.0,vertical: 5.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: myBlueColor,

                borderRadius: BorderRadius.circular(25.0),
              ),
              child: MaterialButton(onPressed: (){
                controller.changeLanguage("en");
                Get.offNamed(AppRoutes.onBoarding);
              },
                textColor: Colors.white,
              child: const Text('En',style:TextStyle(fontWeight: FontWeight.bold),),),
            ),Container(
              margin: const EdgeInsets.symmetric(horizontal: 80.0,vertical: 5.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: myBlueColor,

                borderRadius: BorderRadius.circular(25.0),
              ),
              child: MaterialButton(onPressed: (){
                controller.changeLanguage("ar");
                Get.offNamed(AppRoutes.home);
              },
                textColor: Colors.white,
              child: const Text('Ar',style:TextStyle(fontWeight: FontWeight.bold),),),
            )
          ],
        ),
      ),
    );
  }
}
