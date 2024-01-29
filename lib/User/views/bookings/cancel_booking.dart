import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/home/booking_controller.dart';
import 'package:co_rhema/User/views/appointment/widgets/comment_box.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/appointment/widgets/dot_color.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
class CancelBooking extends StatelessWidget {
  const CancelBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingsControllerImp>(builder: (controller){
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 12.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top:14.0.h),
                  child: CustomDocCard(title:"78".tr, icon: AntDesign.arrowleft,),
                ),

                Padding(
                  padding: EdgeInsets.only(top:16.0.h,bottom: 20.0.h,left: 10.0.w),
                  child: Text('80'.tr,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: const Color(0XFF797979),fontWeight: FontWeight.w500,fontSize: 12.w),),
                ),
                ListView.builder(
                  itemCount: controller.cancellationList.length,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
                  itemBuilder: (context,index) => GestureDetector(
                    onTap: (){
                      controller.selectCancellation(index);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 8.0.w,right: 10.0.w),
                      margin: EdgeInsets.only(bottom: 8.0.h),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DotColor(width:18.w,height: 18.w,
                            color: myBlueColor,isSelected: index == controller.canceled ? true : false,),
                          const Spacer(flex: 1,),
                          Text(controller.cancellationList[index],style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14.w,color: Colors.black,fontWeight: FontWeight.w400),),
                          const Spacer(flex: 18,),
                        ],
                      ),
                    ),
                  ), ),

                Container(margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 20.h),
                  color: const Color(0XFF838383).withOpacity(0.2),height: 1.h,),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0.h,left: 10.0.w),
                  child: Text('81'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500,color: Colors.black87,fontSize: 12.w),),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0.w),
                  child: CommentBox(width: 325.w, height: 140.h, hintText: "82".tr, borderRadius: BorderRadius.circular(8.w)),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomButton(text: '79'.tr,onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
        },),
      );
    });
  }
}
