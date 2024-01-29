import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/home/review_controller.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/User/views/appointment/package_screen.dart';
import 'package:co_rhema/User/views/appointment/widgets/comment_box.dart';
import 'package:co_rhema/User/views/home/about_screen.dart';
import 'package:co_rhema/User/views/home/gallery_screen.dart';
import 'package:co_rhema/User/views/home/review_screen.dart';
import 'package:co_rhema/User/views/home/specialist_screen.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:co_rhema/User/views/home/widgets/special_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class HospitalReviewScreen extends StatelessWidget {
  const HospitalReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SizedBox(
        height: 825.h,
        width: 325.w,
        child: SingleChildScrollView(
          child: Stack(
            children: [

              Container(
                height: 220.h,
                padding: EdgeInsets.fromLTRB(16.w, 45.h, 0, 0),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        fit: BoxFit.cover,opacity: 60,
                        image: AssetImage('assets/images/clinc01.jpg')
                    )
                ),
                child: Container(
                  padding:  EdgeInsets.only(top:15.h,right: 16.w),
                  width: 375.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconCircle(onTap:(){Get.back();},icon: AntDesign.arrowleft,),
                          const Spacer(flex: 3,),

                          IconCircle(onTap:(){},icon: Icons.share_sharp,),
                          SizedBox(width: 6.w,),
                          Container(width: 33.w,height: 33.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22.0.w),
                              border:Border.all(color: Colors.grey[300]!,width: 1),
                            ),
                            child: Center(child: Opacity(            opacity: 0.5,
                                child: SvgPicture.asset('assets/images/icons/heart-icon.svg',color: Colors.black,width: 15.w,height: 15.w,))),
                          ),
                        ],),

                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width:double.infinity,
                  // height: 700.h,
                  constraints: BoxConstraints(
                    maxHeight: 900.h
                  ),
                  margin:EdgeInsets.only(top:180.h) ,
                  padding: EdgeInsets.only(top:30.0.w,) ,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:BorderRadiusDirectional.only(topStart:Radius.circular(26.w),topEnd:Radius.circular(26.w)),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Text("Serenity Wellness Clinic",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16.0.w,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: 3.0.w,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Text('Dental, Skin care, Eye Care,',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12.0.w,color: const Color(0XFF838383)),),
                      ),
                      SizedBox(height: 8.0.w,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        color: const Color(0XFF838383).withOpacity(0.3),height: 0.6.w,),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0.w,horizontal: 20.w),
                        child: Row(
                          children: [
                            Icon(Icons.location_on,color: myBlueColor,size: 13.w,),
                            SizedBox(width: 1.0.w,),
                            Text("8502 Perston Rd, Inglewood, Maine 98380",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12.0.w,color: const Color(0XFF838383)),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Row(
                          children: [
                            Icon(Icons.watch_later,color: myBlueColor,size: 13.w,),
                            SizedBox(width: 1.0.w,),
                            Text("15 min",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11.0.w,color: const Color(0XFF838383)),),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              width: 3.w,height: 3.w,
                              decoration:const BoxDecoration(
                                shape:BoxShape.circle,
                                color: Colors.black45,
                              ),
                            ),
                            Text("1.5 km",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11.0.w,color: const Color(0XFF838383)),),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              width: 3.w,height: 3.w,
                              decoration:const BoxDecoration(
                                shape:BoxShape.circle,
                                color: Colors.black45,
                              ),
                            ),
                            Text("Mon  Sun  | 11 am - 11pm",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11.0.w,color: const Color(0XFF838383)),),
                          ],
                        ),
                      ),
                      // SizedBox(height: 25.0.h,),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 20.w),
                        margin: EdgeInsets.symmetric(vertical: 25.h),
                        color: const Color(0XFF838383).withOpacity(0.3),height: 0.6.w,),
                      Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Text('Your overall rating of this product',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11.0.w,color: Colors.grey,fontWeight: FontWeight.w600),),
                      Padding(
                        padding: EdgeInsets.only(left: 18.0.w,top: 16.0.h),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(5, (index) => Container(
                                margin: EdgeInsets.only(right: 22.0.w),
                                child: Icon(AntDesign.star,color: kColorsLightYellow,size: 30.w,))),
                          ],),
                      ),
                      SizedBox(height: 30.0.h,),
                      // Divider(color: const Color(0XFF838383),height: 0.4.w,),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:7.0.w),
                              child: Text('Add detailed review',style:Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 12.0.w, fontWeight: FontWeight.w500,color: Colors.black ),),
                            ),
                            SizedBox(height: 10.h,),
                            CommentBox(width: 325.w,height: 80.w,hintText: 'Enter here',borderRadius: BorderRadius.circular(8.0.w),),
                          ],
                        ),),
                      GetBuilder<ReviewControllerImp>(builder: (controller){
                        return Padding(padding: EdgeInsets.symmetric(horizontal: 26.w),
                          child: GestureDetector(
                            onTap: (){
                              controller.addImage();
                            },
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.photo_camera_outlined,color: myBlueColor,size: 15.w,),
                                SizedBox(width: 3.0.w,),
                                Text('add photo',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11.0.w,color: myBlueColor,),),
                              ],
                            ),
                          ),);
                      }),
                      SizedBox(height: 10.h,),
                      GetBuilder<ReviewControllerImp>(builder: (controller){
                        return Padding(padding: EdgeInsets.symmetric(horizontal: 26.w),
                          child: controller.postImage != null ? Container(
                            width: 325.w,height: 325.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(controller.postImage!)
                                )
                            ),
                          ) : Container(),);
                      })


                        ],
                      )

                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    padding: EdgeInsets.only(left: 5.0.w),
                    margin:EdgeInsets.only(top:167.h) ,
                    width: 105.w,height:22.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: myBlueColor,
                      borderRadius: BorderRadius.circular(12.w),
                      // shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 4.0.w),
                      child: Row(
                        children: [
                          Icon(MaterialIcons.star,color: Colors.white,size: 12.w,),
                          SizedBox(width: 3.0.w,),
                          Text("4.8",style:TextStyle(color: Colors.white,fontSize: 10.0.w,fontWeight: FontWeight.w400)),
                          SizedBox(width: 3.0.w,),
                          Text('(1k+ Review)',style:TextStyle(color: Colors.white70.withOpacity(0.9),fontSize: 10.0.w,fontWeight: FontWeight.w400)),
                        ],
                      ),
                    )
                ),
              ),

            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomButton(text:'Submit',onTap:(){

      }),

    );
  }
}


