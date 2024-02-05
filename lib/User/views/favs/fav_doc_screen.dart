import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/favs/widgets/choice_button.dart';
import 'package:co_rhema/User/views/home/details_screen.dart';
import 'package:co_rhema/User/views/home/widgets/specialisit_card.dart';
import 'package:co_rhema/controllers/home/fav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FavDoctorScreen extends StatelessWidget {
  const FavDoctorScreen({Key? key,required this.phs}) : super(key: key);
  final dynamic phs;
  static const IconData verified = IconData(0xe699, fontFamily: 'MaterialIcons');


  @override
  Widget build(BuildContext context) {
    Get.put(FavControllerImp());
    return GetBuilder<FavControllerImp>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: ListView.separated(
          itemCount: controller.favData.length,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              SpecialistCard(favTap: () {
                _showBottomSheet(context,index);
              },
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DetailsScreen(receivedData: controller.data[index],tabIndex: index,)));
                  },
                  receivedData: controller.favData[index],
                  verified: verified,
                  child: SvgPicture.asset(
                    'assets/images/icons/heart.svg', color: myBlueColor,)),
          separatorBuilder: (context, index) => SizedBox(height: 12.0.w,),
        ),
      );
          }
    );
  }

  Future<dynamic> _showBottomSheet(context, index){
    return showModalBottomSheet(context: context,
        isScrollControlled: false,
        backgroundColor: Colors.white,
        barrierColor: Colors.black26,elevation: 0.0,isDismissible: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(26.0.w))),
        builder: (context) => Container(
            padding:const EdgeInsets.symmetric(vertical: 10),
            height: 825.h * 0.4,width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(26.w),topLeft: Radius.circular(26.w)),
            ),
            child: Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0.h),
                      child: Text('240'.tr,style: TextStyle(fontSize: 16.w,color: Colors.black,fontWeight: FontWeight.w500),),
                    ),
                    Container(height: 1.0.w,margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                      decoration:BoxDecoration(
                        color: kColorsLightGrey.withOpacity(0.6),
                      ),),
                    Container(
                      padding: EdgeInsets.fromLTRB(12.0.w,20.0.w,12.0.w,28.0.w,),
                      decoration: BoxDecoration(
/*
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38.withOpacity(0.1), //color of shadow
                              blurRadius: 7.0, //spread radius
                              offset:const Offset(-4, -4),),
                      BoxShadow(
                              color: Colors.black38.withOpacity(0.1), //color of shadow
                              blurRadius: 7.0, //spread radius
                              offset:const Offset(4, 4),),
                          ], // changes position of shadow]
*/
                      ),
                      child: SpecialistCard(bottomSheet: true,onTap: (){}, receivedData: phs[0], verified: verified, child: Container(),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ChoiceButton(width: 140.w,height: 45.w,
                              text:'93'.tr,tColor: myBlueColor,color: kColorsLightBlue100,onTap: (){
                            Get.back();
                          }),
                          GetBuilder<FavControllerImp>(builder: (controller) {
                            return ChoiceButton(width: 140.w,
                                height: 45.w,
                                text: '241'.tr,
                                color: myBlueColor,
                                tColor: Colors.white,
                                onTap: () {
                                  String docId = controller.favData[index]['doctor'];

                                  controller.deleteFromFav(docId).then((isRemoved) {
                                    if (isRemoved && !controller.processing) {
                                      debugPrint(
                                          'Status: $isRemoved >>>>>>>>>>>>>>> Removed from favorites!');
                                      Get.back();
                                    } else if (!isRemoved && controller.processing) {
                                      Get.showSnackbar(GetSnackBar(
                                        margin: EdgeInsets.all(5.w),
                                        message: '175'.tr,
                                        title: '150'.tr,
                                        snackPosition: SnackPosition.TOP,
                                        snackStyle: SnackStyle.FLOATING,));

                                      // controller.showWarningToast(context,title: "150".tr, description: "151".tr);
                                    } else {
                                      // controller.showErrorToast(context,title: "7".tr, description: "152".tr);
                                    }
                                  });
                                });
                          }),
                        ],),
                    )
                  ]),
            )
        ));
  }
}
