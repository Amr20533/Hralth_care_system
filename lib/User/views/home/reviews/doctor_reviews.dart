import 'package:cherry_toast/resources/arrays.dart';
import 'package:co_rhema/User/views/auth/widgets/auth/show_cherry_toast.dart';
import 'package:co_rhema/User/views/doc/models/home/review_model.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/appointment/widgets/comment_box.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:co_rhema/controllers/home/fav_controller.dart';
import 'package:co_rhema/controllers/home/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class DoctorReviewScreen extends StatelessWidget {
  const DoctorReviewScreen({Key? key,required this.curIndex}) : super(key: key);
  final int curIndex;
  @override
  Widget build(BuildContext context) {
    Get.put(ReviewControllerImp());
   var ctrl = Get.put(FavControllerImp());

    return Scaffold(
      backgroundColor:Colors.white,
      // backgroundColor:const Color(0xFFFCFCFC),
      body: SizedBox(
        height: 825.h,
        width: 325.w,
        child: SingleChildScrollView(
          child: GetBuilder<ReviewControllerImp>(builder: (controller)
          {
            return Stack(
              children: [

                Container(
                  height: 210.h,
                  padding: EdgeInsets.fromLTRB(16.w, 45.h, 0, 0),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          fit: BoxFit.cover, opacity: 60,
                          image: AssetImage('assets/images/clinc01.jpg')
                      )
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 15.h, right: 16.w),
                    width: 375.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconCircle(onTap: () {
                          Get.back();
                        }, icon: AntDesign.arrowleft,),


                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    // height: 700.h,
                    margin: EdgeInsets.only(top: 180.h),
                    padding: EdgeInsets.only(top: 30.0.w,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(26.w),
                          topEnd: Radius.circular(26.w)),
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(height: 55.0.h,),
                        Text('Dr. Mahmoud Ali', style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 15.0.w),),
                        SizedBox(height: 8.0.h,),
                        Text('Dentist', style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 11.0.w, color: Colors.grey),),
                        SizedBox(height: 30.0.h,),
                        Text('${"236".tr} ${"149".tr}Mahmoud?', style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14.0.w),),
                        SizedBox(height: 20.0.h,),
                        Divider(color: const Color(0XFF838383), height: 0.4.w,),
                        SizedBox(height: 20.0.h,),
                        Text('235'.tr, style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 11.0.w, color: Colors.grey),),
                        Padding(
                          padding: EdgeInsets.only(left: 18.0.w, top: 16.0.h),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                maxRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 55.0.w,
                                itemBuilder: (context, _) =>
                                    AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.bounceInOut,
                                        margin: EdgeInsets.only(right: 12.0.w),
                                        child: const Icon(AntDesign.star,
                                            color: kColorsLightYellow)),
                                onRatingUpdate: (double rating) {
                                  controller.addRating(rating);
                                },
                              ),

                              // ...List.generate(5, (index) => Container(
                              //     margin: EdgeInsets.only(right: 22.0.w),
                              //     child: Icon(AntDesign.star,color: kColorsLightYellow,size: 30.w,))),
                            ],),
                        ),
                        SizedBox(height: 25.0.h,),
                        Divider(color: const Color(0XFF838383), height: 0.4.w,),
                        Padding(padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.0.w),
                                child: Text('199'.tr, style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontSize: 12.0.w,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),),
                              ),
                              SizedBox(height: 10.h,),
                              CommentBox(width: 325.w,
                                height: 80.w,
                                controller: controller.reviewsController,
                                hintText: '178'.tr,
                                borderRadius: BorderRadius.circular(8.0.w),),
                            ],
                          ),)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    // padding: EdgeInsets.all(15.0.w),
                      margin: EdgeInsets.only(top: 140.h),
                      width: 105.w,
                      height: 105.w,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        // shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0.w),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 64.w,
                              backgroundImage: const AssetImage(
                                  'assets/images/docs/m_doc_1.jpg'),),
                            Positioned(bottom: 8.w, right: 3.w,
                                child: Container(width: 19.w,
                                  height: 19.w,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(width: 18.w, height: 18.w,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                      child: Icon(
                                        MaterialIcons.verified, color: myBlueColor,
                                        size: 18.w,)),
                                )),

                          ],
                        ),
                      )
                  ),
                ),

              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: GetBuilder<ReviewControllerImp>(builder: (controller){
        return CustomBottomButton(text: "205".tr, onTap: (){
          String docId = ctrl.favData[curIndex]['doctor'];
            ReviewModel reviewModel = ReviewModel(rating: controller.rating, review: controller.reviewsController.text);
            controller.addReview(docId,reviewModel).then((review){
              if(controller.reviewsController.text.isEmpty){
                return showCherryWarningToast(
                  context,
                  toastPosition: Position.top,
                  title: Text('150'.tr, style: TextStyle(color: Colors.redAccent, fontSize: 16.w, fontWeight: FontWeight.bold)),
                  description: Text('176'.tr, style: const TextStyle(color: Colors.black45)),
                );
              }else if(review == true && !controller.processing){
                debugPrint('successfully added the review>>>>>> $review');
                Get.back();
              }else{
                return showCherryErrorToast(
                  context,
                  toastPosition:Position.top,
                  title: Text('7'.tr, style: TextStyle(color: Colors.redAccent, fontSize: 16.w, fontWeight: FontWeight.bold)),
                  description: Text('177'.tr, style: const TextStyle(color: Colors.black45)),
                );
              }
            });
        },);
      },),

    );

  }
}
