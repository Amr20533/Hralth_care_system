import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/home/review_controller.dart';
import 'package:co_rhema/User/views/home/reviews/doctor_reviews.dart';
import 'package:co_rhema/User/views/home/reviews/hospital_reviews.dart';
import 'package:co_rhema/User/views/home/widgets/custom_form_field.dart';
import 'package:co_rhema/User/views/main/widgets/user_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatelessWidget{
  ReviewScreen({Key? key}) : super(key: key);
  // Get.lazyPut(() => ReviewControllerImp());

  final TextEditingController reviewsController = TextEditingController();
  @override
  Widget build(BuildContext context) {

     return GetBuilder<ReviewControllerImp>(builder: (controller){
      return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0.h,bottom:5.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reviews',style: TextStyle(color:Colors.black,fontSize: 20.h,fontWeight: FontWeight.w600,fontFamily: 'Cairo-Black'),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalReviewScreen()));
                  },
                  child: Row(
                    children: [
                      const Icon(MaterialCommunityIcons.pencil,color: myBlueColor),
                      Text('Add review',style: TextStyle(color:myBlueColor,fontSize: 15.h,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              ],),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: CustomFormField(
                controller: reviewsController,
                hintText: "Search in reviews",
                borderRadius: BorderRadius.circular(16.0.w),
                width: 325.w,height: 40.w,
                focusBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: myBlueColor, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0.w),
                ),
                prefixIcon:const Icon(AntDesign.search1,color: myBlueColor,)),
          ),
          SizedBox(height: 53.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,shrinkWrap: true,
              itemBuilder: (context,index) {
                final item = controller.filterList[index];
                final bool isSelected = controller.selectedItems.contains(item);
                return Padding(
                  padding: EdgeInsets.only(left:12.0.w),
                  child: GestureDetector(
                    onTap: (){
                      controller.toggleItem(item);
                    },
                    child: Container(width: 66.w,height: 28.h,
                        // constraints: BoxConstraints(
                        //   maxHeight: 60.w,maxWidth: 80.w,
                        // ),
                        // padding: EdgeInsets.only(left:8.h),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top:14.h,bottom:14.h),
                        decoration: BoxDecoration(
                          color: isSelected ? myBlueColor : const Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(14.w),
                          border:!isSelected ? Border.all(color:Colors.black45 ,width: 1) : null,
                        ),
                        child:Text(item,style: TextStyle(color: isSelected ? Colors.white : Colors.black,fontSize: item != 'With Photos' ? 14.h : 12.h,fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,)
                    ),
                  ),
                );
              },itemCount: controller.filterList.length,),
          ),
          Divider(color: const Color(0XFF838383),height: 0.6.w,),
          const UserReviews(username: "Dale Thiel", date: "11 month ago",follower: '45 followers', ratings: 5.0, image: "assets/images/user_1.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"),
          const UserReviews(username: "Tiffany Nitzsche", date: "11 month ago",follower: '1.5 followers', ratings: 5.0, image: "assets/images/user_2.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"),

        ],
      );
    });
/*
 return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0.h,bottom:5.h),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Reviews',style: TextStyle(color:Colors.black,fontSize: 20.h,fontWeight: FontWeight.w600,fontFamily: 'Cairo-Black'),),
              Row(
                children: [
                  const Icon(MaterialCommunityIcons.pencil,color: myBlueColor),
                  Text('Add review',style: TextStyle(color:myBlueColor,fontSize: 15.h,fontWeight: FontWeight.w500),),
                ],
              ),
            ],),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: CustomFormField(
              controller: reviewsController,
              hintText: "Search in reviews",
              borderRadius: BorderRadius.circular(16.0.w),
              width: 325.w,height: 40.w,
              focusBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: myBlueColor, width: 2.0),
                borderRadius: BorderRadius.circular(12.0.w),
              ),
              prefixIcon:const Icon(AntDesign.search1,color: myBlueColor,)),
        ),
        SizedBox(height: 53.w,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,shrinkWrap: true,
            itemBuilder: (context,index) {
              final item = controller.filterList[index];
              final bool isSelected = controller.selectedItems.contains(item);
              return Padding(
                padding: EdgeInsets.only(left:12.0.w),
                child: GestureDetector(
                  onTap: (){
                    controller.toggleItem(item);
                  },
                  child: Container(width: 66.w,height: 28.h,
                      // constraints: BoxConstraints(
                      //   maxHeight: 60.w,maxWidth: 80.w,
                      // ),
                      // padding: EdgeInsets.only(left:8.h),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top:14.h,bottom:14.h),
                      decoration: BoxDecoration(
                        color: isSelected ? myBlueColor : const Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.circular(14.w),
                        border:!isSelected ? Border.all(color:Colors.black45 ,width: 1) : null,
                      ),
                      child:Text(item,style: TextStyle(color: isSelected ? Colors.white : Colors.black,fontSize: item != 'With Photos' ? 14.h : 12.h,fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,)
                  ),
                ),
              );
            },itemCount: controller.filterList.length,),
        ),
        Divider(color: const Color(0XFF838383),height: 0.6.w,),
        const UserReviews(username: "Dale Thiel", date: "11 month ago",follower: '45 followers', ratings: 5.0, image: "assets/images/user_1.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"),
        const UserReviews(username: "Tiffany Nitzsche", date: "11 month ago",follower: '1.5 followers', ratings: 5.0, image: "assets/images/user_2.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"),

      ],
    );
 */
  }
}
